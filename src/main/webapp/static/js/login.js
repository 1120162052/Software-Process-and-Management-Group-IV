var app = new Vue({
    el: '#app',
    data: {
        formData: {
            username: '',
            password: ''
        },
        fullScreenLoading: false
    },
    methods: {
        login: function () {
            var url = "/login";
            var data = copy(this.formData);
            this.fullScreenLoading = true;
            var app = this;
            ajaxPost(url, data, function (d) {
                app.fullScreenLoading = false;
                if (d.code == 'success') {
                    location.href = "/";
                    console.log("登陆成功");
                } else {
                    console.log("登陆失败");
                }
            })
        }
    }
});