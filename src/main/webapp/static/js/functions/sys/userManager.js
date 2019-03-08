let app = new Vue({
    el: '#app',
    data: {
        fullScreenLoading: true,
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
                formData: {
                    username: '',
                    password: ''
                }
            }
        }
    },
    methods: {
        init: function () {
            this.getUserList();
        },
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
            setTimeout(function(){
                ajaxPostJSON(url, data, function (d) {
                    app.table.loading = false;
                    app.table.data = d.data.resultList;
                    app.table.params.total = d.data.total;
                })
            },550);
        },
    },
    mounted: function () {
        this.init();
    }
});

$(document).ready(function () {
    app.fullScreenLoading = false;
});