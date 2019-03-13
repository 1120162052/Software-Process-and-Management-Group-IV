<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>省人力资源市场数据采集系统</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/frame.css"/>
</head>
<body>
<div id="app" v-cloak>
    <el-container style="height: 100%" v-loading="fullScreenLoading">
        <el-header height="48px"
                   style="background: #007cc4;padding-right: 60px;box-shadow: 0 2px 10px 0 rgba(0,0,0,.15);;">
            <span class="title">省人力资源市场数据采集系统</span>
            <el-popover placement="bottom" trigger="hover">
                <el-button style="margin-left: 32px;" type="danger" size="small" @click="logout">退出</el-button>
                <span slot="reference" class="userInfo">
                    <span class="username"
                          style="font-size: 16px;color: aliceblue;float: right;line-height: 40px">{{ user.username }}</span>
                    <Avatar icon="ios-person"
                            style="float: right;position:relative;top: 4px;right: 10px;background-color: #87d068"
                            size="default"/>
                </span>
            </el-popover>
        </el-header>
        <el-container style="height: 100%">
            <el-aside width="230px">
                <i-Menu accordion="true" theme="dark" width="auto" style="height: 100%;background-color: #272B2E;"
                        @on-select="addTab">
                    <Submenu v-for="(category, index1) in categoryList" :name="index1">
                        <template slot="title">
                            <Icon type="ios-navigate"></Icon>
                            {{ category.name }}
                        </template>
                        <Menu-Item v-for="(_function, index2) in category.functionList" :name="index1 + '-' + index2">
                            <Icon type="ios-navigate"></Icon>
                            {{ _function.name }}
                        </Menu-Item>
                    </Submenu>
                </i-Menu>
            </el-aside>
            <el-main style="padding: 0px;height: 100%;overflow-y: hidden">
                <el-tabs v-model="activeTabName" type="card" closable @tab-remove="removeTab" style="height: 100%">
                    <el-tab-pane :key="tab.name" v-for="(tab, index) in tabList" :label="tab.title" :name="tab.name"
                                 style="height: 100%" v-loading="tab.loading">
                        <iframe style="border: 0px;height: calc(100% - 40px);width: 100%;"
                                :src="tab.url" :id="tab.name" @load="tab.loading=false"></iframe>
                    </el-tab-pane>
                </el-tabs>
            </el-main>
        </el-container>
    </el-container>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/frame.js"></script>
</body>
</html>