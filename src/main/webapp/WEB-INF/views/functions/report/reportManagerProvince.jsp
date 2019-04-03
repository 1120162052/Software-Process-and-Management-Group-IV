<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/4/1
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/report/reportManagerProvince.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0px 15px;">
        <span class="button-group">
            <el-button size="small" type="success" @click="handleApproveRecord(table.selectionList, undefined)">
                <span>批量通过</span>
            </el-button>
            <el-button size="small" type="danger" @click="handleRejectRecord(table.selectionList, undefined)" style="margin-left: 10px;">
                <span>批量退回</span>
            </el-button>
            <el-cascader
                    :options="options"
                    v-model="selectedOptions"
                    @change="handleChange"
                    style="margin-left: 10px"
                    size="small"
                    placeholder="按所选择的状态筛选">
            </el-cascader>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-input size="small" placeholder="请输入用户名搜索相关报表" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;"
                      v-model="table.params.searchKey"
                      @keyup.enter.native="table.params.pageIndex=1;getUserList()">
            </el-input>
            <el-button size="small" type="primary" @click="table.params.pageIndex=1;getUserList()">
                <span>搜索</span>
            </el-button>
        </span>
    </div>
    <%-- 表格 --%>
    <el-table :data="table.data" height="calc(100% - 116px)" v-loading="table.loading"
              style="width: 100%;overflow-y: hidden;margin-top: 20px;" class="scroll-bar"
              @selection-change="handleSelectionChange" stripe>
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="时间" prop="submitTime" width="200"></el-table-column>
        <el-table-column label="负责人" prop="people" width="200"></el-table-column>
        <el-table-column label="电话"  prop="telephone" width = "200"></el-table-column>
        <el-table-column label="提交状态" prop="filingStatus" width="200"></el-table-column>
        <el-table-column label="详情">
            <template slot-scope="scope">
            <el-button type="primary" size="mini" style="position:relative;bottom: 1px;" @click="handleViewRecord(scope.row, 'single')">
                <span>查看</span>
            </el-button>
            </template>
        </el-table-column>
        <el-table-column label="操作" width="200" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="success" size="mini" :disabled="!scope.row.operate" style="position:relative;bottom: 1px;margin-left: 6px;" @click="handleApproveRecord(scope.row, 'single')">
                    <span>通过</span>
                </el-button>
                <el-button type="danger" size="mini" :disabled="!scope.row.operate" style="position:relative;bottom: 1px;margin-left: 6px;" @click="handleRejectRecord(scope.row, 'single')">
                    <span>退回</span>
                </el-button>
            </template>
        </el-table-column>
        <el-table-column width="50"></el-table-column>
    </el-table>
    <%-- 分页 --%>
    <el-pagination style="text-align: center;margin: 8px auto;"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="table.params.pageIndex"
                   :page-sizes="table.params.pageSizes"
                   :page-size="table.params.pageSize"
                   :total="table.params.total"
                   layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/report/reportManagerProvince.js"></script>
</body>
</html>
