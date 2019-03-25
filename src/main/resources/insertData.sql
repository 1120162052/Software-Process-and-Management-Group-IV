INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('字典类型管理', null, 'f1', 'functions/sys/dictTypeManager', 'fa fa-s15', 1, 1, 3, '00aa6a24647b4185a9a40a1c81803bf2',
        '', 'u1', 'u1', '2019-03-18 13:32:36', '2019-03-18 13:33:10', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('备案管理（省）', null, '34ff4062eeaa4678b83da2433cb4583a', 'functions/record/recordManagerProvince',
        'fa fa-address-book-o', 1, 1, 2, '11dc4e99983a42d98026dec62ba57d7b', '', 'u1', 'u1', '2019-03-17 19:09:25',
        '2019-03-18 15:11:56', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('报表管理（省/市）', null, '45c4aa9f2c7147408c3a656bd5113a4e', null, 'fa fa-list-alt', 1, 1, 2,
        '1e25d05faaaa4c0687dab0e83530f5c6', '市：可以对（当期，本市，审核中）调查任务进行审核
省/市：查看以调查任务为单位，可在弹窗中查看调查任务的详细信息（12张报表）', 'u1', 'u1', '2019-03-17 19:25:14', '2019-03-17 19:36:22', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('通知模块', 'notice:default', null, null, 'fa fa-bullhorn', 1, 0, 1, '22627a196a194237b9730ded546838f8', '', 'u1',
        'u1', '2019-03-17 19:01:15', '2019-03-17 19:02:49', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('备案信息（点）', null, '34ff4062eeaa4678b83da2433cb4583a', 'functions/record/fillRecord', 'fa fa-edit', 1, 1, 0,
        '23cb597143a34d87b568bda4e12800f7', '', 'u1', 'u1', '2019-03-17 19:05:37', '2019-03-18 15:11:08', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('报表填写（点）', null, '45c4aa9f2c7147408c3a656bd5113a4e', null, 'fa fa-tasks', 1, 1, 1,
        '259359ae23204b9aa10cb59e5bc1b719', '', 'u1', 'u1', '2019-03-17 19:13:19', '2019-03-17 19:36:44', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('备案模块', null, null, null, 'fa fa-address-card-o', 1, 0, 2, '34ff4062eeaa4678b83da2433cb4583a', '', 'u1', 'u1',
        '2019-03-17 19:04:56', '2019-03-17 19:05:32', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('发布调查（省）', null, '45c4aa9f2c7147408c3a656bd5113a4e', null, 'fa fa-hand-o-up', 1, 1, 0,
        '3b5a32fc4e1c40ffa13caf3127fe81ab', '', 'u1', 'u1', '2019-03-17 19:04:52', '2019-03-17 19:33:39', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('人力资源', null, null, null, 'fa fa-bank', 1, 0, 3, '45c4aa9f2c7147408c3a656bd5113a4e', '', 'u1', 'u1',
        '2019-03-17 19:03:34', '2019-03-17 19:04:43', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('发布通知（省/市）', 'notice:publish', '22627a196a194237b9730ded546838f8', null, 'fa fa-send-o', 1, 1, 0,
        '9ad585c8d1e540d797c1c5ee590b228c', '', 'u1', 'u1', '2019-03-17 18:58:40', '2019-03-17 19:13:03', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('接收通知', 'notice:receive', '22627a196a194237b9730ded546838f8', null, 'fa fa-envelope-open-o', 1, 1, 1,
        'af8328a4072b456485aeded442a1447f', '', 'u1', 'u1', '2019-03-17 19:01:00', '2019-03-17 19:03:09', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('备案管理（市）', null, '34ff4062eeaa4678b83da2433cb4583a', 'functions/record/recordManagerCity', 'fa fa-address-book',
        1, 1, 1, 'b0fdaeb877a345918efb52d364095c41', '', 'u1', 'u1', '2019-03-17 19:05:39', '2019-03-18 15:11:52', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('系统功能', 'sys:default', null, null, 'fa fa-cubes', 1, 0, 0, 'f1', null, null, 'u1', null, '2019-03-17 18:52:07',
        0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('用户管理', 'sys:user', 'f1', 'functions/sys/userManager', 'fa fa-user-plus', 1, 1, 0, 'f2', null, null, 'u1', null,
        '2019-03-17 18:51:47', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('角色管理', 'sys:role', 'f1', 'functions/sys/roleManager', 'fa fa-users', 1, 1, 1, 'f3', null, null, 'u1', null,
        '2019-03-17 18:51:33', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('功能管理', 'sys:function', 'f1', 'functions/sys/functionManager', 'fa fa-cogs', 1, 1, 2, 'f4', null, null, 'u1',
        null, '2019-03-17 18:52:20', 0);
INSERT INTO softwaremanagement.sys_entity_function (name, code, parent_id, url, icon, enable, type, `index`, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('字典管理', 'sys:dict', 'f1', 'functions/sys/dictManager', 'fa fa-book', 1, 1, 4,
        'ff38d6dc4bef45f292ab29780460a5af', '', 'u1', 'u1', '2019-03-17 18:49:33', '2019-03-17 18:50:54', 0);
INSERT INTO softwaremanagement.sys_entity_role (name, code, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('管理员', 'admin', 'r1', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_role (name, code, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('省', 'province', 'r2', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_role (name, code, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('市', 'city', 'r3', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_role (name, code, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('监测点', 'point', 'r4', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin3', 'admin', '0851c0fd6d9243abbb9cd1bf05605c82', '', 'u1', 'u1', '2019-03-18 09:56:37',
        '2019-03-18 09:56:37', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin6', 'admin', '41abb36058e04e58a303fd618e0a97e3', '', 'u1', 'u1', '2019-03-18 09:56:57',
        '2019-03-18 09:56:57', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin7', 'admin', '455ddb0efade4d3593c939c03770fbb3', '', 'u1', 'u1', '2019-03-18 09:57:06',
        '2019-03-18 09:57:06', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin4', 'admin', '5aac849636754f90b007b9740564dd57', '', 'u1', 'u1', '2019-03-18 09:56:43',
        '2019-03-18 09:56:43', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin2', 'admin', 'bd6b4b23303642b582876dea531eba52', '', 'u1', 'u1', '2019-03-18 09:56:30',
        '2019-03-18 09:56:30', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin5', 'admin', 'bec6cf92d7dc4670974efc87f949d166', '', 'u1', 'u1', '2019-03-18 09:56:50',
        '2019-03-18 09:56:50', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin8', 'admin', 'c8aa7c842ecb4ef88889b48cb52366a4', '', 'u1', 'u1', '2019-03-18 09:57:13',
        '2019-03-18 09:57:13', 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('admin', 'admin', 'u1', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('省用户1', '123456', 'u2', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('市用户1', '123456', 'u3', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_entity_user (username, password, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('监测点用户1', '123456', 'u4', null, null, null, '2019-03-17 18:48:24', null, 0);
INSERT INTO softwaremanagement.sys_map_user_role (user_id, role_id, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('u1', 'r1', 'ur1', null, null, null, null, null, 0);
INSERT INTO softwaremanagement.sys_map_user_role (user_id, role_id, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('u2', 'r2', 'ur2', null, null, null, null, null, 0);
INSERT INTO softwaremanagement.sys_map_user_role (user_id, role_id, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('u3', 'r3', 'ur3', null, null, null, null, null, 0);
INSERT INTO softwaremanagement.sys_map_user_role (user_id, role_id, id, remarks, create_user_id, modify_user_id, create_date, modify_date, del_flag)
VALUES ('u4', 'r4', 'ur4', null, null, null, null, null, 0);