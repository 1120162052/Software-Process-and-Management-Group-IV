<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/login.css"/>
</head>
<body>
<div id="app" v-cloak  v-loading="fullScreenLoading">
    <el-form ref="form" :model="formData" label-width="100px" class="form" label-align="center">
        <h3 style="text-align: center; margin-bottom: 20px">人力资源市场管理系统</h3>
        <%-- 阻止浏览器密码保存 --%>
        <%--<input type="text" name="username" hidden/>--%>
        <%--<input type="password" name="password" hidden/>--%>
        <el-form-item label="用户名" prop="username">
            <el-input v-model="formData.username" placeholder="请输入用户名" name="username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
            <el-input v-model="formData.password" placeholder="请输入密码" name="password" type="password"
                      onfocus="this.type='password'"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="login" style="width: 150px">登陆</el-button>
            <el-button type="primary" plain @click="test()" style="width: 150px">lwj测试</el-button>
        </el-form-item>
    </el-form>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/login.js"></script>
</body>
</html>