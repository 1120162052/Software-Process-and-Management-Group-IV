<%--
  Created by IntelliJ IDEA.
  User: LWJ
  Date: 2019/3/23
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/record/userManagerOfProvince.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white;height: 100%;overflow: hidden;" v-loading="fullScreenLoading">
    <%-- 顶栏 --%>
    <div style="padding: 15px 20px 0px 15px;">
        <span class="button-group">
            <el-button size="small" type="success" @click="dialog.addUser.visible = true">
                <span>添加用户</span>
            </el-button>
            <el-button size="small" type="danger" @click="deleteUser(table.selectionList)" style="margin-left: 10px;">
                <span>批量删除</span>
            </el-button>
        </span>
        <span style="float: right;margin-right: 10px;">
            <el-input size="small" placeholder="请输入用户名搜索相关用户" suffix-icon="el-icon-search"
                      style="width: 250px;margin-right: 10px;" v-model="table.params.searchKey"
                      @keyup.enter.native="table.params.pageIndex=1;getUserList()">
            </el-input>
            <el-button size="small" type="primary" style="position:relative;" @click="table.params.pageIndex=1;getUserList()">
                <span>搜索</span>
            </el-button>
        </span>
    </div>

    <%--表格区--%>
    <el-table
            :data="table.data"
            height="calc(100% - 116px)" v-loading="table.loading"
            style="width: 100%;overflow-y: hidden;margin-top: 20px;"
            class="scroll-bar"
            :row-key="getRowKeys"
            :expand-row-keys="table.expandKeys"
            @expand-change="expandChange"
            @selection-change="handleSelectionChange"
            stripe>
        <el-table-column type="selection" width="40"></el-table-column>
        <el-table-column type="expand">
            <template slot-scope="props">
                <el-form label-position="left" inline class="demo-table-expand">
                    <el-form-item label="用户名">
                        <span>{{ props.row.username }}</span>
                    </el-form-item>
                    <el-form-item label="密码">
                        <span>{{ props.row.password }}</span>
                    </el-form-item>
                    <el-form-item label="用户类型">
                        <span>{{ userTypeMap[props.row.userType] }}</span>
                    </el-form-item>
                    <el-form-item label="创建时间">
                        <span>{{ formatTimestamp(props.row.createDate) }}</span>
                    </el-form-item>
                    <el-form-item label="最后修改时间">
                        <span>{{ formatTimestamp(props.row.modifyDate) }}</span>
                    </el-form-item>
                    <el-form-item label="所属省名称">
                        <span>{{ props.row.province.nameCn }}</span>
                    </el-form-item>
                    <el-form-item label="所属市名称" v-if="props.row.userType === 3">
                        <span>{{ props.row.city.nameCn }}</span>
                    </el-form-item>
                    <el-form-item label="市名称" v-if="props.row.userType === 2">
                        <span>{{ props.row.city.nameCn }}</span>
                    </el-form-item>
                    <el-form-item label="人力资源市场名称" v-if="props.row.userType === 3 && props.row.recordStatus === 3">
                        <span>{{ props.row.marketName }}</span>
                    </el-form-item>
                    <el-form-item label="联系人" v-if="props.row.userType === 3 && props.row.recordStatus === 3">
                        <span>{{ props.row.contactName }}</span>
                    </el-form-item>
                    <el-form-item label="联系人手机" v-if="props.row.userType === 3 && props.row.recordStatus === 3">
                        <span>{{ props.row.contactMobile }}</span>
                    </el-form-item>
                    <el-form-item label="联系电话" v-if="props.row.userType === 3 && props.row.recordStatus === 3">
                        <span>{{ props.row.contactMobile }}</span>
                    </el-form-item>
                    <el-form-item label="传真" v-if="props.row.userType === 3 && props.row.recordStatus === 3">
                        <span>{{ props.row.fax }}</span>
                    </el-form-item>
                </el-form>
            </template>
        </el-table-column>
        <el-table-column
                label="用户名"
                prop="username"
                width="200">
        </el-table-column>
        <el-table-column
                label="密码"
                prop="password"
                width="200">
        </el-table-column>
        <el-table-column
                label="用户类型编号"
                prop="userType">
        </el-table-column>
        <el-table-column label="操作" width="130" header-align="center" align="center">
            <template slot-scope="scope">
                <el-button type="warning" size="mini" style="position:relative;bottom: 1px;" @click="openEditUser(scope.row)">
                    <span>编辑</span>
                </el-button>
                <el-button type="danger" size="mini" style="position:relative;bottom: 1px;margin-left: 6px;" @click="deleteUser(scope.row.id, 'single')">
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

     <%--添加窗口--%>
    <el-dialog title="添加用户" :visible.sync="dialog.addUser.visible" @close="resetForm('form_addUser')">
        <el-form label-position="left" label-width="80px" style="padding: 0 100px;"
                 :model="dialog.addUser.formData" :rules="dialog.addUser.rules"
                 ref="form_addUser" v-loading="dialog.addUser.loading" status-icon >
            <el-form-item label="用户名" prop="username" class="is-required">
                <el-input v-model="dialog.addUser.formData.username"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password" class="is-required">
                <el-input v-model="dialog.addUser.formData.password"></el-input>
            </el-form-item>
            <el-form-item label="用户类型" prop="userType" class="is-required">
                <el-select v-model="dialog.addUser.formData.userType" clearable placeholder="请选择"
                           @change="onUserTypeSelected"
                           @clear="onUserTypeCleared">
                    <el-option
                            v-for="item in dialog.options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="所属市" prop="cityId" class="is-required" v-if="dialog.isMonitorPoint">
                <el-select v-model="dialog.addUser.formData.cityId" clearable placeholder="请选择">
                    <el-option
                        v-for="item in cityList"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="市名称" prop="cityId" class="is-required" v-if="dialog.isCity">
                <el-select v-model="dialog.addUser.formData.cityId" clearable placeholder="请选择">
                    <el-option
                            v-for="item in cityList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button size="medium" @click="dialog.addUser.visible=false">取 消</el-button>
            <el-button size="medium" type="primary" @click="addUser()" style="margin-left: 10px;">提 交</el-button>
        </div>
    </el-dialog>

    <%-- 编辑窗口 --%>
    <el-dialog title="编辑用户" :visible.sync="dialog.editUser.visible" @close="resetForm('form_editUser')">
        <el-form label-position="left" label-width="80px"
                 style="padding: 0 100px;height: 350px;overflow-y: scroll;"
                 :model="dialog.editUser.formData" :rules="dialog.editUser.rules"
                 ref="form_editUser" v-loading="dialog.editUser.loading" status-icon size="medium">
            <el-form-item label="用户名" prop="username" class="is-required">
                <el-input v-model="dialog.editUser.formData.username" disabled></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
                <el-input v-model="dialog.editUser.formData.password"></el-input>
            </el-form-item>
            <el-form-item label="用户类型" prop="userType" class="is-required">
                <el-select v-model="dialog.editUser.formData.userType" clearable placeholder="请选择"
                           @change="onUserTypeSelected"
                           @clear="onUserTypeCleared">
                    <el-option
                            v-for="item in dialog.options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="所属市" prop="cityId" class="is-required" v-if="dialog.isMonitorPoint">
                <el-select v-model="dialog.editUser.formData.cityId" clearable placeholder="请选择">
                    <el-option
                            v-for="item in cityList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="市名称" prop="cityId" class="is-required" v-if="dialog.isCity">
                <el-select v-model="dialog.editUser.formData.cityId" clearable placeholder="请选择">
                    <el-option
                            v-for="item in cityList"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button size="medium" @click="dialog.editUser.visible=false">取 消</el-button>
            <el-button size="medium" type="primary" @click="editUser()" style="margin-left: 10px;">提 交</el-button>
        </div>
    </el-dialog>
</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/record/userManagerOfProvince.js"></script>
</body>
</html>