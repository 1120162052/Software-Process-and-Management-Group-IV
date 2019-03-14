<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/sys/roleManager.css"/>
</head>
<body>
<div id="app" v-cloak>
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0px 15px;">
        <span class="button-group">
            <el-button size="small" type="success" @click="dialog.add.visible = true">
                <span>添加角色</span>
            </el-button>
            <el-button size="small" type="danger" @click="delete(table.selectionList)" style="margin-left: 10px;">
                <span>批量删除</span>
            </el-button>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-input size="small" placeholder="请输入角色名搜索相关角色" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;" v-model="table.params.searchKey"
                      @keyup.enter.native="getRoleList()">
            </el-input>
            <el-button size="small" type="primary" style="position:relative;" @click="getRoleList()">
                <span>搜索</span>
            </el-button>
        </span>
    </div>
    <%-- 表格 --%>
    <el-table :data="table.data" height="calc(100% - 116px)" v-loading="table.loading"
              style="width: 100%;overflow-y: hidden;margin-top: 20px;" class="scroll-bar"
              @selection-change="handleSelectionChange" stripe>
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column label="角色名" prop="name" width="200"></el-table-column>
        <el-table-column label="角色代码" prop="code" width="200"></el-table-column>
        <el-table-column label="创建时间">
            <template slot-scope="scope">
                {{ formatTimestamp(scope.row.commonCreateDate) }}
            </template>
        </el-table-column>
        <el-table-column label="操作" width="130" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="warning" size="mini" style="position:relative;bottom: 1px;" @click="openedit(scope.row)">
                    <span>编辑</span>
                </el-button>
                <el-button type="danger" size="mini" style="position:relative;bottom: 1px;margin-left: 6px;" @click="deleteRole(scope.row.id, 'single')">
                    <span>删除</span>
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
    <%-- 添加角色窗口 --%>
    <el-dialog title="添加角色" :visible.sync="dialog.add.visible" @close="resetForm('form_add')">
        <el-form label-position="left" label-width="80px" style="padding: 0 100px;"
                 :model="dialog.add.formData" :rules="dialog.add.rules"
                 ref="form_add" v-loading="dialog.add.loading" status-icon >
            <el-form-item label="角色名" prop="name" class="is-required">
                <el-input v-model="dialog.add.formData.name"></el-input>
            </el-form-item>
            <el-form-item label="角色代码" prop="code">
                <el-input v-model="dialog.add.formData.code"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button size="medium" @click="dialog.add.visible=false">取 消</el-button>
            <el-button size="medium" type="primary" @click="submitAddForm()" style="margin-left: 10px;">提 交</el-button>
        </div>
    </el-dialog>
    <%-- 编辑用户窗口 --%>
    <el-dialog title="编辑用户" :visible.sync="dialog.edit.visible" @close="resetForm('form_edit')">
        <el-form label-position="left" label-width="80px"
                 style="padding: 0 100px;height: 350px;overflow-y: scroll;"
                 :model="dialog.edit.formData" :rules="dialog.edit.rules"
                 ref="form_edit" v-loading="dialog.edit.loading" status-icon size="medium">
            <el-form-item label="角色名" prop="name" class="is-required">
                <el-input v-model="dialog.edit.formData.name" disabled></el-input>
            </el-form-item>
            <el-form-item label="角色代码" prop="code">
                <el-input v-model="dialog.edit.formData.code"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button size="medium" @click="dialog.edit.visible=false">取 消</el-button>
            <el-button size="medium" type="primary" @click="submitEditForm" style="margin-left: 10px;">提 交</el-button>
        </div>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/sys/roleManager.js"></script>
</body>
</html>