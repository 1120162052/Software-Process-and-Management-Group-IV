<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/sys/functionManager.css"/>
</head>
<body>
<div id="app" v-cloak style="overflow-y: hidden;">
    <div class="card1" style="width: 349px;margin-left: 20px;margin-top: 20px;float: left;height: 100%;">
        <el-card style="height: calc(100% - 41px);">
            <div slot="header" style="height: 10px;line-height: 10px;">
                <span style="font-size: 15px;color: #007cc4;">功能列表</span>
                <span class="button-group">
                    <el-button size="mini" type="success">添加分类</el-button>
                    <el-button size="mini" type="warning">保存修改</el-button>
                </span>
            </div>
            <el-tree style="overflow-y: auto;height: calc(100% - 40px);"
                     :data="tree" node-key="id" @node-drag-start="handleDragStart" @node-drag-enter="handleDragEnter"
                     @node-drag-leave="handleDragLeave" @node-drag-over="handleDragOver" @node-drag-end="handleDragEnd"
                     @node-drop="handleDrop" draggable :allow-drop="allowDrop" :allow-drag="allowDrag"
                     default-expand-all :expand-on-click-node="false" @node-click="handleNodeClick"></el-tree>
        </el-card>
    </div>
    <div class="card2" style="width: calc(100% - 409px);margin-left: 21px;margin-top: 20px;float: left;height: 100%;">
        <el-card style="height: calc(100% - 41px);">
            <div slot="header" style="height: 10px;line-height: 10px;">
                <span style="font-size: 15px;color: rgb(230, 162, 60);">设置</span>
                <span class="button-group">
                    <el-button size="mini" type="warning">保存修改</el-button>
                </span>
            </div>
            <el-form v-show="form.visible" label-position="left" label-width="80px" size="small"
                     style="padding-left: 20px;padding-right: 10px;overflow-y: auto;height: calc(100% - 40px);">
                <el-form-item :label="form.type_cn + '名'" prop="name">
                    <el-input v-model="form.data.name"></el-input>
                </el-form-item>
                <el-form-item label="权限码" prop="code">
                    <el-input v-model="form.data.code"></el-input>
                </el-form-item>
                <el-form-item v-show="form.type === 'function'" label="地址" prop="url">
                    <el-input v-model="form.data.url"></el-input>
                </el-form-item>
                <el-form-item label="图标" prop="icon">
                    <el-input v-model="form.data.icon"></el-input>
                </el-form-item>
                <el-form-item label="状态" prop="enable">
                    <el-input v-model="form.data.enable"></el-input>
                </el-form-item>
            </el-form>
        </el-card>
    </div>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/functionManager.js"></script>
</body>
</html>