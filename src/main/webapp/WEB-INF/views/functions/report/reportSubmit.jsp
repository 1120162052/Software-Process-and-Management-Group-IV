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
                <el-input v-model="dataForm.form2.content.paymentType" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="第二产业" prop="orderID">
                <el-input v-model="dataForm.form2.content.orderID" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="第三产业" prop="paymentType">
                <el-input v-model="dataForm.form2.content.paymentType" size="mini"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 style="width: 90%; margin: 50px auto" v-if="page == 3">
            <el-form-item label="农、林、牧、渔业" prop="farm">
                <el-input v-model="dataForm.form3.content.farm"></el-input>
            </el-form-item>
            <el-form-item label="采矿业" prop="mining">
                <el-input v-model="dataForm.form3.content.mining"></el-input>
            </el-form-item>
            <el-form-item label="制造业" prop="create">
                <el-input v-model="dataForm.form3.content.create"></el-input>
            </el-form-item>
            <el-form-item label="电力、燃气及水的生产和供应业" prop="electric">
                <el-input v-model="dataForm.form3.content.electric"></el-input>
            </el-form-item>
            <el-form-item label="建筑业" prop="structure">
                <el-input v-model="dataForm.form3.content.structure"></el-input>
            </el-form-item>
            <el-form-item label="交通运输、仓储和邮政业" prop="traffic">
                <el-input v-model="dataForm.form3.content.traffic"></el-input>
            </el-form-item>
            <el-form-item label="信息传输、计算机服务和软件业" prop="information">
                <el-input v-model="dataForm.form3.content.information"></el-input>
            </el-form-item>
            <el-form-item label="批发和零售业" prop="wholesale">
                <el-input v-model="dataForm.form3.content.wholesale"></el-input>
            </el-form-item>
            <el-form-item label="住宿和餐饮业" prop="room">
                <el-input v-model="dataForm.form3.content.room"></el-input>
            </el-form-item>
            <el-form-item label="金融业" prop="financial">
                <el-input v-model="dataForm.form3.content.financial"></el-input>
            </el-form-item>
            <el-form-item label="房地产业" prop="estate">
                <el-input v-model="dataForm.form3.content.estate"></el-input>
            </el-form-item>
            <el-form-item label="租赁和商务服务业" prop="lease">
                <el-input v-model="dataForm.form3.content.lease"></el-input>
            </el-form-item>
            <el-form-item label="科学研究、技术服务和地址勘查业" prop="research">
                <el-input v-model="dataForm.form3.content.research"></el-input>
            </el-form-item>
            <el-form-item label="水利、环境和公共设施管理业" prop=" water">
                <el-input v-model="dataForm.form3.content.water"></el-input>
            </el-form-item>
            <el-form-item label="居民服务和其他服务业" prop="resident">
                <el-input v-model="dataForm.form3.content.resident"></el-input>
            </el-form-item>
            <el-form-item label="教育" prop="education">
                <el-input v-model="dataForm.form3.content.education"></el-input>
            </el-form-item>
            <el-form-item label="卫生、社会保障和社会福利业" prop="health">
                <el-input v-model="dataForm.form3.content.health"></el-input>
            </el-form-item>
            <el-form-item label="文化、体育和娱乐业" prop="culture">
                <el-input v-model="dataForm.form3.content.culture"></el-input>
            </el-form-item>
            <el-form-item label="公共管理与社会组织" prop="management">
                <el-input v-model="dataForm.form3.content.management"></el-input>
            </el-form-item>
            <el-form-item label="国际组织" prop="international">
                <el-input v-model="dataForm.form3.content.international"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 4">
            <el-form-item label="国有企业" prop="state">
                <el-input v-model="dataForm.form4.content.state"></el-input>
            </el-form-item>
            <el-form-item label="集体企业" prop="collective">
                <el-input v-model="dataForm.form4.content.collective"></el-input>
            </el-form-item>
            <el-form-item label="股份合作企业" prop="cooperation">
                <el-input v-model="dataForm.form4.content.cooperation"></el-input>
            </el-form-item>
            <el-form-item label="联营企业" prop="joint">
                <el-input v-model="dataForm.form4.content.joint"></el-input>
            </el-form-item>
            <el-form-item label="有限责任公公司" prop="limited">
                <el-input v-model="dataForm.form4.content.limited"></el-input>
            </el-form-item>
            <el-form-item label="股份有限公司" prop="share">
                <el-input v-model="dataForm.form4.content.share"></el-input>
            </el-form-item>
            <el-form-item label="私营企业" prop="private">
                <el-input v-model="dataForm.form4.content.private"></el-input>
            </el-form-item>
            <el-form-item label="其他企业" prop="other">
                <el-input v-model="dataForm.form4.content.other"></el-input>
            </el-form-item>
            <el-form-item label="港、澳、台投资企业" prop="hk">
                <el-input v-model="dataForm.form4.content.hk"></el-input>
            </el-form-item>
            <el-form-item label="外商投资企业" prop="foreign">
                <el-input v-model="dataForm.form4.content.foreign"></el-input>
            </el-form-item>
            <el-form-item label="个体经营" prop="self">
                <el-input v-model="dataForm.form4.content.self"></el-input>
            </el-form-item>
        </el-form>


        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 5">
            <el-form-item label="单位负责人需求人数" prop="perChaDemand">
                <el-input v-model="dataForm.form5.content.perChaDemand"></el-input>
            </el-form-item>
            <el-form-item label="单位负责人求职人数" prop="perChaHunt">
                <el-input v-model="dataForm.form5.content.perChaHunt"></el-input>
            </el-form-item>
            <el-form-item label="专业技术人员需求人数" prop="proSkillDemand">
                <el-input v-model="dataForm.form5.content.proSkillDemand"></el-input>
            </el-form-item>
            <el-form-item label="专业技术人员求职人数" prop="proSkillHunt">
                <el-input v-model="dataForm.form5.content.proSkillHunt"></el-input>
            </el-form-item>
            <el-form-item label="办事人员和有关人员需求人数" prop="staffDemand">
                <el-input v-model="dataForm.form5.content.staffDemand"></el-input>
            </el-form-item>
            <el-form-item label="办事人员和有关人员求职人数" prop="staffHunt">
                <el-input v-model="dataForm.form5.content.staffHunt"></el-input>
            </el-form-item>
            <el-form-item label="商业和服务人员需求人数" prop="busDemand">
                <el-input v-model="dataForm.form5.content.busDemand"></el-input>
            </el-form-item>
            <el-form-item label="商业和服务人员求职人数" prop="busHunt">
                <el-input v-model="dataForm.form5.content.busHunt"></el-input>
            </el-form-item>
            <el-form-item label="农林牧渔水利生产人员需求人数" prop="productDemand">
                <el-input v-model="dataForm.form5.content.productDemand"></el-input>
            </el-form-item>
            <el-form-item label="农林牧渔水利生产人员求职人数" prop="productHunt">
                <el-input v-model="dataForm.form5.content.productHunt"></el-input>
            </el-form-item>
            <el-form-item label="生产运输设备操作工需求人数" prop="tranDemand">
                <el-input v-model="dataForm.form5.content.tranDemand"></el-input>
            </el-form-item>
            <el-form-item label="生产运输设备操作工求职人数" prop="tranHunt">
                <el-input v-model="dataForm.form5.content.tranHunt"></el-input>
            </el-form-item>
            <el-form-item label="其他" prop="otherHunt">
                <el-input v-model="dataForm.form5.content.otherHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :model="dataForm" label-width="300px"
                 style="width: 100%; margin: 10px auto" v-if="page == 6">
            <el-form-item label="职业" prop="smallDemandType">
                <el-input v-model="dataForm.form6.content.smallDemandType"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="careerID">
                <el-input v-model="dataForm.form6.content.careerID" size="mini"></el-input>
            </el-form-item>
            <el-form-item label="需求人数" prop="smallDemandHunt">
                <el-input v-model="dataForm.form6.content.smallDemandHunt"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="smallDemandHunt">
                <el-input v-model="dataForm.form6.content.smallDemandHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :model="dataForm" label-width="300px"
                 style="width: 100%; margin: 10px auto" v-if="page == 7">
            <el-form-item label="职业" prop="bigDemandType">
                <el-input v-model="dataForm.form7.content.bigDemandType"></el-input>
            </el-form-item>
            <el-form-item label="职业代码" prop="careerID2">
                <el-input v-model="dataForm.form7.content.CareerID2"></el-input>
            </el-form-item>
            <el-form-item label="需求人数" prop="bigDemandHunt">
                <el-input v-model="dataForm.form7.content.bigDemandHunt"></el-input>
            </el-form-item>
            <el-form-item label="求职人数" prop="bigDemandHunt">
                <el-input v-model="dataForm.form7.content.bigDemandHunt"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 8">
            <el-form-item label="新成长失业青年" prop="growHuntNum">
                <el-input v-model="dataForm.form8.content.growHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="就业转失业人员" prop="empToUnempHuntNum">
                <el-input v-model="dataForm.form8.content.empToUnempHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="其他失业人员" prop="otherHuntNum">
                <el-input v-model="dataForm.form8.content.otherHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="在业人员" prop="practHuntNum">
                <el-input v-model="dataForm.form8.content.practHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="下岗职工" prop="laidOffHuntNum">
                <el-input v-model="dataForm.form8.content.laidOffHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="退休人员" prop="retireHuntNum">
                <el-input v-model="dataForm.form8.content.retireHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="在学人员" prop="instructorHuntNum">
                <el-input v-model="dataForm.form8.content.instructorHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="本市农村人员" prop="cityHuntNum">
                <el-input v-model="dataForm.form8.content.cityHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="外埠人员" prop="outCityHuntNum">
                <el-input v-model="dataForm.form8.content.outCityHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 9">
            <el-form-item label="男性需求人数" prop="maleReqNum">
                <el-input v-model="dataForm.form9.content.maleReqNum"></el-input>
            </el-form-item>
            <el-form-item label="女性需求人数" prop="femaleReqNum">
                <el-input v-model="dataForm.form9.content.femaleReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.form9.content.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="男性求职人数" prop="maleHuntNum">
                <el-input v-model="dataForm.form9.content.maleHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="女性求职人数" prop="femaleHuntNum">
                <el-input v-model="dataForm.form9.content.femaleHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.form9.content.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 10">
            <el-form-item label="16~24岁需求人数" prop="Range1ReqNum">
                <el-input v-model="dataForm.form10.content.Range1ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁需求人数" prop="Range2ReqNum">
                <el-input v-model="dataForm.form10.content.Range2ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="35~44岁需求人数" prop="Range3ReqNum">
                <el-input v-model="dataForm.form10.content.Range3ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上需求人数" prop="Range4ReqNum">
                <el-input v-model="dataForm.form10.content.Range4ReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.form10.content.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="16~24岁求职人数" prop="Range1HuntNum">
                <el-input v-model="dataForm.form10.content.Range1HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="25~34岁求职人数" prop="Range2HuntNum">
                <el-input v-model="dataForm.form10.content.Range2HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="35~44岁求职人数" prop="Range3HuntNum">
                <el-input v-model="dataForm.form10.content.Range3HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="45岁以上求职人数" prop="Range4HuntNum">
                <el-input v-model="dataForm.form10.content.Range4HuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.form10.content.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 label-width="300px" style="width: 100%; margin: 10px auto" v-if="page == 11">
            <el-form-item label="初中及以下需求人数" prop="juniorHighSchoolReqNum">
                <el-input v-model="dataForm.form11.content.juniorHighSchoolReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职高需求人数" prop="vocReqNum">
                <el-input v-model="dataForm.form11.content.vocReqNum"></el-input>
            </el-form-item>
            <el-form-item label="技校需求人数" prop="tecReqNum">
                <el-input v-model="dataForm.form11.content.tecReqNum"></el-input>
            </el-form-item>
            <el-form-item label="中专需求人数" prop="secReqNum">
                <el-input v-model="dataForm.form11.content.secReqNum"></el-input>
            </el-form-item>
            <el-form-item label="大专需求人数" prop="collegeReqNum">
                <el-input v-model="dataForm.form11.content.collegeReqNum"></el-input>
            </el-form-item>
            <el-form-item label="大学需求人数" prop="universityReqNum">
                <el-input v-model="dataForm.form11.content.universityReqNum"></el-input>
            </el-form-item>
            <el-form-item label="硕士需求人数" prop="masterReqNum">
                <el-input v-model="dataForm.form11.content.masterReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.form11.content.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="初中及以下求职人数" prop="juniorHighSchoolHuntNum">
                <el-input v-model="dataForm.form11.content.juniorHighSchoolHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职高求职人数" prop="vocHuntNum">
                <el-input v-model="dataForm.form11.content.vocHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="技校求职人数" prop="tecHuntNum">
                <el-input v-model="dataForm.form11.content.tecHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="中专求职人数" prop="secHuntNum">
                <el-input v-model="dataForm.form11.content.secHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="大专求职人数" prop="collegeHuntNum">
                <el-input v-model="dataForm.form11.content.collegeHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="大学求职人数" prop="universityHuntNum">
                <el-input v-model="dataForm.form11.content.universityHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="硕士求职人数" prop="masterHuntNum">
                <el-input v-model="dataForm.form11.content.masterHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.form11.content.noRequestHuntNum"></el-input>
            </el-form-item>
        </el-form>

        <el-form label-position="right" :inline="true" :model="dataForm"
                 style="width: 90%; margin: 20px auto" v-if="page == 12">
            <el-form-item label="职业资格五级需求人数" prop="careerQualFiveReqNum">
                <el-input v-model="dataForm.form12.content.careerQualFiveReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级需求人数" prop="careerQualFourReqNum">
                <el-input v-model="dataForm.form12.content.careerQualFourReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级需求人数" prop="careerQualThreeReqNum">
                <el-input v-model="dataForm.form12.content.careerQualThreeReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级需求人数" prop="careerQualTwoReqNum">
                <el-input v-model="dataForm.form12.content.careerQualTwoReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级需求人数" prop="careerQualOneReqNum">
                <el-input v-model="dataForm.form12.content.careerQualOneReqNum"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务需求人数" prop="priTechCareerReqNum">
                <el-input v-model="dataForm.form12.content.priTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务需求人数" prop="medTechCareerReqNum">
                <el-input v-model="dataForm.form12.content.medTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务需求人数" prop="advTechCareerReqNum">
                <el-input v-model="dataForm.form12.content.advTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务需求人数" prop="noTechCareerReqNum">
                <el-input v-model="dataForm.form12.content.noTechCareerReqNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求需求人数" prop="noRequestReqNum">
                <el-input v-model="dataForm.form12.content.noRequestReqNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格五级求职人数" prop="careerQualFiveHuntNum">
                <el-input v-model="dataForm.form12.content.careerQualFiveHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格四级求职人数" prop="careerQualFourHuntNum">
                <el-input v-model="dataForm.form12.content.careerQualFourHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格三级求职人数" prop="careerQualThreeHuntNum">
                <el-input v-model="dataForm.form12.content.careerQualThreeHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格二级求职人数" prop="careerQualTwoHuntNum">
                <el-input v-model="dataForm.form12.content.careerQualTwoHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="职业资格一级求职人数" prop="careerQualOneHuntNum">
                <el-input v-model="dataForm.form12.content.careerQualOneHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="初级专业技术职务求职人数" prop="priTechCareerHuntNum">
                <el-input v-model="dataForm.form12.content.priTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="中级专业技术职务求职人数" prop="medTechCareerHuntNum">
                <el-input v-model="dataForm.form12.content.medTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="高级专业技术职务求职人数" prop="advTechCareerHuntNum">
                <el-input v-model="dataForm.form12.content.advTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无需求等级或职务求职人数" prop="noTechCareerHuntNum">
                <el-input v-model="dataForm.form12.content.noTechCareerHuntNum"></el-input>
            </el-form-item>
            <el-form-item label="无要求求职人数" prop="noRequestHuntNum">
                <el-input v-model="dataForm.form12.content.noRequestHuntNum"></el-input>
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
