let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: false,
        options: [{
            value: 'default',
            label: '全部'
        }, {
            value: 'waitToBeChecked',
            label: '未审核'
        }, {
            value: 'haveBeenApproved',
            label: '已通过'
        }, {
            value: 'haveBeenRejected',
            label: '已退回'
        }],
        selectedOptions: [],
        beingViewedRecord: '',
        table: {
            data: [{
                id: 0,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 1,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 2,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 3,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 4,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 5,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 6,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 7,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 8,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }, {
                id: 9,
                username: 'testName',
                cityBelongTo: '北京市',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operatable: true
            }],
            loading: false,
            selectionList: [],
            params: {
                pageIndex: 1,
                pageSize: 10,
                pageSizes: [5, 10, 20, 40],
                searchKey: '',  // 搜索词
                total: 10,       // 总数
            }
        },
        dialog: {
            viewDetail: {
                visible: false,
                loading: false,
                recordData: [{
                    infoName: '人力资源市场名',
                    infoValue: 'A市某人力资源市场'
                }, {
                    infoName: '所属地区',
                    infoValue: 'A市',
                }, {
                    infoName: '联系人',
                    infoValue: '张三'
                }, {
                    infoName: '联系人手机',
                    infoValue: '18810507577'
                }, {
                    infoName: '联系电话',
                    infoValue: '0731-4802110'
                }, {
                    infoName: '传真',
                    infoValue: '一个传真'
                }]
            }
        }
    },
    methods: {
        //处理筛选条件变化
        handleChange(value) {
            // console.log(value[0]);
            if (value[0] === 'default') {

            } else if (value[0] === 'waitToBeChecked') {
                this.table.data = this.table.data.filter(function (val) {
                    return val.filingStatus === '未审核';
                });
            } else if (value[0] === 'haveBeenApproved') {
                this.table.data = this.table.data.filter(function (val) {
                    return val.filingStatus === '已通过';
                });
            } else if (value[0] === 'haveBeenRejected') {
                this.table.data = this.table.data.filter(function (val) {
                    return val.filingStatus === '已退回';
                });
            }
        },
        // 处理pageSize变化
        handleSizeChange: function (newSize) {
            this.table.params.pageSize = newSize;
            //this.getUserList();
        },
        // 处理选中的行变化
        handleSelectionChange: function (val) {
            this.table.selectionList = val;
        },
        // 处理pageIndex变化
        handleCurrentChange: function (newIndex) {
            this.table.params.pageIndex = newIndex;
            //this.getUserList();
        },
        // 处理查看备案
        handleViewRecord: function(val) {
            this.dialog.viewDetail.visible = true;
            this.beingViewedRecord = val;
        },
        // 处理通过或批量通过备案
        handleApproveRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length == 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认通过备案', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'info'
            }).then(() => {
                let idList = [];
                if(type === 'single') {
                    let id = val;
                    idList.push({
                        id: id
                    });
                    this.dialog.viewDetail.visible = false;
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        idList.push({
                            id: selectionList[i].id
                        });
                    }
                }
                // 以下应该为前后端交互代码，暂时只有前端
                let bool = false;
                for (let i = 0; i < idList.length; i++) {
                    for (let j = 0; j < this.table.data.length; j++) {
                        if (idList[i].id === this.table.data[j].id) {
                            if (this.table.data[j].filingStatus !== '未审核') {
                                bool = true;
                                break;
                            }
                            this.table.data[j].filingStatus = '已通过';
                            this.table.data[j].operatable = false;
                            break;
                        }
                    }
                }
                if (bool) {
                    window.parent.app.showMessage('提示：所选项包含已处理过的备案', 'info');
                }
            }).catch(() => {
                window.parent.app.showMessage('已取消通过', 'warning');
            });
        },
        // 处理退回和批量退回备案
        handleRejectRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length == 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认退回备案', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                let idList = [];
                if(type === 'single') {
                    let id = val;
                    idList.push({
                        id: id
                    });
                    this.dialog.viewDetail.visible = false;
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        idList.push({
                            id: selectionList[i].id
                        });
                    }
                }
                // 以下应该为前后端交互代码，暂时只有前端
                let bool = false;
                for (let i = 0; i < idList.length; i++) {
                    for (let j = 0; j < this.table.data.length; j++) {
                        if (idList[i].id === this.table.data[j].id) {
                            if (this.table.data[j].filingStatus !== '未审核') {
                                bool = true;
                                break;
                            }
                            this.table.data[j].filingStatus = '已退回';
                            this.table.data[j].operatable = false;
                            break;
                        }
                    }
                }
                if (bool) {
                    window.parent.app.showMessage('提示：所选项包含已处理过的备案', 'info');
                }
            }).catch(() => {
                window.parent.app.showMessage('已取消退回', 'warning');
            });
        }
    }
});