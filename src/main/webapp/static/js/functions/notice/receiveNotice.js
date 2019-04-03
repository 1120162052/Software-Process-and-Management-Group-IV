let app = new Vue({
    el: '#app',
    data: {
        urls: {
            // api for entity
            deleteEntityListByIds: '/api/notice/noticeReceive/deleteListByIds',
            selectEntityListByPage: '/api/notice/noticeReceive/selectListByPage',
        },
        fullScreenLoading: false,
        table: {
            entity: {
                data: [],
                loading: false,
                selectionList: [],
                params: {
                    pageIndex: 1,
                    pageSize: 10,
                    pageSizes: [5, 10, 20, 40],
                    searchKey: '',  // 搜索词
                    total: 0,       // 总数
                }
            }
        },
        dialog: {
            insertEntity: {
                visible: false,
                loading: false,
                formData: {},
                rules: {},
            },
            updateEntity: {
                visible: false,
                loading: false,
                formData: {},
                rules: {},
            },
        },
        currentStatus: '0', // 0 - 未读，1 - 已读
    },
    methods: {
        deleteEntityListByIds: function (val) {
            let data = val;
            let app = this;
            app.fullScreenLoading = true;
            ajaxPostJSON(this.urls.deleteEntityListByIds, data, function (d) {
                app.fullScreenLoading = false;
                app.refreshTable_entity();
            })
        },
        selectEntityListByPage: function () {
            let data = {
                page: this.table.entity.params,
                status: this.currentStatus
            };
            let app = this;
            app.table.entity.loading = true;
            ajaxPostJSON(this.urls.selectEntityListByPage, data, function (d) {
                app.table.entity.loading = false;
                app.table.entity.data = d.data.resultList;
                app.table.entity.params.total = d.data.total;
            });
        },
        // 刷新entity table数据
        refreshTable_entity: function () {
            this.selectEntityListByPage();
        },
        // 处理选中的行变化
        onSelectionChange_entity: function (val) {
            this.table.entity.selectionList = val;
        },
        // 处理pageSize变化
        onPageSizeChange_entity: function (newSize) {
            this.table.entity.params.pageSize = newSize;
            this.refreshTable_entity();
        },
        // 处理pageIndex变化
        onPageIndexChange_entity: function (newIndex) {
            this.table.entity.params.pageIndex = newIndex;
            this.refreshTable_entity();
        },
        // 重置表单
        resetForm: function (ref) {
            this.$refs[ref].resetFields();
        },
    },
    mounted: function () {
        this.refreshTable_entity();
    }
});