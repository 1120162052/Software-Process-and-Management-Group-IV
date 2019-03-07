<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/sys/userManager.css"/>
</head>
<body>
<div id="app" v-cloak style="padding: 20px;height: 100%;" v-loading="fullScreenLoading">
    <div>
        <span>
            <el-button size="medium" type="success" icon="el-icon-plus" class="edit-button">添加用户</el-button>
            <el-button size="medium" type="danger" icon="el-icon-minus" class="edit-button">删除用户</el-button>
        </span>
        <span style="float: right;">
            <el-input size="medium" placeholder="请输入用户名" style="display: inline-block;width: 320px;"></el-input>
            <el-button size="medium" type="primary" icon="el-icon-search">搜索</el-button>
        </span>
    </div>
    <el-table :data="table.data">

    </el-table>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/userManager.js"></script>
</body>
</html>