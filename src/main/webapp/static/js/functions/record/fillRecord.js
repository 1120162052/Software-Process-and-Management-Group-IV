let app = new Vue({
   el: '#app',
   data: {
       urls: {
           getRecordInfo: "api/sys/user/getRecordInfo"
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
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    window.parent.app.showMessage('上传成功', 'success');
                    this.hasSubmit = true;
                } else {
                    // console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    },
    mounted: function () {
        let data = null;
        let app = this;
        app.fullScreenLoading = true;
        ajaxPost(this, )
    }
});