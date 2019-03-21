<%--
  Created by IntelliJ IDEA.
  User: LWJ
  Date: 2019/3/17
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/record/fillRecord.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <el-form :model="dataForm" :rules="rules" ref="humanResourceMarketForm" label-width="150px" style="width: 60%; margin: 100px auto">
        <el-form-item label="人力资源市场名称" prop="marketName">
            <el-input v-model="dataForm.marketName" :disabled="hasSubmit"></el-input>
        </el-form-item>
        <el-form-item label="联系人" prop="contactName">
            <el-input v-model="dataForm.contactName" :disabled="hasSubmit"></el-input>
        </el-form-item>
        <el-form-item label="联系人手机" prop="contactMobile">
            <el-input v-model="dataForm.contactMobile" :disabled="hasSubmit"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" prop="contactPhone">
            <el-input v-model="dataForm.contactPhone" :disabled="hasSubmit"></el-input>
        </el-form-item>
        <el-form-item label="传真" prop="fax">
            <el-input v-model="dataForm.fax" :disabled="hasSubmit"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" :disabled="hasSubmit" @click="submitForm('humanResourceMarketForm')">保存并提交</el-button>
            <el-button type="primary" plain @click="" :disabled="hasSubmit" style="margin-left: 10px">仅保存</el-button>
            <el-button @click="resetForm('humanResourceMarketForm')" :disabled="hasSubmit" style="float: right">重置</el-button>
        </el-form-item>
    </el-form>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/record/fillRecord.js"></script>
</body>
</html>