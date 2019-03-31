/**
 * 验证用户名
 * @param rule
 * @param value
 * @param callback
 */
let validateUsername = function (rule, value, callback) {
    let url = '/api/sys/user/checkUsername';
    let data = {
        username: value
    };
    if (value == null || value.length === 0) {
        callback(new Error('用户名不能为空'));
        return;
    }
    ajaxPostJSON(url, data, function (d) {
        if (d.code === 'error') {
            callback(new Error('用户名已被注册'));
            callback(new Error('用户名已被注册'));
        } else {
            callback();
        }
    })
};

let app = new Vue({
    el: '#app',
    data: {
        urls: {
            getUserList: "/api/sys/user/getList",
            putUser: '/api/sys/user/put',
            updateUser: '/api/sys/user/update',
            deleteUserList: '/api/sys/user/deleteList',
            getAllRoleList: '/api/sys/role/getAllList',
            getCompleteUserInfo: '/api/sys/user/getCompleteUserInfo',
            getCityList: '/api/sys/dict/selectSonList',
        },
        userTypeMap: [
            "管理员",
            "省用户",
            "市用户",
            "监测点用户"
        ],
        user: '',
        fullScreenLoading: false,
        cityList: [],
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
            },
            expandKeys: []
        },
        dialog: {
            isMonitorPoint: false,
            isCity: false,
            options: [{
                value: 2,
                label: '市用户'
            },{
                value: 3,
                label: '监测点用户'
            }],
            addUser: {
                visible: false,
                loading: false,
                formData: {
                    id: '',
                    username: '',
                    password: '',
                    userType: '',
                    cityId: '',
                    provinceId: '',
                    roleList: []
                },
                rules: {
                    username: [
                        {validator: validateUsername, trigger: 'blur'},
                        {validator: validateUsername, trigger: 'change'},
                    ],
                    password: [
                        {required: true, message: '密码不能为空', trigger: 'blur'},
                        {required: true, message: '密码不能为空', trigger: 'change'},
                    ],
                    userType: [
                        {required: true, message: '用户类型不能为空', trigger: 'blur'},
                        {required: true, message: '用户类型不能为空', trigger: 'change'},
                    ],
                    cityId: [
                        {required: true, message: '市级信息缺失', trigger: 'blur'},
                        {required: true, message: '市级信息缺失', trigger: 'change'},
                    ]
                },
            },
            editUser: {
                visible: false,
                loading: false,
                formData: {
                    id: '', // 动态初始化为当前选择的用户的id
                    username: 'null', // 不可编辑
                    password: 'null',
                    userType: '',
                    cityId: '',
                    roleList: []
                },
                rules: {
                    password: [
                        {required: true, message: '密码不能为空', trigger: 'blur'},
                        {required: true, message: '密码不能为空', trigger: 'change'},
                    ],
                    userType: [
                        {required: true, message: '用户类型不能为空', trigger: 'blur'},
                        {required: true, message: '用户类型不能为空', trigger: 'change'},
                    ],
                    cityId: [
                        {required: true, message: '市级信息缺失', trigger: 'blur'},
                        {required: true, message: '市级信息缺失', trigger: 'change'},
                    ]
                }
            }
        },
        options: {
            roleList: [], // 页面初始化时从后端获取
        }
    },
    methods: {
        // 刷新table的数据
        getUserList: function () {
            let data = {
                id: this.user.id,
                username: this.user.username,
                userType: this.user.userType,
                provinceId: this.user.provinceId,
                page: this.table.params
            };
            let app = this;
            this.table.loading = true;
            ajaxPostJSON(this.urls.getUserList, data, function (d) {
                app.table.loading = false;
                app.table.data = d.data.resultList;
                app.table.params.total = d.data.total;
            });
        },
        getCityList: function() {
            let app = this;
            let data = {
                id: this.user.provinceId
            };
            this.fullScreenLoading = true;
            ajaxPostJSON(this.urls.getCityList, data, function (d) {
                app.fullScreenLoading = false;
                for(let i = 0; i < d.data.length; i++) {
                    app.cityList.push({
                        label: d.data[i].nameCn,
                        value: d.data[i].id
                    });
                }
            });
        },
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
        // 展开行或收起行时调用
        expandChange: function(row, expandedRows) {
            if(expandedRows.length > 0) {
                this.table.expandKeys = [];
                this.table.detailInfoLoading = true;
                if(row) {
                    this.table.expandKeys.push(row.id);
                }
            } else {
                this.table.expandKeys = [];
                this.table.detailInfoLoading = true;
            }
        },
        getRowKeys: function(row){
            return row.id;
        },
        // 添加用户时，当用户的类型被选定时调用此方法（用户类型即用户角色）
        onUserTypeSelected: function(selectedType) {
            // 当选择的用户是r4（即检测点用户）
            if(selectedType === 3) {
                this.dialog.isMonitorPoint = true;
                this.dialog.isCity = false;
                this.dialog.addUser.formData.roleList = [];
                this.dialog.editUser.formData.roleList = [];
                this.dialog.addUser.formData.roleList.push({
                    id: 'r4'
                });
                this.dialog.editUser.formData.roleList.push({
                    id: 'r4'
                });
            } else if(selectedType === 2) {
                this.dialog.isMonitorPoint = false;
                this.dialog.isCity = true;
                this.dialog.addUser.formData.roleList = [];
                this.dialog.editUser.formData.roleList = [];
                this.dialog.addUser.formData.roleList.push({
                    id: 'r3'
                });
                this.dialog.editUser.formData.roleList.push({
                    id: 'r3'
                });
            }
        },
        onUserTypeCleared: function() {
            this.dialog.addUser.formData.userType = '';
            this.dialog.isMonitorPoint = false;
            this.dialog.isCity = false;
        },
        // 打开编辑用户窗口
        openEditUser: function (userInfo) {
            this.dialog.editUser.visible = true;
            this.dialog.editUser.formData = copy(userInfo);
        },
        addUser: function() {
            this.$refs['form_addUser'].validate((valid) => {
                if (valid) {
                    let data = this.dialog.addUser.formData;
                    data.provinceId = this.user.provinceId;
                    let app = this;
                    app.dialog.addUser.loading = true;
                    ajaxPostJSON(this.urls.putUser, data, function () {
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
        resetForm: function (ref) {
            this.$refs[ref].resetFields();
            this.dialog.isMonitorPoint = this.dialog.isCity = false;
        },
        // 编辑用户信息提交
        editUser: function () {
            // 首先检测表单数据是否合法
            this.$refs['form_editUser'].validate((valid) => {
                if (valid) {
                    let data = this.dialog.editUser.formData;
                    let app = this;
                    app.dialog.editUser.loading = true;
                    ajaxPostJSON(this.urls.updateUser, data, function () {
                        app.dialog.editUser.loading = false;
                        app.dialog.editUser.visible = false;
                        window.parent.app.showMessage('编辑成功！', 'success');
                        app.getUserList(); // 编辑完成后刷新页面
                    }, function () {
                        app.dialog.editUser.loading = false;
                        app.dialog.editUser.visible = false;
                        window.parent.app.showMessage('编辑失败！', 'error');
                    });
                } else {
                    console.log("表单数据不合法！");
                    return false;
                }
            });
        },
        // 删除指定id的用户
        deleteUser: function (val, type = 'multi') {
            // 未选中任何用户的情况下点选批量删除
            if (type === 'multi' && val.length === 0) {
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
                    idList.push({
                        id: val
                    });
                } else {
                    let selectionList = val;
                    for (let i = 0; i < selectionList.length; i++) {
                        idList.push({
                            id: selectionList[i].id
                        });
                    }
                }
                let data = idList;
                let app = this;
                app.fullScreenLoading = true;
                ajaxPostJSON(app.urls.deleteUserList, data, function () {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('删除成功！', 'success');
                    if (app.table.data.length === 1 && app.table.params.pageIndex > 0)
                        app.table.params.pageIndex -= 1;
                    app.getUserList();
                }, function () {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('删除失败！', 'success');
                })
            }).catch(() => {
                window.parent.app.showMessage('已取消删除', 'warning');
            });
        },
    },
    mounted: function () {
        // 获取该省所属的市和检测点用户列表
        let app = this;
        app.fullScreenLoading = true;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function(d){
            app.user = d.data;
            ajaxPost(app.urls.getAllRoleList, null, function (d) {
                app.fullScreenLoading = false;
                d.data = d.data.filter((val) => {
                    return val.code === 'city' || val.code === 'point';
                });
                app.options.roleList = d.data;
                app.getUserList();
                app.getCityList();
            });
        });
    }
});