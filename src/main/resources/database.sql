-- 初始化数据库
drop database if exists softwareManagement;
create database softwareManagement;
ALTER DATABASE softwareManagement CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
use softwareManagement;

-- 所有关联：
-- 1、用户-角色：多对多
-- 2、角色-权限：多对多
-- 3、菜单-权限：多对一

-- 用户
create table sys_entity_user
(
  username              varchar(100),
  password              varchar(100),
  real_name             varchar(100) comment '真实姓名',
  nick_name             varchar(100) comment '昵称',
  head_img              varchar(100) comment '头像',
  phone_number          varchar(100) comment '手机号',
  email                 varchar(100) comment '邮箱地址',
  last_login_ip         varchar(100) comment '上次登陆ip',
  current_login_ip      varchar(100) comment '本次登陆ip',
  last_login_date       datetime comment '上次登陆时间',
  current_login_date    datetime comment '本次登陆时间',

  type                  varchar(100) comment '0 - 管理员，1 - 省，2 - 市，3 - 监测点',
  -- 以下字段可选，部分类型的用户并不需要
  province              varchar(100) comment '来自于哪个省，存储字典id',
  city                  varchar(100) comment '来自于哪个市，存储字典id',
  market_name           varchar(100) comment '人力资源市场名',
  contact_name          varchar(100) comment '联系人姓名',
  contact_phone         varchar(100) comment '联系人手机',
  contact_fax           varchar(100) comment '联系人传真',


  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

-- 角色
create table sys_entity_role
(
  name                  varchar(100),
  code                  varchar(100) comment '角色代码，作为角色的标识符',

  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

-- 功能
create table sys_entity_function
(
  name                  varchar(100),
  code                  varchar(100) comment '功能代码，作为功能的标识符',
  type                  int comment '0 - 功能分类，点击展开子功能;1 - 功能，点击进入功能页',
  parent_id             varchar(100) comment '功能所属的分类',
  url                   varchar(100) comment '如果是功能，则此项代表功能页地址，否则为空',
  index_                int comment '排序，功能栏上自上而下，从0开始递增(相当于数组中的序号)',
  enable                bool comment '功能是否启用',
  icon                  varchar(100) comment '图标',

  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

-- 字典
create table sys_entity_dict
(
  name_en               varchar(100) comment '英文',
  name_cn               varchar(100) comment '中文',
  type_id               varchar(100) comment '类型',
  parent_id             varchar(100) comment '父级id，本表',


  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

create table sys_entity_dict_type
(
  name_en               varchar(100),

  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

-- 关联：用户-角色
create table sys_map_user_role
(
  user_id               varchar(100),
  role_id               varchar(100),

  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);

-- 关联：角色-功能
create table sys_map_role_function
(
  role_id               varchar(100),
  function_id           varchar(100),

  id                    varchar(100) primary key,
  common_remarks        varchar(100) comment '备注',
  common_del_flag       varchar(100) comment '删除标记（0：正常；1：删除；2：审核）',
  common_create_user_id varchar(100) comment '创建者id',
  common_modify_user_id varchar(100) comment '最后修改者id',
  common_create_date    datetime comment '创建日期',
  common_modify_date    datetime comment '最后修改日期'
);
