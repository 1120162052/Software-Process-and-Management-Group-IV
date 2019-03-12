let app = new Vue({
    el: '#app',
    data: {
        tree: [], // 功能树
        form: {
            visible: false,
            type: 'function',
            type_cn: '功能',
            data: {
                name: '',
                code: '',
                url: '',
                enable: false,
                icon: ''
            }
        }
    },
    methods: {
        // 点击节点触发
        handleNodeClick(node) {
            this.form.visible = true;
            if (node.type === 'function') {
                this.form.type = 'function';
                this.form.type_cn = '功能';
                this.form.data = copy(node);
            } else if (node.type === 'category') {
                this.form.type = 'category';
                this.form.type_cn = '分类';
                this.form.data = copy(node);
            }
        },
        handleDragStart(node, ev) {
            // console.log('drag start', node);
        },
        handleDragEnter(draggingNode, dropNode, ev) {
            // console.log('tree drag enter: ', dropNode.label);
        },
        handleDragLeave(draggingNode, dropNode, ev) {
            // console.log('tree drag leave: ', dropNode.label);
        },
        handleDragOver(draggingNode, dropNode, ev) {
            // console.log('tree drag over: ', dropNode.label);
        },
        handleDragEnd(draggingNode, dropNode, dropType, ev) {
            // console.log('tree drag end: ', dropNode && dropNode.label, dropType);
        },
        handleDrop(draggingNode, dropNode, dropType, ev) {
            // console.log('tree drop: ', dropNode.label, dropType);
        },
        allowDrop(draggingNode, dropNode, type) {
            // 拖动节点为分类节点时
            if (draggingNode.data.type === 'category') {
                // 只能将节点拖拽到其他分类节点的'prev' or 'next'
                if (type === 'inner') return false;
                return dropNode.data.type === 'category';
            }
            // 拖动节点为功能节点时
            else if (draggingNode.data.type === 'function') {
                // 只能将节点拖拽到其他功能节点的'prev' or 'next'或者分类节点的'inner'
                if (dropNode.data.type === 'function')
                    return type !== 'inner';
                else if (dropNode.data.type === 'category')
                    return type === 'inner';
            }
            return false;
        },
        allowDrag(draggingNode) {
            // 分类节点和功能节点都可拖拽
            return draggingNode.data.type === 'function' || draggingNode.data.type === 'category';
        }
    },
    mounted: function () {
        // 获取功能树
        let url = '/functions/sys/functionManager/getFunctionTree';
        let data = null;
        let app = this;
        ajaxPost(url, data, function (d) {
            let categoryList = copy(d.data);
            for (let i = 0; i < categoryList.length; i++) {
                categoryList[i].label = categoryList[i].name;
                categoryList[i].type = 'category';
                categoryList[i].children = categoryList[i].functionList;
                for (let j = 0; j < categoryList[i].children.length; j++) {
                    categoryList[i].children[j].label = categoryList[i].children[j].name;
                    categoryList[i].children[j].type = 'function';
                }
            }
            app.tree = categoryList;
        })
    }
});