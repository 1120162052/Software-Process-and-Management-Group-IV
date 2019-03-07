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
<div id="app" v-cloak style="padding: 20px;" v-loading="fullScreenLoading">
    <el-row>
        <el-col :span="12">
            <el-button>添加用户</el-button>
            <el-button>删除用户</el-button>
        </el-col>
        <el-col :span="10">
            <el-input placeholder="请输入用户名"></el-input>
        </el-col>
        <el-col :span="2">
            <el-button>搜索</el-button>
        </el-col>
    </el-row>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/userManager.js"></script>
</body>
</html>