let app = new Vue({
    el: '#app',
    data: {
        options: {
            dictType: [{
                id: 'option1',
                nameCn: '城市'
            },{
                id: 'option2',
                nameCn: '省份',
            },{
                id: 'option3',
                nameCn: '一级行业',
            },{
                id: 'option4',
                nameCn: '二级行业',
            }],
            dictTypeValue: ''
        },
        dialog: {
            dictTypeManager: {
                visible: false,
            }
        }
    }
});