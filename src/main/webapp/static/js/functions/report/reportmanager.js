let app  = new Vue({
    el: '#app',
    data: {
        fullScreenLoading:false,
        user: '',
        urls: {
            getCompleteUserInfo: '/api/sys/Dict/getCompleteUserInfo',
            getUserList: '/api/sys/Dict/getList',
            updateUserList: '/api/sys/Dict/updateList',

        },
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
                pointName: 'testName',
                people: '张某',
                telephone: '15685412597',
                submitTime: '2019/03/17',
                filingStatus: '未审核',
                operate: true
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
                recordData: []
            }
        }
    },
    methods: {
        getUserList: function() {
            this.user.page = this.table.params;
            let app = this;
            ajaxPostJSON(this.urls.getUserList, this.user, function(d){
                app.fullScreenLoading = false;
                app.table.data = d.data.resultList;
                for(let i = 0; i < app.table.data.length; i++) {
                    if(app.table.data[i].recordStatus === 2) {
                        app.table.data[i].recordStatus = '未审核';
                        app.table.data[i].operate = true;
                    } else if(app.table.data[i].recordStatus === 3) {
                        app.table.data[i].recordStatus = '已通过';
                        app.table.data[i].operate = false;
                    } else if(app.table.data[i].recordStatus === 4) {
                        app.table.data[i].recordStatus = '已退回';
                        app.table.data[i].operate = false;
                    }
                }
                app.table.params.total = d.data.total;
            });
        },
        //处理筛选条件变化
        handleChange(value) {
            this.table.params.pageIndex = 1;
            this.fullScreenLoading = true;
            if (value[0] === 'default') {
                this.user.actionType = 1;
            } else if (value[0] === 'waitToBeChecked') {
                this.user.actionType = 11;
            } else if (value[0] === 'haveBeenApproved') {
                this.user.actionType = 12;
            } else if (value[0] === 'haveBeenRejected') {
                this.user.actionType = 13;
            }
            this.getUserList();
        },
        // 处理pageSize变化
        handleSizeChange: function (newSize) {
            this.table.params.pageSize = newSize;
            this.getUserList();
        },
        // 处理选中的行变化
        handleSelectionChange: function (val) {
            this.table.selectionList = val;
        },
        // 处理pageIndex变化
        handleCurrentChange: function (newIndex) {
            this.table.params.pageIndex = newIndex;
            this.getUserList();
        },
        // 处理通过或批量通过报表
        handleApproveRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length === 0) {
                window.parent.app.showMessage('提示：未选中任何报表', 'warning');
                return;
            }
            window.parent.app.$confirm('确认通过报表', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'info'
            }).then(() => {
                let userList = [];
                if(type === 'single' && val.recordStatus === '未审核') {
                    val.recordStatus = 3;
                    userList.push({
                        id: val.id,
                        recordStatus: val.recordStatus
                    });
                    this.dialog.viewDetail.visible = false;
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        if(selectionList[i].recordStatus === '未审核') {
                            userList.push({
                                id: selectionList[i].id,
                                recordStatus: 3
                            });
                        }
                    }
                }
                if(userList.length === 0) {
                    window.parent.app.showMessage('未选中可操作报表', 'info');
                    return;
                }
                this.fullScreenLoading = true;
                let app = this;
                ajaxPostJSON(this.urls.updateUserList, userList, function(d) {
                    window.parent.app.showMessage('批量通过成功', 'success');
                    app.table.params.pageIndex = 1;
                    app.getUserList();
                }, function() {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('批量通过失败', 'error');
                });
            }).catch(() => {
                window.parent.app.showMessage('已取消通过', 'warning');
            });
        },
        // 处理退回和批量退回报表
        handleRejectRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length === 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认退回报表', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                let userList = [];
                if(type === 'single' && val.recordStatus === '未审核') {
                    val.recordStatus = 4;
                    userList.push({
                        id: val.id,
                        recordStatus: val.recordStatus
                    });
                    this.dialog.viewDetail.visible = false;
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        if(selectionList[i].recordStatus === '未审核'){
                            userList.push({
                                id: selectionList[i].id,
                                recordStatus: 4
                            });
                        }
                    }
                }
                if(userList.length === 0) {
                    window.parent.app.showMessage('未选中可操作报表', 'info');
                    return;
                }
                this.fullScreenLoading = true;
                let app = this;
                ajaxPostJSON(this.urls.updateUserList, userList, function(d) {
                    window.parent.app.showMessage('批量退回成功', 'success');
                    app.table.params.pageIndex = 1;
                    app.getUserList();
                }, function() {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('批量退回失败', 'error');
                });
            }).catch(() => {
                window.parent.app.showMessage('已取消退回', 'warning');
            });
        }
    },
    mounted: function () {
        let app = this;
        app.fullScreenLoading = true;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function (d) {
            app.user = d.data;
            app.user.actionType = 1;    //查询报表动作
            app.getUserList();
        });
    }

});