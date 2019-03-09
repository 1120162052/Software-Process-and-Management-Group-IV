let validateUsername = function (rule, value, callback) {
    let url = '/functions/sys/userManager/validateUsername';
    let data = {
        username: value
    };
    if (value == null || value.length == 0) {
        callback(new Error('用户名不能为空'));
        return;
    }
    ajaxPost(url, data, function (d) {
        if (d.code == 'error') {
            callback(new Error('用户名已被注册'));
        }
        else {
            callback();
        }
    })
};

let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: false,
        table: {
            data: [],
            loading: false,
            selectionList: [],
            params: {
                pageIndex: 1,
                pageSize: 10,
                pageSizes: [5, 10, 20, 40],
                searchKey: '',  // 搜索词
                total: 2,       // 总数
            }
        },
        dialog: {
            addUser: {
                visible: false,
                loading: false,
                formData: {
                    username: '',
                    password: ''
                },
                rules: {
                    username: [
                        {validator: validateUsername, trigger: 'blur'},
                        {validator: validateUsername, trigger: 'change'},
                    ],
                    password: [
                        {required: true, message: '密码不能为空', trigger: 'blur'},
                        {required: true, message: '密码不能为空', trigger: 'change'},
                    ]
                },
            }
        }
    },
    methods: {
        // 处理选中的行变化
        handleSelectionChange: function (val) {
            console.log(val);
            this.table.selectionList = val;
        },
        // 处理pageSize变化
        handleSizeChange: function (newSize) {
            this.table.params.pageSize = newSize;
            this.getUserList();
        },
        // 处理pageIndex变化
        handleCurrentChange: function (newIndex) {
            this.table.params.pageIndex = newIndex;
            this.getUserList();
        },
        // 刷新table的数据
        getUserList: function () {
            let url = "/functions/sys/userManager/getUserList";
            let data = {
                pageIndex: this.table.params.pageIndex,
                pageSize: this.table.params.pageSize,
                searchKey: this.table.params.searchKey
            };
            let app = this;
            this.table.loading = true;
            ajaxPostJSON(url, data, function (d) {
                app.table.loading = false;
                app.table.data = d.data.resultList;
                app.table.params.total = d.data.total;
            });
        },
        // 添加用户
        addUser: function () {
            // 首先检测表单数据是否合法
            this.$refs['form_addUser'].validate((valid) => {
                if (valid) {
                    let url = "/functions/sys/userManager/addUser";
                    let data = {
                        username: this.dialog.addUser.formData.username,
                        password: this.dialog.addUser.formData.password
                    };
                    let app = this;
                    app.dialog.addUser.loading = true;
                    setTimeout(function () {
                        ajaxPost(url, data, function (d) {
                            app.dialog.addUser.loading = false;
                            app.dialog.addUser.visible = false;
                            window.parent.app.showMessage('添加成功！', 'success');
                            app.getUserList(); // 添加完成后刷新页面
                        });
                    }, 1000);
                } else {
                    console.log("表单数据不合法！");
                    return false;
                }
            });
        },
        // 重置添加用户表单
        resetAddUserForm: function () {
            this.$refs['form_addUser'].resetFields();
        },
        // 测试按钮
        test: function () {
            this.dialog.addUser.visible = true;
            this.$refs['form_addUser'].resetFields();
        }
    },
    mounted: function () {
        this.getUserList();
    }
});

$(document).ready(function () {

});