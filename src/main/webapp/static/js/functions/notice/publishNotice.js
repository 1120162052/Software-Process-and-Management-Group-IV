app = new Vue({
    el: '#app',
    data: {
        urls: {
            // api for notice
            insertOrUpdate: '/api/notice/noticePublish/insertOrUpdate',
            deleteListByIds: '/api/notice/noticePublish/deleteListByIds',
            selectListByPage: '/api/notice/noticePublish/selectListByPage',
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
            loading: false,
            visible: false
        }
    },
    methods: {
        deleteListByIds: function (val) {
            if (val.length === 0) {
                window.parent.app.showMessage('提示：未选中任何项', 'warning');
                return;
            }
            window.parent.app.$confirm('确认删除选中的项', '警告', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                let data = val;
                let app = this;
                app.fullScreenLoading = true;
                ajaxPostJSON(this.urls.deleteListByIds, data, function (d) {
                    app.fullScreenLoading = false;
                    window.parent.app.showMessage('删除成功！', 'success');
                    app.refreshTable_entity();
                })
            }).catch(() => {
                window.parent.app.showMessage('已取消删除', 'warning');
            });
        },
        selectListByPage: function () {
            let data = {page: this.table.entity.params};
            let app = this;
            app.table.entity.loading = true;
            ajaxPostJSON(this.urls.selectListByPage, data, function (d) {
                app.table.entity.loading = false;
                app.table.entity.data = d.data.resultList;
                app.table.entity.params.total = d.data.total;
            });
        },
        // 刷新entity table数据
        refreshTable_entity: function () {
            this.selectListByPage();
        },
        // 打开编辑entity窗口
        openDialog_updateEntity: function (row) {
            this.dialog.updateEntity.visible = true;
            this.dialog.updateEntity.formData = copy(row);
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