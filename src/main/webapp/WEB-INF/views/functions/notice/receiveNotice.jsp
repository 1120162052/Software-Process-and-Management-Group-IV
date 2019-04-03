<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/notice/receiveNotice.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0 15px;">
        <span class="button-group">
            <el-button size="small" type="danger" @click="deleteEntityListByIds(table.entity.selectionList)"
                       style="margin-left: 10px;" :disabled="currentStatus === '1'">
                <span>批量已读</span>
            </el-button>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-select v-model="currentStatus" size="small" @change="refreshTable_entity()">
                <el-option value="0" label="未读"></el-option>
                <el-option value="1" label="已读"></el-option>
            </el-select>
            <el-input size="small" placeholder="请输入通知名搜索相关通知" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;" v-model="table.entity.params.searchKey"
                      @keyup.enter.native="table.entity.params.pageIndex=1;refreshTable_entity()">
            </el-input>
            <el-button size="small" type="primary" style="position:relative;"
                       @click="table.entity.params.pageIndex=1;refreshTable_entity()">
                <span>搜索</span>
            </el-button>
        </span>
    </div>
    <%-- entity表格 --%>
    <el-table :data="table.entity.data" height="calc(100% - 116px)" v-loading="table.entity.loading"
              style="width: 100%;overflow-y: hidden;margin-top: 20px;" class="scroll-bar"
              @selection-change="onSelectionChange_entity" stripe>
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="通知标题" prop="title" width="250"></el-table-column>
        <el-table-column label="通知内容" prop="content" width="500"></el-table-column>
        <el-table-column label="发布时间" width="180">
            <template slot-scope="scope">
                {{ formatTimestamp(scope.row.publishDate) }}
            </template>
        </el-table-column>
        <el-table-column></el-table-column>
        <el-table-column label="操作" width="190" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="danger" size="mini" style="position:relative;bottom: 1px;margin-left: 6px;" :disabled="scope.row.status === '1'"
                           @click="deleteEntityListByIds([{id: scope.row.id}])">
                    <span>标记已读</span>
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <%-- entity分页 --%>
    <el-pagination style="text-align: center;margin: 8px auto;"
                   @size-change="onPageSizeChange_entity"
                   @current-change="onPageIndexChange_entity"
                   :current-page="table.entity.params.pageIndex"
                   :page-sizes="table.entity.params.pageSizes"
                   :page-size="table.entity.params.pageSize"
                   :total="table.entity.params.total"
                   layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/notice/receiveNotice.js"></script>
</body>
</html>