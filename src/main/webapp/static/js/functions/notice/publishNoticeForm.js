app = new Vue({
    el: '#app',
    data: {
        formData: {
            title: '',                  // 通知标题
            content: '',                // 通知内容
            userList: [
                // {id: 'u1', username: 'admin'},
                // {id: 'u2', username: 'admin'},
                // {id: 'u3', username: 'admin'},
                // {id: 'u4', username: 'admin'},
                // {id: 'u5', username: 'admin'},
                // {id: 'u11', username: 'admin'},
                // {id: 'u21', username: 'admin'},
                // {id: 'u31', username: 'admin'},
                // {id: 'u41', username: 'admin'},
                // {id: 'u51', username: 'admin'},
            ],               // 接收用户列表
        },
        formRule: {},
        userTable: {
            data: [],
            loading: false,
            visible: false,
            page: {
                pageIndex: 1,
                pageSize: 10,
                searchKey: '',
                total: 0
            }
        },
        urls: {
            selectUserListByPage: '/api/sys/user/selectListByPage2',
            insertOrUpdateNotice: '/api/notice/noticePublish/insertOrUpdate',
            selectNoticeListByPage: '/api/notice/noticePublish/selectListByPage'
        },
        loading: {
            submit: false
        }
    },
    methods: {
        onTagClose: function (event, name) {
            let userList = this.formData.userList;
            for (let i = 0; i < userList.length; i++) {
                if (userList[i].id === name) {
                    userList.splice(i, 1);
                    return;
                }
            }
        },
        showUserTable: function () {
            this.userTable.visible = true;
            this.refreshTable();
        },
        // get user list according to (page, exist user list, searchKey)
        refreshTable: function () {
            let data = {
                page: this.userTable.page,
                exceptUserList: this.formData.userList
            };
            let app = this;
            app.userTable.loading = true;
            ajaxPostJSON(app.urls.selectUserListByPage, data, function (d) {
                app.userTable.loading = false;
                app.userTable.data = d.data.resultList;
                app.userTable.page.total = d.data.total;
            })
        },
        // add user to receiver list
        addUserToList: function (user) {
            this.formData.userList.push(user);
            this.refreshTable();
        },
        submit: function () {
            let data = this.formData;
            let app = this;
            app.loading.submit = true;
            ajaxPostJSON(app.urls.insertOrUpdateNotice, data, function (d) {
                app.loading.submit = false;
                window.parent.app.dialog.visible = false;
            })
        }
    }
});