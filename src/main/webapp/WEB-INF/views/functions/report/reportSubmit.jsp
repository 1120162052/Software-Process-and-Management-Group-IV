<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/3/31
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp"%>
    <link rel="stylesheet" href="/static/css/functions/report/reportSubmit.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white; height: 100%; overflow: hidden" v-loading="fullScreenLoading">
    <div v-if="page == 1">
            <el-form label-position="right" :model="dataForm" :rules="rules" ref="reportForm" label-width="150px" style="width: 60%; margin: 100px auto">
            <el-form-item label="需求人数" prop="requireNumber">
                <el-input v-model="dataForm.requireNumber" :disabled="hasSubmit"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="trueNumber">
                <el-input v-model="dataForm.trueNumber" :disabled="hasSubmit"></el-input>
            </el-form-item>
            <el-form-item label="求人倍率" prop="Magnification">
                <el-input v-model="dataForm.Magnification" :disabled="hasSubmit"></el-input>
            </el-form-item>

        </el-form>
        <el-form label-width="200px" style="width: 60%; margin: 10px auto">
        <el-button type="primary" :disabled="hasSubmit" @click="add" style="float: right">下一页</el-button>
        </el-form>
    </div>
        <div v-else-if="page == 2">
            <el-form label-position="right" :model="dataForm" :rules="rules" ref="reportForm" label-width="150px" style="width: 60%; margin: 100px auto">
                <el-form-item label="第一产业" prop="PaymentType">
                    <el-input v-model="dataForm.PaymentType" size="mini"></el-input>
                </el-form-item>
                <el-form-item label="第二产业" prop="OrderID">
                    <el-input v-model="dataForm.OrderID" size="mini"></el-input>
                </el-form-item>
                <el-form-item label="第三产业" prop="PaymentType">
                    <el-input v-model="dataForm.PaymentType" size="mini"></el-input>
                </el-form-item>

            </el-form>
            <el-form label-width="200px" style="width: 60%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
        </div>
        <div v-else-if="page == 3">
            <el-scrollbar style="height:100%;">
            <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" style="width: 90%; margin: 50px auto">
                <el-form-item label="农、林、牧、渔业" prop="Farm">
                    <el-input v-model="dataForm.Farm"></el-input>
                </el-form-item>
                <el-form-item label="采矿业" prop="Mining">
                    <el-input v-model="dataForm.Mining"></el-input>
                </el-form-item>
                <el-form-item label="制造业"prop="Create">
                    <el-input v-model="dataForm.Create"></el-input>
                </el-form-item>
                <el-form-item label="电力、燃气及水的生产和供应业"prop="Electric">
                    <el-input v-model="dataForm.Electric"></el-input>
                </el-form-item>
                <el-form-item label="建筑业"prop="Structure">
                    <el-input v-model="dataForm.Structure"></el-input>
                </el-form-item>
                <el-form-item label="交通运输、仓储和邮政业"prop="traffic">
                    <el-input v-model="dataForm.traffic"></el-input>
                </el-form-item>
                <el-form-item label="信息传输、计算机服务和软件业"prop="information">
                    <el-input v-model="dataForm.information"></el-input>
                </el-form-item>
                <el-form-item label="批发和零售业"prop="wholesale">
                    <el-input v-model="dataForm.wholesale"></el-input>
                </el-form-item>
                <el-form-item label="住宿和餐饮业"prop="room">
                    <el-input v-model="dataForm.room"></el-input>
                </el-form-item>
                <el-form-item label="金融业"prop="financial">
                <el-input v-model="dataForm.financial"></el-input>
                 </el-form-item>
                <el-form-item label="房地产业"prop="estate">
                    <el-input v-model="dataForm.estate"></el-input>
                </el-form-item>
                <el-form-item label="租赁和商务服务业"prop="lease">
                    <el-input v-model="dataForm.lease"></el-input>
                </el-form-item>
                <el-form-item label="科学研究、技术服务和地址勘查业"prop="research">
                    <el-input v-model="dataForm.research"></el-input>
                </el-form-item>
                <el-form-item label="水利、环境和公共设施管理业"prop=" water">
                    <el-input v-model="dataForm.water"></el-input>
                </el-form-item>
                <el-form-item label="居民服务和其他服务业"prop="resident">
                    <el-input v-model="dataForm.resident"></el-input>
                </el-form-item>
                <el-form-item label="教育"prop="education">
                    <el-input v-model="dataForm.education"></el-input>
                </el-form-item>
                <el-form-item label="卫生、社会保障和社会福利业"prop="health">
                    <el-input v-model="dataForm.health"></el-input>
                </el-form-item>
                <el-form-item label="文化、体育和娱乐业"prop="culture">
                    <el-input v-model="dataForm.culture"></el-input>
                </el-form-item>
                <el-form-item label="公共管理与社会组织"prop="management">
                    <el-input v-model="dataForm.management"></el-input>
                </el-form-item>
                <el-form-item label="国际组织"prop="international">
                    <el-input v-model="dataForm.international"></el-input>
                </el-form-item>

            </el-form>
                <el-form label-width="200px" style="width: 60%; margin: 10px auto">
                    <el-button type="primary"  @click="decrease">上一页</el-button>
                    <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
                </el-form>
            </el-scrollbar>
        </div>
        <div v-else-if="page == 4">
            <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
                <el-form-item label="国有企业" prop="state">
                    <el-input v-model="dataForm.state" ></el-input>
                </el-form-item>
                <el-form-item label="集体企业" prop="collective">
                    <el-input v-model="dataForm.collective" ></el-input>
                </el-form-item>
                <el-form-item label="股份合作企业"prop="cooperation">
                    <el-input v-model="dataForm.cooperation"></el-input>
                </el-form-item>
                <el-form-item label="联营企业"prop="joint">
                    <el-input v-model="dataForm.joint"></el-input>
                </el-form-item>
                <el-form-item label="有限责任公公司"prop="limited">
                    <el-input v-model="dataForm.limited"></el-input>
                </el-form-item>
                <el-form-item label="股份有限公司"prop="share">
                    <el-input v-model="dataForm.share"></el-input>
                </el-form-item>
                <el-form-item label="私营企业"prop="private">
                    <el-input v-model="dataForm.private"></el-input>
                </el-form-item>
                <el-form-item label="其他企业"prop="other">
                    <el-input v-model="dataForm.other"></el-input>
                </el-form-item>
                <el-form-item label="港、澳、台投资企业"prop="hk">
                    <el-input v-model="dataForm.hk"></el-input>
                </el-form-item>
                <el-form-item label="外商投资企业"prop="foreign">
                    <el-input v-model="dataForm.foreign"></el-input>
                </el-form-item>
                <el-form-item label="个体经营"prop="self">
                    <el-input v-model="dataForm.self"></el-input>
                </el-form-item>
            </el-form>
            <el-form label-width="200px" style="width: 60%; margin: 10px auto">
                <el-button type="primary"  @click="decrease">上一页</el-button>
                <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
            </el-form>
        </div>

        <div v-else-if="page == 5">
            <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
                <el-form-item label="单位负责人需求人数" prop="Per_Cha_demand">
                    <el-input v-model="dataForm.Per_Cha_demand"></el-input>
                </el-form-item>
                <el-form-item label="单位负责人求职人数" prop="Per_Cha_hunt">
                    <el-input v-model="dataForm.Per_Cha_hunt"></el-input>
                </el-form-item>
                <el-form-item label="专业技术人员需求人数"prop="Pro_Skill_demand">
                    <el-input v-model="dataForm.Pro_Skill_demand"></el-input>
                </el-form-item>
                <el-form-item label="专业技术人员求职人数"prop="Pro_Skill_hunt">
                    <el-input v-model="dataForm.Pro_Skill_hunt"></el-input>
                </el-form-item>
                <el-form-item label="办事人员和有关人员需求人数"prop="Staff_demand">
                    <el-input v-model="dataForm.Staff_demand"></el-input>
                </el-form-item>
                <el-form-item label="办事人员和有关人员求职人数"prop="Staff_hunt">
                    <el-input v-model="dataForm.Staff_hunt"></el-input>
                </el-form-item>
                <el-form-item label="商业和服务人员需求人数"prop="Bus_demand">
                    <el-input v-model="dataForm.Bus_demand"></el-input>
                </el-form-item>
                <el-form-item label="商业和服务人员求职人数"prop="Bus_hunt">
                    <el-input v-model="dataForm.Bus_hunt"></el-input>
                </el-form-item>
                <el-form-item label="农林牧渔水利生产人员需求人数"prop="Product_demand">
                    <el-input v-model="dataForm.Product_demand"></el-input>
                </el-form-item>
                <el-form-item label="农林牧渔水利生产人员求职人数"prop="Product_hunt">
                    <el-input v-model="dataForm.Product_hunt"></el-input>
                </el-form-item>
                <el-form-item label="生产运输设备操作工需求人数"prop="Tran_demand">
                    <el-input v-model="dataForm.Tran_demand"></el-input>
                </el-form-item>
                <el-form-item label="生产运输设备操作工求职人数"prop="Tran_hunt">
                    <el-input v-model="dataForm.Tran_hunt"></el-input>
                </el-form-item>
                <el-form-item label="其他"prop="Other_hunt">
                    <el-input v-model="dataForm.Other_hunt"></el-input>
                </el-form-item>
            </el-form>
            <el-form label-width="200px" style="width: 60%; margin: 10px auto">
                <el-button type="primary"  @click="decrease">上一页</el-button>
                <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
            </el-form>
        </div>

    <div v-else-if="page == 6">
        <el-form label-position="right" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
            <el-form-item label="职业" prop="Smalldemand_type">
                <el-input v-model="dataForm.Smalldemand_type"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="Career_ID">
                <el-input v-model="dataForm.Career_ID" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="需求人数"prop="Smalldemand_demand">
                <el-input v-model="dataForm.Smalldemand_demand"></el-input>
            </el-form-item>
            <el-form-item label="求职人数"prop="Smalldemand_hunt">
                <el-input v-model="dataForm.Smalldemand_hunt"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="200px" style="width: 60%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
        </div>

    <div v-else-if="page == 7">
        <el-form label-position="right" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
            <el-form-item label="职业" prop="Bigdemand_type">
                <el-input v-model="dataForm.Bigdemand_type"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="Career_ID2">
                <el-input v-model="dataForm.Career_ID2"></el-input>
            </el-form-item>
            <el-form-item label="需求人数"prop="Bigdemand_demand">
                <el-input v-model="dataForm.Bigdemand_demand" ></el-input>
            </el-form-item>
            <el-form-item label="求职人数"prop="Bigdemand_hunt">
                <el-input v-model="dataForm.Bigdemand_hunt"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="200px" style="width: 60%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
    </div>

         <div v-else-if="page == 8">
        <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
            <el-form-item label="新成长失业青年" prop="Grow_Hunt_num">
                <el-input v-model="dataForm.Grow_Hunt_num" ></el-input>
            </el-form-item>
            <el-form-item label="就业转失业人员" prop="EmpToUnemp_Hunt_num">
                <el-input v-model="dataForm.EmpToUnemp_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="其他失业人员"prop="Other_Hunt_num">
                <el-input  v-model="dataForm.Other_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="在业人员"prop="Pract_Hunt_num">
                <el-input v-model="dataForm.Pract_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="下岗职工"prop="Laid_off_Hunt_num">
                <el-input v-model="dataForm.Laid_off_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="退休人员"prop="Retiree_Hunt_num">
                <el-input v-model="dataForm.Retiree_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="在学人员"prop="Instructor_Hunt_num">
                <el-input v-model="dataForm.Instructor_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="本市农村人员"prop="City_Hunt_num">
                <el-input v-model="dataForm.City_Hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="外埠人员"prop="OutCity_Hunt_num">
                <el-input v-model="dataForm.OutCity_Hunt_num"></el-input>
            </el-form-item>
        </el-form>
             <el-form label-width="200px" style="width: 60%; margin: 10px auto">
                 <el-button type="primary"  @click="decrease">上一页</el-button>
                 <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
             </el-form>
    </div>

    <div v-else-if="page == 9">
        <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
            <el-form-item label="男性需求人数" prop="Male_req_num">
                <el-input v-model="dataForm.Male_req_num"></el-input>
            </el-form-item>
            <el-form-item label="女性需求人数" prop="Female_req_nmu">
                <el-input v-model="dataForm.Female_req_nmu"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数"prop="No_request_req_num">
                <el-input  v-model="dataForm.No_request_req_num"></el-input>
            </el-form-item>
            <el-form-item label="男性求职人数"prop="Male_hunt_num">
                <el-input v-model="dataForm.Male_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="女性求职人数"prop="Female_hunt_nmu">
                <el-input v-model="dataForm.Female_hunt_nmu"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数"prop="No_request_hunt_numm">
                <el-input v-model="dataForm.No_request_hunt_num"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="200px" style="width: 60%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
    </div>

    <div v-else-if="page == 10">
        <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
            <el-form-item label="16~24岁需求人数" prop="Range_1_req_num">
                <el-input v-model="dataForm.Range_1_req_num"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁需求人数" prop="Range_2_req_num">
                <el-input v-model="dataForm.Range_2_req_num" ></el-input>
            </el-form-item>
            <el-form-item label="35~44岁需求人数"prop="Range_3_req_num">
                <el-input v-model="dataForm.Range_3_req_num"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上需求人数"prop="Range_4_req_num">
                <el-input v-model="dataForm.Range_4_req_num"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数"prop="No_request_req_num">
                <el-input v-model="dataForm.No_request_req_num"></el-input>
            </el-form-item>
            <el-form-item label="16~24岁求职人数"prop="Range_1_hunt_num">
                <el-input v-model="dataForm.Range_1_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁求职人数"prop="Range_2_hunt_num">
                <el-input v-model="dataForm.Range_2_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="35~44岁求职人数"prop="Range_3_hunt_num">
                <el-input v-model="dataForm.Range_3_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上求职人数"prop="Range_4_hunt_num">
                <el-input v-model="dataForm.Range_4_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数"prop="No_request_hunt_num">
                <el-input v-model="dataForm.No_request_hunt_num"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="200px" style="width: 60%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
    </div>

        <div v-else-if="page == 11">
            <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" label-width="300px" style="width: 100%; margin: 10px auto">
                <el-form-item label="初中及以下需求人数" prop="junior_high_school_req_num">
                    <el-input v-model="dataForm.junior_high_school_req_num" ></el-input>
                </el-form-item>
                <el-form-item label="职高需求人数" prop="Voc_req_num">
                    <el-input v-model="dataForm.Voc_req_num" ></el-input>
                </el-form-item>
                <el-form-item label="技校需求人数"prop="Tec_req_num">
                    <el-input v-model="dataForm.Tec_req_num"></el-input>
                </el-form-item>
                <el-form-item label="中专需求人数"prop="Sec_req_num">
                    <el-input v-model="dataForm.Sec_req_num"></el-input>
                </el-form-item>
                <el-form-item label="大专需求人数"prop="College_req_num">
                    <el-input v-model="dataForm.College_req_num"></el-input>
                </el-form-item>
                <el-form-item label="大学需求人数"prop="University_req_num">
                    <el-input v-model="dataForm.University_req_num"></el-input>
                </el-form-item>
                <el-form-item label="硕士需求人数"prop="Master_req_num">
                    <el-input v-model="dataForm.Master_req_num"></el-input>
                </el-form-item>
                <el-form-item label="无要求需求人数"prop="No_request_req_num">
                    <el-input v-model="dataForm.No_request_req_num"></el-input>
                </el-form-item>
                <el-form-item label="初中及以下求职人数"prop="junior_high_school_hunt_num">
                    <el-input v-model="dataForm.junior_high_school_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="职高求职人数"prop="Voc_hunt_num">
                    <el-input v-model="dataForm.Voc_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="技校求职人数"prop="Tec_hunt_num">
                    <el-input v-model="dataForm.Tec_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="中专求职人数"prop="Sec_hunt_num">
                    <el-input v-model="dataForm.Sec_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="大专求职人数"prop="College_hunt_num">
                    <el-input v-model="dataForm.College_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="大学求职人数"prop="University_hunt_num">
                    <el-input v-model="dataForm.University_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="硕士求职人数"prop="Master_hunt_num">
                    <el-input v-model="dataForm.Master_hunt_num"></el-input>
                </el-form-item>
                <el-form-item label="无要求求职人数"prop="No_request_hunt_nmu">
                    <el-input v-model="dataForm.No_request_hunt_nmu"></el-input>
                </el-form-item>
            </el-form>
            <el-form label-width="200px" style="width: 60%; margin: 10px auto">
                <el-button type="primary"  @click="decrease">上一页</el-button>
                <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
            </el-form>
        </div>

    <div v-else-if="page == 12">
        <el-form label-position="right" :inline="true" :model="dataForm" :rulers="rules" ref="reportForm" style="width: 90%; margin: 20px auto">
            <el-form-item label="职业资格五级需求人数" prop="Career_qual_five_req_num">
                <el-input v-model="dataForm.Career_qual_five_req_num" ></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级需求人数" prop="Career_qual_four_req_num">
                <el-input v-model="dataForm.Career_qual_four_req_num" ></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级需求人数"prop="Career_qual_three_req_num">
                <el-input v-model="dataForm.Career_qual_three_req_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级需求人数"prop="Career_qual_two_req_num">
                <el-input v-model="dataForm.Career_qual_two_req_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级需求人数"prop="Career_qual_one_req_num">
                <el-input v-model="dataForm.Career_qual_one_req_num"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务需求人数"prop="Pri_tech_career_req_num">
                <el-input v-model="dataForm.Pri_tech_career_req_num"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务需求人数"prop="Med_tech_career_req_num">
                <el-input v-model="dataForm.Med_tech_career_req_num"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务需求人数"prop="Adv_tech_career_req_num">
                <el-input v-model="dataForm.Adv_tech_career_req_num"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务需求人数"prop="No_tech_career_req_num">
                <el-input v-model="dataForm.No_tech_career_req_num"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数"prop="No_request_req_num">
                <el-input v-model="dataForm.No_request_req_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格五级求职人数"prop="Career_qual_five_hunt_num">
                <el-input v-model="dataForm.Career_qual_five_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级求职人数"prop="Career_qual_four_hunt_num">
                <el-input v-model="dataForm.Career_qual_four_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级求职人数"prop="Career_qual_three_hunt_num">
                <el-input v-model="dataForm.Career_qual_three_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级求职人数"prop="Career_qual_two_hunt_num">
                <el-input v-model="dataForm.Career_qual_two_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级求职人数"prop="Career_qual_one_hunt_num">
                <el-input v-model="dataForm.Career_qual_one_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务求职人数"prop="Pri_tech_career_hunt_num">
                <el-input v-model="dataForm.Pri_tech_career_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务求职人数"prop="Med_tech_career_hunt_num">
                <el-input v-model="dataForm.Med_tech_career_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务求职人数"prop="Adv_tech_career_hunt_num">
                <el-input v-model="dataForm.Adv_tech_career_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务求职人数"prop="No_tech_career_hunt_num">
                <el-input v-model="dataForm.No_tech_career_hunt_num"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数"prop="No_request_hunt_num">
                <el-input v-model="dataForm.No_request_hunt_num"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="200px" style="width: 100%; margin: 10px auto">
            <el-button type="primary"  @click="decrease">上一页</el-button>
            <el-button type="primary"  @click="add" style="float: right">下一页</el-button>
        </el-form>
        <el-form>
        <el-button type="primary" :disabled="hasSubmit" @click="submitForm('reportForm', 'saveAndSubmit')">保存并提交</el-button>
        <el-button type="primary" plain @click="submitForm('reportForm', 'onlySave')" :disabled="hasSubmit" style="margin-left: 10px">仅保存</el-button>
        <el-button @click="resetForm('reportForm')" :disabled="hasSubmit" style="float: right">重置</el-button>
    </el-form>
    </div>

</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/report/reportSubmit.js"></script>
</body>
</html>
