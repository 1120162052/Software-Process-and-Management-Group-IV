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
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0px 15px;">
        <span class="button-group">
            <el-button size="small" type="success" @click="dialog.addUser.visible=true">
                <span>添加用户</span>
            </el-button>
            <el-button size="small" type="danger">
                <span>删除用户</span>
            </el-button>
            <el-button size="small" type="primary" @click="getUserList()">
                <span>刷新</span>
            </el-button>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-input size="small" placeholder="请输入用户名搜索相关用户" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;" v-model="table.params.searchKey"
                      @keyup.enter.native="getUserList()">
            </el-input>
            <el-button size="small" type="primary" style="position:relative;" @click="getUserList()">
                <span>搜索</span>
            </el-button>
        </span>
    </div>
    <%-- 表格 --%>
    <el-table :data="table.data" height="calc(100% - 110px)" v-loading="table.loading"
              style="width: 100%;overflow-y: hidden;margin-top: 20px;" class="scroll-bar"
              @selection-change="handleSelectionChange" v-loading="table.loading">
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="用户名" prop="username" width="200"></el-table-column>
        <el-table-column label="密码" prop="password" width="200"></el-table-column>
        <el-table-column label="创建时间">
            <template slot-scope="scope">
                {{ formatTimestamp(scope.row.commonCreateDate) }}
            </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
            <template slot-scope="scope">
                <el-button type="warning" size="mini" style="position:relative;bottom: 1px;">
                    <span>编辑</span>
                </el-button>
                <el-button type="danger" size="mini" style="position:relative;bottom: 1px;margin-left: 3px;">
                    <span>删除</span>
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <%-- 分页 --%>
    <el-pagination style="text-align: center;margin: 0px auto;margin-top: 8px;"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :current-page="table.params.pageIndex"
                   :page-sizes="table.params.pageSizes"
                   :page-size="table.params.pageSize"
                   :total="table.params.total"
                   layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <%-- 添加用户弹出框 --%>
    <el-dialog title="添加用户" :visible.sync="dialog.addUser.visible">
        <el-form label-position="top" label-width="80px">
            <el-form-item label="用户名">
                <el-input v-model="dialog.addUser.formData.username"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="dialog.addUser.formData.password"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button size="small" @click="dialog.addUser.visible = false">取 消</el-button>
            <el-button size="small" type="primary" @click="dialog.addUser.visible = false">确 定</el-button>
        </div>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/userManager.js"></script>
</body>
</html>