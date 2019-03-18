<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/sys/dictManager.css"/>
</head>
<body>
<div id="app" v-cloak>
    <%-- 顶栏 --%>
    <el-row>
        <el-col :span="6">
            <span>字典类型</span>
            <el-select v-model="options.dictTypeValue" placeholder="请选择" size="mini" style="width: 100px;">
                <el-option v-for="item in options.dictType" :key="item.id" :label="item.nameCn" :value="item.id">
                </el-option>
            </el-select>
            <el-button size="mini" @click="dialog.dictTypeManager.visible=true">字典类型管理</el-button>
        </el-col>
    </el-row>
    <%-- 表格 --%>
    <el-table>

    </el-table>
    <%-- 分页 --%>
    <el-pagination></el-pagination>
    <%-- 字典类型管理弹窗 --%>
    <el-dialog :visible.sync="dialog.dictTypeManager.visible">
        <iframe style="width: 100%;height: 100%;" src="/functions/sys/dictTypeManager"></iframe>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/dictManager.js"></script>
</body>
</html>