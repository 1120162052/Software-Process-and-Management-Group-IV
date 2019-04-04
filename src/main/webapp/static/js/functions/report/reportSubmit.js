let app = new Vue({
    el: '#app',
    data: {
        user: '',
        urls: {
            update: "/api/sys/Dict/update",
        },
        fullScreenLoading: false,
        hasSave: false,
        hasSubmit: false,
        page: 1,
        showingFormName: '供求总体人数',
        dataForm: [
            {
                name: '供求总体人数',
                content: {
                    requireNumber: '',
                    trueNumber: '',
                    magnification: ''
                }
            },
            {
                name: '按产业分组的需求人数',
                content: {
                    paymentType: '',
                    orderID: '',
                    paymentType: ''
                }
            },
            {
                name: '按行业分组的需求人数',
                content: {
                    farm: '',
                    mining: '',
                    create: '',
                    electric: '',
                    structure: '',
                    traffic: '',
                    information: '',
                    wholesale: '',
                    room: '',
                    financial: '',
                    estate: '',
                    lease: '',
                    research: '',
                    water: '',
                    resident: '',
                    education: '',
                    health: '',
                    culture: '',
                    management: '',
                    international: ''
                }
            },
            {
                name: '按用人单位性质分组的需求人数',
                content: {
                    state: '',
                    collective: '',
                    cooperation: '',
                    joint: '',
                    limited: '',
                    share: '',
                    private: '',
                    other: '',
                    hk: '',
                    foreign: '',
                    self: '',
                }
            },
            {
                name: '按职业分组的供求人数',
                content: {
                    perChaDemand: '',
                    perChaHunt: '',
                    proSkillDemand: '',
                    proSkillHunt: '',
                    staffDemand: '',
                    staffHunt: '',
                    busDemand: '',
                    busHunt: '',
                    productDemand: '',
                    productHunt: '',
                    tranDemand: '',
                    tranHunt: '',
                    otherHunt: ''
                }
            },
            {
                name: '需求小于求职缺口最大的前十个职业',
                content: {
                    smallDemandType: '',
                    careerID: '',
                    smallDemandHunt: '',
                    smallDemandHunt: ''
                }
            },
            {
                name: '需求大于求职缺口最大的前十个职业',
                content: {
                    bigDemandType: '',
                    careerID2: '',
                    bigDemandHunt: '',
                    bigDemandHunt: ''
                }
            },
            {
                name: '按求职人员类别分组的求职人数',
                content: {
                    growHuntNum: '',
                    empToUnempHuntNum: '',
                    otherHuntNum: '',
                    practHuntNum: '',
                    laidOffHuntNum: '',
                    retireHuntNum: '',
                    instructorHuntNum: '',
                    cityHuntNum: '',
                    outCityHuntNum: ''
                }
            },
            {
                name: '按性别分组的供求人数',
                content: {
                    maleReqNum: '',
                    femaleReqNum: '',
                    noRequestReqNum: '',
                    maleHuntNum: '',
                    femaleHuntNum: '',
                    noRequestHuntNum: ''
                }
            },
            {
                name: '按年龄分组的供求人数',
                content: {
                    Range1ReqNum: '',
                    Range2ReqNum: '',
                    Range3ReqNum: '',
                    Range4ReqNum: '',
                    noRequestReqNum: '',
                    Range1HuntNum: '',
                    Range2HuntNum: '',
                    Range3HuntNum: '',
                    Range4HuntNum: '',
                    noRequestHuntNum: ''
                }
            },
            {
                name: '按文化程度分组的供求人数',
                content: {
                    juniorHighSchoolReqNum: '',
                    vocReqNum: '',
                    tecReqNum: '',
                    secReqNum: '',
                    collegeReqNum: '',
                    universityReqNum: '',
                    masterReqNum: '',
                    noRequestReqNum: '',
                    juniorHighSchoolHuntNum: '',
                    vocHuntNum: '',
                    tecHuntNum: '',
                    secHuntNum: '',
                    collegeHuntNum: '',
                    universityHuntNum: '',
                    masterHuntNum: '',
                    noRequestHuntNum: ''
                }
            },
            {
                name: '按技术等级分组的供求人数',
                content: {
                    careerQualFiveReqNum: '',
                    careerQualFourReqNum: '',
                    careerQualThreeReqNum: '',
                    careerQualTwoReqNum: '',
                    careerQualOneReqNum: '',
                    priTechCareerReqNum: '',
                    medTechCareerReqNum: '',
                    advTechCareerReqNum: '',
                    noTechCareerReqNum: '',
                    noRequestReqNum: '',
                    careerQualFiveHuntNum: '',
                    careerQualFourHuntNum: '',
                    careerQualThreeHuntNum: '',
                    careerQualTwoHuntNum: '',
                    careerQualOneHuntNum: '',
                    priTechCareerHuntNum: '',
                    medTechCareerHuntNum: '',
                    advTechCareerHuntNum: '',
                    noTechCareerHuntNum: '',
                    noRequestHuntNum: ''
                }
            },
        ],
    },
    methods: {
        submitForm(formName, operateType) {
            let app = this;
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    let data = app.user;
                    if (operateType === 'onlySave') {
                        data.recordStatus = 0;
                    } else if (operateType === 'saveAndSubmit') {
                        data.recordStatus = 1;
                    }
                    data.requireNumber = app.dataForm.requireNumber;
                    data.trueNumber = app.dataForm.trueNumber;
                    data.Magnification = app.dataForm.Magnification;
                    app.fullScreenLoading = true;
                    ajaxPostJSON(app.urls.update, data, function (d) {
                        app.fullScreenLoading = false;
                        if (d.code === 'success') {
                            if (operateType === 'saveAndSubmit') {
                                app.hasSubmit = true;
                            }
                            window.parent.app.showMessage('操作成功', 'success');
                            return true;
                        } else {
                            window.parent.app.showMessage('操作失败', 'error');
                            return false;
                        }
                    });
                }
                else {
                    return false;
                }
            });

        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
        add() {
            if(this.page < 12) {
                this.page++;
                this.showingFormName = this.dataForm[this.page - 1].name;
            } else {
                window.parent.app.showMessage('已到达第一页！', 'info');
            }
        },
        decrease() {
            if (this.page > 1) {
                this.page--;
                this.showingFormName = this.dataForm[this.page - 1].name;
            } else {
                window.parent.app.showMessage('已到达最后一页！', 'info');
            }
        }
    },
    mounted: function () {
        let app = this;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function (d) {
            app.user = d.data;
            app.dataForm.requireNumber = app.user.requireNumber;
            app.dataForm.trueNumber = app.user.trueNumber;
            app.dataForm.Magnification = app.user.Magnification;
            /**
             * 状态0：尚未提交
             * 状态1：已提交、市审核中
             * 状态2：市审核通过、省审核中
             * 状态3：省审核通过
             * 状态4：未通过审核
             */
            if (app.user.recordStatus !== 0) {
                app.hasSubmit = true;
                if (app.user.recordStatus === 1) {
                    app.hasSubmit = false;
                    app.$message({
                        showClose: true,
                        message: '报表已提交'
                    });
                }
            } else {
                app.$message({
                    showClose: true,
                    message: '尚未提交'
                });
            }
        });
    }
});