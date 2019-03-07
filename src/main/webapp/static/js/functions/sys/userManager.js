let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: true
    },
    mounted: function () {
        console.log("Hellowww")
    }
});

$(document).ready(function () {
    app.fullScreenLoading = false;
});