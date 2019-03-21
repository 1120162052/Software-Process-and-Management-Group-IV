<%--
  Created by IntelliJ IDEA.
  User: LWJ
  Date: 2019/3/17
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/record/recordManagerCity.css"/>
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
            <el-input size="small" placeholder="请输入用户名搜索相关备案" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;">
            </el-input>
            <el-button size="small" type="primary">
                <span>搜索</span>
            </el-button>
        </span>
    </div>
    <%-- 表格 --%>
    <el-table :data="table.data" height="calc(100% - 116px)" v-loading="table.loading"
              style="width: 100%;overflow-y: hidden;margin-top: 20px;" class="scroll-bar"
              @selection-change="handleSelectionChange" stripe>
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="用户名" prop="username" width="200"></el-table-column>
        <el-table-column label="所属市" prop="cityBelongTo" width="200"></el-table-column>
        <el-table-column label="上报时间" prop="submitTime" width="200px"></el-table-column>
        <el-table-column label="备案状态" prop="filingStatus" width="200px"></el-table-column>
        <el-table-column label="报审状态" prop="reportStatus"></el-table-column>
        <el-table-column label="操作" width="160" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="primary" size="mini" style="position:relative;bottom: 1px;" @click="handleViewRecord(scope.row.id, 'single')">
                    <span>查看</span>
                </el-button>
                <el-button type="success" size="mini" :disabled="!scope.row.operatable" style="position:relative;bottom: 1px;margin-left: 6px;" @click="handleApproveRecord(scope.row.id, 'single')">
                    <span>通过</span>
                </el-button>
                <el-button type="danger" size="mini" :disabled="!scope.row.operatable" style="position:relative;bottom: 1px;margin-left: 6px;" @click="handleRejectRecord(scope.row.id, 'single')">
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
    <%-- 备案信息详情窗口 --%>
    <el-dialog title="备案详情" :visible.sync="dialog.viewDetail.visible">
        <div class="recordInfoWrapper">
            <table style="width: 100%;">
                <tr v-for="(recordData, index) in dialog.viewDetail.recordData">
                    <td class="recordInfoItemWrapperLeft"><label>{{ recordData.infoName + '：' }}</label></td>
                    <td class="recordInfoItemWrapperRight">{{ recordData.infoValue }}</td>
                </tr>
            </table>
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button size="medium" type="danger" @click="handleRejectRecord(undefined, 'single')">退回</el-button>
            <el-button size="medium" type="success" @click="handleApproveRecord(undefined, 'single')" style="margin-left: 10px;">通 过</el-button>
        </div>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/record/recordManagerCity.js"></script>
</body>
</html>