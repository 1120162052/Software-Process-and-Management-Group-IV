<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/sys/dictTypeManager.css"/>
</head>
<body>
<div id="app" v-cloak>
    字典类型管理
    <el-table size="mini" :data="table.data">
        <el-table-column label="类型名称" prop="nameCn"></el-table-column>
        <el-table-column label="父类型名称" prop="parentNameCn"></el-table-column>
    </el-table>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/dictTypeManager.js"></script>
</body>
</html>