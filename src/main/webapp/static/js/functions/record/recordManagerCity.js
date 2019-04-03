let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: false,
        user: '',
        urls: {
            getCompleteUserInfo: '/api/sys/user/getCompleteUserInfo',
            getUserList: '/api/sys/user/getList',
            updateUserList: '/api/sys/user/updateList',
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
            //下属的且已提交备案的监测点列表
            data: [{
                id: 0,
                username: 'testName',
                cityBelongTo: '北京市',
                recordStatus: '未审核',
                reportStatus: '未报审',
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
                if(app.table.data != null) {
                    for(let i = 0; i < app.table.data.length; i++) {
                        if(app.table.data[i].recordStatus === 1) {
                            app.table.data[i].recordStatus = '未审核';
                            app.table.data[i].recordStatus2 = '未报审';
                            app.table.data[i].operate = true;
                        } else if(app.table.data[i].recordStatus === 2 || app.table.data[i].recordStatus === 3) {
                            app.table.data[i].recordStatus = '已通过';
                            app.table.data[i].recordStatus2 = '已报审';
                            app.table.data[i].operate = false;
                        } else if(app.table.data[i].recordStatus === 4) {
                            app.table.data[i].recordStatus = '已退回';
                            app.table.data[i].recordStatus2 = '未报审';
                            app.table.data[i].operate = false;
                        }
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
        // 处理查看备案
        handleViewRecord: function(val) {
            this.dialog.viewDetail.visible = true;
            this.dialog.viewDetail.recordData = [];
            this.dialog.viewDetail.recordData.push({
                infoName: '人力资源市场名',
                infoValue: val.marketName
            });
            this.dialog.viewDetail.recordData.push({
                infoName: '所属市',
                infoValue: val.city.nameCn
            });
            this.dialog.viewDetail.recordData.push({
                infoName: '联系人',
                infoValue: val.contactName
            });
            this.dialog.viewDetail.recordData.push({
                infoName: '联系人手机',
                infoValue: val.contactMobile
            });
            this.dialog.viewDetail.recordData.push({
                infoName: '联系电话',
                infoValue: val.contactPhone
            });
            this.dialog.viewDetail.recordData.push({
                infoName: '传真',
                infoValue: val.fax
            });
            this.beingViewedRecord = val;
        },
        // 处理通过或批量通过备案
        handleApproveRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length === 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认通过备案', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'info'
            }).then(() => {
                let userList = [];
                if(type === 'single') {
                    val.recordStatus = 2;
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
                                recordStatus: 2
                            });
                        }
                    }
                }
                if(userList.length === 0) {
                    window.parent.app.showMessage('未选中可操作备案', 'info');
                    return;
                }
                this.fullScreenLoading = true;
                let app = this;
                ajaxPostJSON(this.urls.updateUserList, userList, function(d) {
                    window.parent.app.showMessage('通过成功', 'success');
                    app.table.params.pageIndex = 1;
                    app.getUserList();
                }, function() {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('通过失败', 'error');
                });
            }).catch(() => {
                window.parent.app.showMessage('已取消通过', 'warning');
            });
        },
        // 处理退回和批量退回备案
        handleRejectRecord: function (val = this.beingViewedRecord, type = 'multi') {
            if (type === 'multi' && val.length === 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认退回备案', '确认', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                let userList = [];
                if(type === 'single') {
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
                    window.parent.app.showMessage('未选中可操作备案', 'info');
                    return;
                }
                this.fullScreenLoading = true;
                let app = this;
                ajaxPostJSON(this.urls.updateUserList, userList, function(d) {
                    window.parent.app.showMessage('退回成功', 'success');
                    app.table.params.pageIndex = 1;
                    app.getUserList();
                }, function() {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('退回失败', 'error');
                });
            }).catch(() => {
                window.parent.app.showMessage('已取消退回', 'warning');
            });
        }
    },
    mounted: function() {
        let app = this;
        app.fullScreenLoading = true;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function (d) {
            app.user = d.data;
            app.user.actionType = 1;    //查询备案动作
            app.getUserList();
        });
    }
});