let app = new Vue({
    el: '#app',
    data: {
        user: '',
        categoryList: '',
        tabList: [
            {
                url: 'functions/home',
                title: '首页',
                name: 'tab0'
            }
        ],
        activeTabName: 'tab0',
        tabNameCount: 1
    },
    methods: {
        // 初始化页面:
        // 1. 获取登陆用户信息
        // 2. 根据用户获取对应的菜单信息
        init: function () {
            let url = "functions/frame/init";
            let data = null;
            let app = this;
            ajaxPost(url, data, function (d) {
                app.user = d.data.user; // 包含用户信息
                app.categoryList = d.data.categoryList; // 菜单列表
            });
        },
        // 登出
        logout: function () {
            location.href = "/logout";
        },
        // 添加新的标签页
        addTab: function (indexString) {
            let indexes = indexString.split('-');
            let index1 = parseInt(indexes[0]);
            let index2 = parseInt(indexes[1]);
            let _function = this.categoryList[index1].functionList[index2];
            let exist = false;
            let index = -1;
            for (let i = 0; i < this.tabList.length; i++) {
                if (this.tabList[i].url == _function.url) {
                    exist = true;
                    index = i;
                    break;
                }
            }
            // 标签页已被打开，则不再添加新的标签页，而是设置目标标签页为active
            if (exist == true) {
                this.activeTabName = this.tabList[index].name;
                // this.refreshTab(index);
            }
            else {
                let newTabName = 'tab' + this.tabNameCount;
                this.tabNameCount += 1;
                this.tabList.push({
                    title: _function.name,
                    url: _function.url,
                    name: newTabName
                });
                this.activeTabName = newTabName;
            }
        },
        // 删除标签页
        removeTab: function (targetName) {
            if (targetName == 'tab0') {
                console.log("首页不能删除!");
                return;
            }
            let tabs = this.tabList;
            let activeName = this.activeTabName;
            if (activeName == targetName) {
                tabs.forEach((tab, index) => {
                    if (tab.name == targetName) {
                        let nextTab = tabs[index + 1] || tabs[index - 1];
                        if (nextTab)
                            activeName = nextTab.name;
                    }
                })
            }
            this.activeTabName = activeName;
            this.tabList = tabs.filter(tab => tab.name != targetName);
        },
        // 刷新指定tab的iframe
        refreshTab: function (index) {
            document.getElementById('iframe' + index).contentWindow.location.reload(true);
        }
    },
    mounted: function () {
        this.init();
    }
});