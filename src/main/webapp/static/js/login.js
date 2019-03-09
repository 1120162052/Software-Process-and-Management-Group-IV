let app = new Vue({
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
            let url = "/login";
            let data = copy(this.formData);
            this.fullScreenLoading = true;
            let app = this;
            ajaxPost(url, data, function (d) {
                app.fullScreenLoading = false;
                console.log(d);
                if (d.code == 'success') {
                    location.href = "/";
                    console.log("登陆成功");
                } else {
                    console.log("登陆失败");
                }
            })
        },
        test: function () {
            let url = '/login/test';
            let data = null;
            ajaxPost(url, data, function (d) {
                console.log(d);
            })
        }
    }
});