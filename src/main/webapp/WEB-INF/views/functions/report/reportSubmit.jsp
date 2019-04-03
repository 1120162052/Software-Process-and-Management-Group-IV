<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/3/31
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>ssm</title>
    <%@include file="/WEB-INF/views/include/blankHead.jsp" %>
    <link rel="stylesheet" href="/static/css/functions/report/reportSubmit.css"/>
</head>
<body>
<div id="app" v-cloak style="background: white; height: 100%; overflow: hidden" v-loading="fullScreenLoading">
    <div class="reportWrapper">
        <h2>{{showingFormName}}</h2>

        <el-form label-position="right" :model="dataForm" label-width="150px"
                 style="width: 60%; margin: 100px auto" v-if="page == 1">
            <el-form-item label="需求人数" prop="requireNumber">
                <el-input v-model="dataForm.form1.content.requireNumber" :disabled="hasSubmit"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="trueNumber">
                <el-input v-model="dataForm.form1.content.trueNumber" :disabled="hasSubmit"></el-input>
            </el-form-item>
            <el-form-item label="求人倍率" prop="magnification">
                <el-input v-model="dataForm.form1.content.magnification" :disabled="hasSubmit"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :model="dataForm" label-width="150px"
                 style="width: 60%; margin: 100px auto" v-if="page == 2">
            <el-form-item label="第一产业" prop="paymentType">
                <el-input v-model="dataForm.paymentType" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="第二产业" prop="orderID">
                <el-input v-model="dataForm.orderID" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="第三产业" prop="paymentType">
                <el-input v-model="dataForm.paymentType" size="mini"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 style="width: 90%; margin: 50px auto" v-if="page == 3">
            <el-form-item label="农、林、牧、渔业" prop="farm">
                <el-input v-model="dataForm.farm"></el-input>
            </el-form-item>
            <el-form-item label="采矿业" prop="mining">
                <el-input v-model="dataForm.mining"></el-input>
            </el-form-item>
            <el-form-item label="制造业" prop="create">
                <el-input v-model="dataForm.create"></el-input>
            </el-form-item>
            <el-form-item label="电力、燃气及水的生产和供应业" prop="electric">
                <el-input v-model="dataForm.electric"></el-input>
            </el-form-item>
            <el-form-item label="建筑业" prop="structure">
                <el-input v-model="dataForm.structure"></el-input>
            </el-form-item>
            <el-form-item label="交通运输、仓储和邮政业" prop="traffic">
                <el-input v-model="dataForm.traffic"></el-input>
            </el-form-item>
            <el-form-item label="信息传输、计算机服务和软件业" prop="information">
                <el-input v-model="dataForm.information"></el-input>
            </el-form-item>
            <el-form-item label="批发和零售业" prop="wholesale">
                <el-input v-model="dataForm.wholesale"></el-input>
            </el-form-item>
            <el-form-item label="住宿和餐饮业" prop="room">
                <el-input v-model="dataForm.room"></el-input>
            </el-form-item>
            <el-form-item label="金融业" prop="financial">
                <el-input v-model="dataForm.financial"></el-input>
            </el-form-item>
            <el-form-item label="房地产业" prop="estate">
                <el-input v-model="dataForm.estate"></el-input>
            </el-form-item>
            <el-form-item label="租赁和商务服务业" prop="lease">
                <el-input v-model="dataForm.lease"></el-input>
            </el-form-item>
            <el-form-item label="科学研究、技术服务和地址勘查业" prop="research">
                <el-input v-model="dataForm.research"></el-input>
            </el-form-item>
            <el-form-item label="水利、环境和公共设施管理业" prop=" water">
                <el-input v-model="dataForm.water"></el-input>
            </el-form-item>
            <el-form-item label="居民服务和其他服务业" prop="resident">
                <el-input v-model="dataForm.resident"></el-input>
            </el-form-item>
            <el-form-item label="教育" prop="education">
                <el-input v-model="dataForm.education"></el-input>
            </el-form-item>
            <el-form-item label="卫生、社会保障和社会福利业" prop="health">
                <el-input v-model="dataForm.health"></el-input>
            </el-form-item>
            <el-form-item label="文化、体育和娱乐业" prop="culture">
                <el-input v-model="dataForm.culture"></el-input>
            </el-form-item>
            <el-form-item label="公共管理与社会组织" prop="management">
                <el-input v-model="dataForm.management"></el-input>
            </el-form-item>
            <el-form-item label="国际组织" prop="international">
                <el-input v-model="dataForm.international"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 4">
            <el-form-item label="国有企业" prop="state">
                <el-input v-model="dataForm.state"></el-input>
            </el-form-item>
            <el-form-item label="集体企业" prop="collective">
                <el-input v-model="dataForm.collective"></el-input>
            </el-form-item>
            <el-form-item label="股份合作企业" prop="cooperation">
                <el-input v-model="dataForm.cooperation"></el-input>
            </el-form-item>
            <el-form-item label="联营企业" prop="joint">
                <el-input v-model="dataForm.joint"></el-input>
            </el-form-item>
            <el-form-item label="有限责任公公司" prop="limited">
                <el-input v-model="dataForm.limited"></el-input>
            </el-form-item>
            <el-form-item label="股份有限公司" prop="share">
                <el-input v-model="dataForm.share"></el-input>
            </el-form-item>
            <el-form-item label="私营企业" prop="private">
                <el-input v-model="dataForm.private"></el-input>
            </el-form-item>
            <el-form-item label="其他企业" prop="other">
                <el-input v-model="dataForm.other"></el-input>
            </el-form-item>
            <el-form-item label="港、澳、台投资企业" prop="hk">
                <el-input v-model="dataForm.hk"></el-input>
            </el-form-item>
            <el-form-item label="外商投资企业" prop="foreign">
                <el-input v-model="dataForm.foreign"></el-input>
            </el-form-item>
            <el-form-item label="个体经营" prop="self">
                <el-input v-model="dataForm.self"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 5">
            <el-form-item label="国有企业" prop="state">
                <el-input v-model="dataForm.state"></el-input>
            </el-form-item>
            <el-form-item label="集体企业" prop="collective">
                <el-input v-model="dataForm.collective"></el-input>
            </el-form-item>
            <el-form-item label="股份合作企业" prop="cooperation">
                <el-input v-model="dataForm.cooperation"></el-input>
            </el-form-item>
            <el-form-item label="联营企业" prop="joint">
                <el-input v-model="dataForm.joint"></el-input>
            </el-form-item>
            <el-form-item label="有限责任公公司" prop="limited">
                <el-input v-model="dataForm.limited"></el-input>
            </el-form-item>
            <el-form-item label="股份有限公司" prop="share">
                <el-input v-model="dataForm.share"></el-input>
            </el-form-item>
            <el-form-item label="私营企业" prop="private">
                <el-input v-model="dataForm.private"></el-input>
            </el-form-item>
            <el-form-item label="其他企业" prop="other">
                <el-input v-model="dataForm.other"></el-input>
            </el-form-item>
            <el-form-item label="港、澳、台投资企业" prop="hk">
                <el-input v-model="dataForm.hk"></el-input>
            </el-form-item>
            <el-form-item label="外商投资企业" prop="foreign">
                <el-input v-model="dataForm.foreign"></el-input>
            </el-form-item>
            <el-form-item label="个体经营" prop="self">
                <el-input v-model="dataForm.self"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 6">
            <el-form-item label="单位负责人需求人数" prop="perChaDemand">
                <el-input v-model="dataForm.perChaDemand"></el-input>
            </el-form-item>
            <el-form-item label="单位负责人求职人数" prop="perChaHunt">
                <el-input v-model="dataForm.perChaHunt"></el-input>
            </el-form-item>
            <el-form-item label="专业技术人员需求人数" prop="proSkillDemand">
                <el-input v-model="dataForm.proSkillDemand"></el-input>
            </el-form-item>
            <el-form-item label="专业技术人员求职人数" prop="proSkillHunt">
                <el-input v-model="dataForm.proSkillHunt"></el-input>
            </el-form-item>
            <el-form-item label="办事人员和有关人员需求人数" prop="staffDemand">
                <el-input v-model="dataForm.staffDemand"></el-input>
            </el-form-item>
            <el-form-item label="办事人员和有关人员求职人数" prop="staffHunt">
                <el-input v-model="dataForm.staffHunt"></el-input>
            </el-form-item>
            <el-form-item label="商业和服务人员需求人数" prop="busDemand">
                <el-input v-model="dataForm.busDemand"></el-input>
            </el-form-item>
            <el-form-item label="商业和服务人员求职人数" prop="busHunt">
                <el-input v-model="dataForm.busHunt"></el-input>
            </el-form-item>
            <el-form-item label="农林牧渔水利生产人员需求人数" prop="productDemand">
                <el-input v-model="dataForm.productDemand"></el-input>
            </el-form-item>
            <el-form-item label="农林牧渔水利生产人员求职人数" prop="productHunt">
                <el-input v-model="dataForm.productHunt"></el-input>
            </el-form-item>
            <el-form-item label="生产运输设备操作工需求人数" prop="tranDemand">
                <el-input v-model="dataForm.tranDemand"></el-input>
            </el-form-item>
            <el-form-item label="生产运输设备操作工求职人数" prop="tranHunt">
                <el-input v-model="dataForm.tranHunt"></el-input>
            </el-form-item>
            <el-form-item label="其他" prop="otherHunt">
                <el-input v-model="dataForm.otherHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :model="dataForm" label-width="300px"
                 style="width: 100%; margin: 10px auto" v-if="page == 7">
            <el-form-item label="职业" prop="smallDemandType">
                <el-input v-model="dataForm.smallDemandType"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="careerID">
                <el-input v-model="dataForm.careerID" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="需求人数" prop="smallDemandHunt">
                <el-input v-model="dataForm.smallDemandHunt"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="smallDemandHunt">
                <el-input v-model="dataForm.smallDemandHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :model="dataForm" label-width="300px"
                 style="width: 100%; margin: 10px auto" v-if="page == 8">
            <el-form-item label="职业" prop="bigDemandType">
                <el-input v-model="dataForm.bigDemandType"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="careerID2">
                <el-input v-model="dataForm.CareerID2"></el-input>
            </el-form-item>
            <el-form-item label="需求人数" prop="bigDemandHunt">
                <el-input v-model="dataForm.bigDemandHunt"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="bigDemandHunt">
                <el-input v-model="dataForm.bigDemandHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 9">
            <el-form-item label="新成长失业青年" prop="growHuntNum">
                <el-input v-model="dataForm.growHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="就业转失业人员" prop="empToUnempHuntNum">
                <el-input v-model="dataForm.empToUnempHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="其他失业人员" prop="otherHuntNum">
                <el-input v-model="dataForm.otherHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="在业人员" prop="practHuntNum">
                <el-input v-model="dataForm.practHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="下岗职工" prop="laidOffHuntNum">
                <el-input v-model="dataForm.laidOffHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="退休人员" prop="retireHuntNum">
                <el-input v-model="dataForm.retireHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="在学人员" prop="instructorHuntNum">
                <el-input v-model="dataForm.instructorHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="本市农村人员" prop="cityHuntNum">
                <el-input v-model="dataForm.cityHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="外埠人员" prop="outCityHuntNum">
                <el-input v-model="dataForm.outCityHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 10">
            <el-form-item label="男性需求人数" prop="maleReqNum">
                <el-input v-model="dataForm.maleReqNum"></el-input>
            </el-form-item>
            <el-form-item label="女性需求人数" prop="femaleReqNum">
                <el-input v-model="dataForm.femaleReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="男性求职人数" prop="maleHuntNum">
                <el-input v-model="dataForm.maleHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="女性求职人数" prop="femaleHuntNum">
                <el-input v-model="dataForm.femaleHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 11">
            <el-form-item label="16~24岁需求人数" prop="Range1ReqNum">
                <el-input v-model="dataForm.Range1ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁需求人数" prop="Range2ReqNum">
                <el-input v-model="dataForm.Range2ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="35~44岁需求人数" prop="Range3ReqNum">
                <el-input v-model="dataForm.Range3ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上需求人数" prop="Range4ReqNum">
                <el-input v-model="dataForm.Range4ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="16~24岁求职人数" prop="Range1HuntNum">
                <el-input v-model="dataForm.Range1HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁求职人数" prop="Range2HuntNum">
                <el-input v-model="dataForm.Range2HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="35~44岁求职人数" prop="Range3HuntNum">
                <el-input v-model="dataForm.Range3HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上求职人数" prop="Range4HuntNum">
                <el-input v-model="dataForm.Range4HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 12">
            <el-form-item label="初中及以下需求人数" prop="juniorHighSchoolReqNum">
                <el-input v-model="dataForm.juniorHighSchoolReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职高需求人数" prop="vocReqNum">
                <el-input v-model="dataForm.vocReqNum"></el-input>
            </el-form-item>
            <el-form-item label="技校需求人数" prop="tecReqNum">
                <el-input v-model="dataForm.tecReqNum"></el-input>
            </el-form-item>
            <el-form-item label="中专需求人数" prop="secReqNum">
                <el-input v-model="dataForm.secReqNum"></el-input>
            </el-form-item>
            <el-form-item label="大专需求人数" prop="collegeReqNum">
                <el-input v-model="dataForm.collegeReqNum"></el-input>
            </el-form-item>
            <el-form-item label="大学需求人数" prop="universityReqNum">
                <el-input v-model="dataForm.universityReqNum"></el-input>
            </el-form-item>
            <el-form-item label="硕士需求人数" prop="masterReqNum">
                <el-input v-model="dataForm.masterReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="初中及以下求职人数" prop="juniorHighSchoolHuntNum">
                <el-input v-model="dataForm.juniorHighSchoolHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职高求职人数" prop="vocHuntNum">
                <el-input v-model="dataForm.vocHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="技校求职人数" prop="tecHuntNum">
                <el-input v-model="dataForm.tecHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="中专求职人数" prop="secHuntNum">
                <el-input v-model="dataForm.secHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="大专求职人数" prop="collegeHuntNum">
                <el-input v-model="dataForm.collegeHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="大学求职人数" prop="universityHuntNum">
                <el-input v-model="dataForm.universityHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="硕士求职人数" prop="masterHuntNum">
                <el-input v-model="dataForm.masterHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 style="width: 90%; margin: 20px auto" v-if="page == 13">
            <el-form-item label="职业资格五级需求人数" prop="careerQualFiveReqNum">
                <el-input v-model="dataForm.careerQualFiveReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级需求人数" prop="careerQualFourReqNum">
                <el-input v-model="dataForm.careerQualFourReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级需求人数" prop="careerQualThreeReqNum">
                <el-input v-model="dataForm.careerQualThreeReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级需求人数" prop="careerQualTwoReqNum">
                <el-input v-model="dataForm.careerQualTwoReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级需求人数" prop="careerQualOneReqNum">
                <el-input v-model="dataForm.careerQualOneReqNum"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务需求人数" prop="priTechCareerReqNum">
                <el-input v-model="dataForm.priTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务需求人数" prop="medTechCareerReqNum">
                <el-input v-model="dataForm.medTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务需求人数" prop="advTechCareerReqNum">
                <el-input v-model="dataForm.advTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务需求人数" prop="noTechCareerReqNum">
                <el-input v-model="dataForm.noTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格五级求职人数" prop="careerQualFiveHuntNum">
                <el-input v-model="dataForm.careerQualFiveHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级求职人数" prop="careerQualFourHuntNum">
                <el-input v-model="dataForm.careerQualFourHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级求职人数" prop="careerQualThreeHuntNum">
                <el-input v-model="dataForm.careerQualThreeHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级求职人数" prop="careerQualTwoHuntNum">
                <el-input v-model="dataForm.careerQualTwoHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级求职人数" prop="careerQualOneHuntNum">
                <el-input v-model="dataForm.careerQualOneHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务求职人数" prop="priTechCareerHuntNum">
                <el-input v-model="dataForm.priTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务求职人数" prop="medTechCareerHuntNum">
                <el-input v-model="dataForm.medTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务求职人数" prop="advTechCareerHuntNum">
                <el-input v-model="dataForm.advTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务求职人数" prop="noTechCareerHuntNum">
                <el-input v-model="dataForm.noTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>
    </div>

    <div>
        <el-form label-width="200px" style="width: 100%; margin: 10px auto">
            <el-button type="primary" @click="decrease">上一页</el-button>
            <el-button type="primary" @click="add" style="float: right">下一页</el-button>
        </el-form>
        <el-form>
            <el-button type="primary" :disabled="hasSubmit" @click="submitForm('reportForm', 'saveAndSubmit')">保存并提交
            </el-button>
            <el-button type="primary" plain @click="submitForm('reportForm', 'onlySave')" :disabled="hasSubmit"
                       style="margin-left: 10px">仅保存
            </el-button>
            <el-button @click="resetForm('reportForm')" :disabled="hasSubmit" style="float: right">重置</el-button>
        </el-form>
    </div>

</div>
<%@include file="/WEB-INF/views/include/blankScript.jsp" %>
<script src="/static/js/functions/report/reportSubmit.js"></script>
</body>
</html>
