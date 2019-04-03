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
        submitForm(formName, operateType) {
            let app = this;
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    let data = app.user;
                    if(operateType === 'onlySave') {
                        data.recordStatus = 0;
                    } else if(operateType === 'saveAndSubmit') {
                        data.recordStatus = 1;    //审核中
                    }
                    data.marketName = app.dataForm.marketName;
                    data.contactName = app.dataForm.contactName;
                    data.contactMobile = app.dataForm.contactMobile;
                    data.contactPhone = app.dataForm.contactPhone;
                    data.fax = app.dataForm.fax;
                    app.fullScreenLoading = true;
                    ajaxPostJSON(app.urls.update, data, function (d) {
                        app.fullScreenLoading = false;
                        if (d.code === 'success') {
                            if(operateType === 'saveAndSubmit') {
                                app.hasSubmit = true;
                            }
                            window.parent.app.showMessage('操作成功', 'success');
                            return true;
                        } else {
                            window.parent.app.showMessage('操作失败', 'error');
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
            app.dataForm.marketName = app.user.marketName;
            app.dataForm.contactName = app.user.contactName;
            app.dataForm.contactMobile = app.user.contactMobile;
            app.dataForm.contactPhone = app.user.contactPhone;
            app.dataForm.fax = app.user.fax;
            /**
             * 状态0：尚未提交
             * 状态1：已提交、市审核中
             * 状态2：市审核通过、省审核中
             * 状态3：省审核通过
             * 状态4：未通过审核
             */
            if (app.user.recordStatus !== 0) {
                app.hasSubmit = true;
                if(app.user.recordStatus === 4) {
                    app.hasSubmit = false;
                    app.$message({
                        showClose: true,
                        message: '备案信息未通过审核，请重新填写'
                    });
                } else if(app.user.recordStatus === 3) {
                    app.$message({
                        showClose: true,
                        message: '备案信息已经通过审核'
                    });
                } else {
                    app.$message({
                        showClose: true,
                        message: '备案信息已经提交等待上级审核，不可再作更改'
                    });
                }

            } else {
                app.$message({
                    showClose: true,
                    message: '尚未提交'
                });
            }
        });
    }
});