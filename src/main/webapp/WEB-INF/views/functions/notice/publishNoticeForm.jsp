<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/notice/publishNoticeForm.css"/>
</head>
<body>
<div id="app" v-cloak>
    <el-form :model="formData" :rules="formRule" ref="form" label-width="110px" size="mini"
             label-position="right" style="padding: 16px 49px 0 0px;">
        <el-form-item label="通知标题" prop="title">
            <el-input v-model="formData.title"></el-input>
        </el-form-item>
        <el-form-item label="通知内容" prop="content">
            <el-input v-model="formData.content" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="添加接收用户">
            <el-button type="success" icon="el-icon-plus" @click="showUserTable()"></el-button>
        </el-form-item>
        <el-form-item label="">
            <Tag type="dot" closable color="primary" v-for="user in formData.userList"
                 @on-close="onTagClose" :key="user.id" :name="user.id">
                {{ user.username }}
            </Tag>
        </el-form-item>
        <el-form-item>
            <el-button size="small" type="primary" @click="submit()" :loading="loading.submit">立即发布</el-button>
            <el-button size="small" type="error">取消</el-button>
        </el-form-item>
    </el-form>
    <el-dialog size="mini" :visible.sync="userTable.visible" title="">
        <span style="position: absolute;top: 12px;left: 28px;">搜索用户</span>
        <span style="position: absolute;top: 10px;left: 100px;">
            <i-input size="small" v-model="userTable.page.searchKey" style="width: 150px;"
                     @keyup.enter.native="userTable.page.pageIndex=1;refreshTable()"></i-input>
        </span>
        <el-table :data="userTable.data" v-loading="userTable.loading" size="mini">
            <el-table-column label="用户名" prop="username" align="center" header-align="center"></el-table-column>
            <el-table-column label="操作" align="center" header-align="center">
                <template slot-scope="{row}">
                    <el-button type="success" size="mini" @click="addUserToList(row)">添加</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
                style="text-align: center;"
                small
                layout="prev, pager, next"
                :total="userTable.page.total"
                :current-page="userTable.page.pageIndex"
                @current-change="userTable.page.pageIndex=$event;refreshTable();">
        </el-pagination>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/notice/publishNoticeForm.js"></script>
</body>
</html>