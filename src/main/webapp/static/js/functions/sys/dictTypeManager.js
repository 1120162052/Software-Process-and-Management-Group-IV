let app = new Vue({
    el: '#app',
    data: {
        table: {
            data: [
                {
                    id: 't1',
                    parentId: '',
                    nameCn: '省份',
                    nameEn: 'province',
                    parentNameCn: '',
                    parentNameEn: ''
                },
                {
                    id: 't2',
                    parentId: 't1',
                    nameCn: '城市',
                    nameEn: 'city',
                    parentNameCn: '省份',
                    parentNameEn: 'province'
                }
            ],

        }
    }
});