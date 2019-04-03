let app = new Vue({
    el:'#app',
    data: {
        user: '',
        urls: {
            update: "/api/sys/Dict/update",
        },
        fullScreenLoading: false,
        hasSave: false,
        hasSubmit: false,
        page: 1,
        showingTableName: '',
        dataForm: {
            form1: {
                name: '供求总体人数',
                content: {
                    requireNumber: '',
                    trueNumber: '',
                    magnification: ''
                }
            },
            form2: {
                name: '按产业分组的需求人数',
                content: {
                    paymentType:'',
                    orderID:'',
                    paymentType:''
                }
            },
            form3: {
                name: '按行业分组的需求人数',
                content: {
                    farm:'',
                    mining:'',
                    create:'',
                    electric:'',
                    structure:'',
                    traffic:'',
                    information:'',
                    wholesale:'',
                    room:'',
                    financial:'',
                    estate:'',
                    lease:'',
                    research:'',
                    water:'',
                    resident:'',
                    education:'',
                    health:'',
                    culture:'',
                    management:'',
                    international:''
                }
            },
            form4: {
                name: '按用人单位性质分组的需求人数',
                content: {
                    state:'',
                    collective:'',
                    cooperation:'',
                    joint:'',
                    limited:'',
                    share:'',
                    private:'',
                    other:'',
                    hk:'',
                    foreign:'',
                    self:'',
                }
            },
            form5: {
                name: '按职业分组的供求人数',
                content: {
                    perChaDemand:'',
                    perChaHunt:'',
                    proSkillDemand:'',
                    proSkillHunt:'',
                    staffDemand:'',
                    staffHunt:'',
                    busDemand:'',
                    busHunt:'',
                    productDemand:'',
                    productHunt:'',
                    tranDemand:'',
                    tranHunt:'',
                    otherHunt:''
                }
            },
            form6: {
                name: '需求小于求职缺口最大的前十个职业',
                content: {
                    smallDemandType:'',
                    careerID:'',
                    smallDemandHunt:'',
                    smallDemandHunt:''
                }
            },
            form7: {
                name: '需求大于求职缺口最大的前十个职业',
                content: {
                    bigDemandType:'',
                    careerID2:'',
                    bigDemandHunt:'',
                    bigDemandHunt:''
                }
            },
            form8: {
                name: '按求职人员类别分组的求职人数',
                content: {
                    growHuntNum:'',
                    empToUnempHuntNum:'',
                    otherHuntNum:'',
                    practHuntNum:'',
                    laidOffHuntNum:'',
                    retireHuntNum:'',
                    instructorHuntNum:'',
                    cityHuntNum:'',
                    outCityHuntNum:''
                }
            },
            form9: {
                name: '按性别分组的供求人数',
                content: {
                    maleReqNum:'',
                    femaleReqNum:'',
                    noRequestReqNum:'',
                    maleHuntNum:'',
                    femaleHuntNum:'',
                    noRequestHuntNum:''
                }
            },
            form10: {
                name: '按年龄分组的供求人数',
                content: {
                    Range1ReqNum:'',
                    Range2ReqNum:'',
                    Range3ReqNum:'',
                    Range4ReqNum:'',
                    noRequestReqNum:'',
                    Range1HuntNum:'',
                    Range2HuntNum:'',
                    Range3HuntNum:'',
                    Range4HuntNum:'',
                    noRequestHuntNum:''
                }
            },
            form11: {
                name: '按文化程度分组的供求人数',
                content: {
                    juniorHighSchoolReqNum:'',
                    vocReqNum:'',
                    tecReqNum:'',
                    secReqNum:'',
                    collegeReqNum:'',
                    universityReqNum:'',
                    masterReqNum:'',
                    noRequestReqNum:'',
                    juniorHighSchoolHuntNum:'',
                    vocHuntNum:'',
                    tecHuntNum:'',
                    secHuntNum:'',
                    collegeHuntNum:'',
                    universityHuntNum:'',
                    masterHuntNum:'',
                    noRequestHuntNum:''
                }
            },
            form12: {
                name: '按技术等级分组的供求人数',
                content: {
                    careerQualFiveReqNum:'',
                    careerQualFourReqNum:'',
                    careerQualThreeReqNum:'',
                    careerQualTwoReqNum:'',
                    careerQualOneReqNum:'',
                    priTechCareerReqNum:'',
                    medTechCareerReqNum:'',
                    advTechCareerReqNum:'',
                    noTechCareerReqNum:'',
                    noRequestReqNum:'',
                    careerQualFiveHuntNum:'',
                    careerQualFourHuntNum:'',
                    careerQualThreeHuntNum:'',
                    careerQualTwoHuntNum:'',
                    careerQualOneHuntNum:'',
                    priTechCareerHuntNum:'',
                    medTechCareerHuntNum:'',
                    advTechCareerHuntNum:'',
                    noTechCareerHuntNum:'',
                    noRequestHuntNum:''
                }
            },
            // requireNumber:'',
            // trueNumber:'',
            // magnification:'',
            // paymentID:'',
            // orderID:'',
            // paymentType:'',
            //
            // Farm:'',
            // Mining:'',
            // Create:'',
            // Electric:'',
            // Structure:'',
            // traffic:'',
            // information:'',
            // wholesale:'',
            // room:'',
            // financial:'',
            // estate:'',
            // lease:'',
            // research:'',
            // water:'',
            // resident:'',
            // education:'',
            // health:'',
            // culture:'',
            // management:'',
            // international:'',
            //
            // state:'',
            // collective:'',
            // cooperation:'',
            // joint:'',
            // limited:'',
            // share:'',
            // private:'',
            // other:'',
            // hk:'',
            // foreign:'',
            // self:'',
            //
            // Per_Cha_demand:'',
            // Per_Cha_hunt:'',
            // Pro_Skill_demand:'',
            // Pro_Skill_hunt:'',
            // Staff_demand:'',
            // Staff_hunt:'',
            // Bus_demand:'',
            // Bus_hunt:'',
            // Product_demand:'',
            // Product_hunt:'',
            // Tran_demand:'',
            // Tran_hunt:'',
            // Other_hunt:'',
            //
            // Smalldemand_type:'',
            // Career_ID:'',
            // Smalldemand_demand:'',
            // Smalldemand_hunt:'',
            //
            // Bigdemand_type:'',
            // Career_ID2:'',
            // Bigdemand_demand:'',
            // Bigdemand_hunt:'',
            //
            // Grow_Hunt_num:'',
            // EmpToUnemp_Hunt_num:'',
            // Other_Hunt_num:'',
            // Pract_Hunt_num:'',
            // Laid_off_Hunt_num:'',
            // Retiree_Hunt_num:'',
            // Instructor_Hunt_num:'',
            // City_Hunt_num:'',
            // OutCity_Hunt_num:'',
            //
            // Male_req_num:'',
            // Female_req_nmu:'',
            // No_request_req_num:'',
            // Male_hunt_num:'',
            // Female_hunt_nmu:'',
            // No_request_hunt_num:'',
            //
            // Range_1_req_num:'',
            // Range_2_req_num:'',
            // Range_3_req_num:'',
            // Range_4_req_num:'',
            // No_request_req_num:'',
            // Range_1_hunt_num:'',
            // Range_2_hunt_num:'',
            // Range_3_hunt_num:'',
            // Range_4_hunt_num:'',
            // No_request_hunt_num:'',
            //
            // junior_high_school_req_num:'',
            // Voc_req_num:'',
            // Tec_req_num:'',
            // Sec_req_num:'',
            // College_req_num:'',
            // University_req_num:'',
            // Master_req_num:'',
            // No_request_req_num:'',
            // junior_high_school_hunt_num:'',
            // Voc_hunt_num:'',
            // Tec_hunt_num:'',
            // Sec_hunt_num:'',
            // College_hunt_num:'',
            // University_hunt_num:'',
            // Master_hunt_num:'',
            // No_request_hunt_nmu:'',
            //
            // Career_qual_five_req_num:'',
            // Career_qual_four_req_num:'',
            // Career_qual_three_req_num:'',
            // Career_qual_two_req_num:'',
            // Career_qual_one_req_num:'',
            // Pri_tech_career_req_num:'',
            // Med_tech_career_req_num:'',
            // Adv_tech_career_req_num:'',
            // No_tech_career_req_num:'',
            // No_request_req_num:'',
            // Career_qual_five_hunt_num:'',
            // Career_qual_four_hunt_num:'',
            // Career_qual_three_hunt_num:'',
            // Career_qual_two_hunt_num:'',
            // Career_qual_one_hunt_num:'',
            // Pri_tech_career_hunt_num:'',
            // Med_tech_career_hunt_num:'',
            // Adv_tech_career_hunt_num:'',
            // No_tech_career_hunt_num:'',
            // No_request_hunt_num:''
        },
    },
    methods: {
        submitForm(formName, operateType) {
            let app = this;
            this.$refs[formName].validate((valid) => {
                if(valid) {
                    let data = app.user;
                    if(operateType === 'onlySave') {
                        data.recordStatus = 0;
                    } else if(operateType === 'saveAndSubmit') {
                        data.recordStatus = 1;
                    }
                    data.requireNumber = app.dataForm.requireNumber;
                    data.trueNumber = app.dataForm.trueNumber;
                    data.Magnification = app.dataForm.Magnification;
                    app.fullScreenLoading = true;
                    ajaxPostJSON(app.urls.update, data, function (d) {
                        app.fullScreenLoading = false;
                        if (d.code === 'success') {
                            if(operateType === 'saveAndSubmit') {
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
            add(){
              app.page++;
            },
            decrease(){
              app.page--;
            }
    },
    mounted: function () {
        let app = this;
        ajaxPostJSON(app.urls.getCompleteUserInfo, parent.app.user, function(d){
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
                if(app.user.recordStatus === 1) {
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