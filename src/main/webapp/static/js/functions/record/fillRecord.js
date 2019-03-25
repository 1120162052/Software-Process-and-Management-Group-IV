let app = new Vue({
   el: '#app',
   data: {
       user: '',
       urls: {
           update: "/api/sys/user/update",
           getCompleteUserInfo: '/api/sys/user/getCompleteUserInfo',
       },
       fullScreenLoading: false,
       hasSave: false,
       hasSubmit: false,
       dataForm: {
           marketName: '',
           contactName: '',
           contactMobile: '',
           contactPhone: '',
           fax: ''
       },
       rules: {
           marketName: [
               { required: true, message: '请输入人力资源市场名称', trigger: 'blur' }
           ],
           contactName: [
               { required: true, message: '请输入联系人姓名', trigger: 'blur' }
           ],
           contactMobile: [
               { required: true, message: '请输入联系人手机', trigger: 'blur' }
           ],
           contactPhone: [
               { required: true, message: '请输入人力资源市场联系电话', trigger: 'blur' }
           ],
           fax: [
               { required: true, message: '请输入人力资源市场传真', trigger: 'blur' }
           ],
       }
   },
    methods: {
        submitForm(formName) {
            let app = this;
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    let data = app.user;
                    data.status = 1;    //审核中
                    data.marketName = app.dataForm.marketName;
                    data.contactName = app.dataForm.contactName;
                    data.contactMobile = app.dataForm.contactMobile;
                    data.contactPhone = app.dataForm.contactPhone;
                    data.fax = app.dataForm.fax;
                    app.fullScreenLoading = true;
                    ajaxPostJSON(app.urls.update, data, function (d) {
                        app.fullScreenLoading = false;
                        if (d.code === 'success') {
                            app.hasSubmit = true;
                            // parent.app.reGetUserInfo();
                            window.parent.app.showMessage('上传成功', 'success');
                            return true;
                        } else {
                            window.parent.app.showMessage('上传失败', 'error');
                            return false;
                        }
                    });
                } else {
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    },
    mounted: function () {
        let app = this;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function(d){
            app.user = d.data;
            // console.log(d.data);
            if (app.user.status !== 0) {
                app.hasSubmit = true;
                app.dataForm.marketName = app.user.marketName;
                app.dataForm.contactName = app.user.contactName;
                app.dataForm.contactMobile = app.user.contactMobile;
                app.dataForm.contactPhone = app.user.contactPhone;
                app.dataForm.fax = app.user.fax;
                app.$message({
                    showClose: true,
                    message: '备案信息已经提交，不可再作更改'
                });
            } else {
                app.$message({
                    showClose: true,
                    message: '尚未填写'
                });
            }
        });
        // console.log(app.user);
    }
});