<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>tableTemplate</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/notice/publishNotice.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0 15px;">
        <span class="button-group">
            <el-button size="small" type="success" @click="dialog.visible=true;dialog.loading=true">
                <span>发布通知</span>
            </el-button>
            <el-button size="small" type="danger" @click="deleteListByIds(table.entity.selectionList)"
                       style="margin-left: 10px;">
                <span>批量删除</span>
            </el-button>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-input size="small" placeholder="请输入角色名搜索相关角色" suffix-icon="el-icon-search"
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
        <el-table-column label="标题" width="250" prop="title"></el-table-column>
        <el-table-column label="内容" width="500" prop="content"></el-table-column>
        <el-table-column label="发布时间" width="180">
            <template slot-scope="scope">
                {{ formatTimestamp(scope.row.publishDate) }}
            </template>
        </el-table-column>
        <el-table-column></el-table-column>
        <el-table-column label="操作" width="190" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="warning" size="mini" style="position:relative;bottom: 1px;"
                           @click="openDialog_updateEntity(scope.row)">
                    <span>编辑</span>
                </el-button>
                <el-button type="danger" size="mini" style="position:relative;bottom: 1px;margin-left: 6px;"
                           @click="deleteListByIds([{id: scope.row.id}])">
                    <span>删除</span>
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
    <%-- 发布或编辑通知窗口 --%>
    <el-dialog title="发布通知" :visible.sync="dialog.visible" class="my-dialog" @close="refreshTable_entity()">
        <div v-loading="dialog.loading" style="height: 400px;">
            <iframe v-if="dialog.visible" :src="'/functions/notice/publishNoticeForm'"
                    style="border: 0;height: 100%;width: 100%;"
                    @load="dialog.loading=false;"></iframe>
        </div>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/notice/publishNotice.js"></script>
</body>
</html>