var app = new Vue({
    el: '#app',
    data: {
        user: '',
        categoryList: '',
        tabList: [
            {
                url: 'functions/home',
                name: '首页',
                id: 'tab0'
            }
        ],
        activeTabIndex: 0,
        tabCount: 1
    },
    methods: {
        // 初始化页面:
        // 1. 获取登陆用户信息
        // 2. 根据用户获取对应的菜单信息
        init: function () {
            var url = "functions/frame/init";
            var data = null;
            var app = this;
            ajaxPost(url, data, function (d) {
                app.user = d.data.user; // 包含用户信息
                app.categoryList = d.data.categoryList; // 菜单列表
            })
        },
        // 登出
        logout: function () {
            location.href = "/logout";
        },
        // 点击菜单时触发
        clickMenu: function () {

        },
        // 处理tab删除（使用beforeRemove代替）
        handleTabRemove: function (index) {
        },
        beforeRemove: function (index) {
            if (index == 0)
                return new Promise(function (resolve, reject) {
                    //resolve('删除');
                    reject('不能关闭首页');//这里是传递一个错误，可以不写，同样不删除
                });
            else {
                this.tabList.splice(index, 1);
                if (this.activeTabIndex == index)
                    this.activeTabIndex = index - 1;
                else if (index < this.activeTabIndex)
                    this.activeTabIndex -= 1;
                return new Promise(function (resolve, reject) {
                    // resolve('删除');
                    reject('不删除');//这里是传递一个错误，可以不写，同样不删除
                });
            }
        },
        // 添加新的标签页
        addTab: function (indexString) {
            var indexes = indexString.split('-');
            var index1 = parseInt(indexes[0]);
            var index2 = parseInt(indexes[1]);
            var _function = this.categoryList[index1].functionList[index2];
            var exist = false;
            var index = -1;
            for (var i = 0; i < this.tabList.length; i++) {
                if (this.tabList[i].url == _function.url) {
                    exist = true;
                    index = i;
                    break;
                }
            }
            // 标签页已被打开，则不再添加新的标签页，而是设置目标标签页为active
            if (exist == true) {
                this.activeTabIndex = index;
                this.refreshTab(index);
            }
            else {
                var id = 'tab' + this.tabCount;
                this.tabCount += 1;
                this.tabList.push({
                    name: _function.name,
                    url: _function.url,
                    id: id
                });
                this.activeTabIndex = this.tabList.length - 1;
            }
        },
        // 刷新指定tab的iframe
        refreshTab: function (index) {
            // document.getElementById('iframe' + index).contentWindow.location.reload(true);
        }
    },
    mounted: function () {
        this.init();
    }
});