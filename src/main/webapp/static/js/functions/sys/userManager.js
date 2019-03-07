let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: true,
        table: {
            data: [],
            loading: false
        }
    },
    mounted: function () {
        console.log("Hellowww")
    }
});

$(document).ready(function () {
    app.fullScreenLoading = false;
});