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
        } else {
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
            },
            editUser: {
                visible: false,
                loading: false,
                formData: {
                    id: '', // 动态初始化为当前选择的用户的id
                    username: '', // 不可编辑
                    password: ''
                },
                rules: {
                    password: [
                        {required: true, message: '密码不能为空', trigger: 'blur'},
                        {required: true, message: '密码不能为空', trigger: 'change'},
                    ]
                }
            }
        }
    },
    methods: {
        // 处理选中的行变化
        handleSelectionChange: function (val) {
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
                    ajaxPost(url, data, function (d) {
                        app.dialog.addUser.loading = false;
                        app.dialog.addUser.visible = false;
                        window.parent.app.showMessage('添加成功！', 'success');
                        app.getUserList(); // 添加完成后刷新页面
                    }, function () {
                        app.dialog.addUser.loading = false;
                        app.dialog.addUser.visible = false;
                        window.parent.app.showMessage('添加失败！', 'error');
                    });
                } else {
                    console.log("表单数据不合法！");
                    return false;
                }
            });
        },
        // 重置表单
        resetForm: function(ref){
            this.$refs[ref].resetFields();
        },
        // 测试按钮
        test: function () {
            this.dialog.addUser.visible = true;
            this.$refs['form_addUser'].resetFields();
        },
        // 删除指定id的用户
        deleteUser: function (val, type = 'multi') {
            // 未选中任何用户的情况下点选批量删除
            if (type === 'multi' && val.length == 0) {
                window.parent.app.showMessage('提示：未选中任何用户', 'warning');
                return;
            }
            window.parent.app.$confirm('确认删除选中的用户', '警告', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                let idList = [];
                if (type === 'single') {
                    let id = val;
                    idList.push(id);
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        idList.push(selectionList[i].id);
                    }
                }
                let url = '/functions/sys/userManager/deleteUser';
                let data = {
                    idList: idList
                };
                let app = this;
                app.fullScreenLoading = true;
                ajaxPost(url, data, function (d) {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('删除成功！', 'success');
                    app.getUserList();
                })
            }).catch(() => {
                window.parent.app.showMessage('已取消删除', 'warning');
            });
        },
        // 打开编辑用户窗口
        openEditUser: function (userInfo) {
            this.dialog.editUser.visible = true;

        },
    },
    mounted: function () {
        this.getUserList();
    }
});

$(document).ready(function () {

});