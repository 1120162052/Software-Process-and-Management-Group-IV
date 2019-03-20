-- 初始化数据库
drop database if exists softwareManagement;
create database softwareManagement;
ALTER DATABASE softwareManagement CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
use softwareManagement;

-- 1. 系统表
-- 1.1 用户表
create table sys_entity_user
(
  username       varchar(100) comment '用户名',
  password       varchar(100) comment '密码',

  user_type      int comment '用户类型: 0 - 管理员;1 - 省;2 - 市;3 - 监测点',
  status         int comment '0 - 未审核，1 - 审核中，2 - 退回，3 - 通过',
  user_id        varchar(100) comment '用户id',
  province_id    varchar(100) comment '所属省，指向字典表id',
  city_id        varchar(100) comment '所属市，指向字典表id',
  industry_id    varchar(100) comment '行业，指向字典表id',
  market_name    varchar(100) comment '人力资源市场用户名',
  market_code    varchar(100) comment '人力资源市场用户编码',
  contact_name   varchar(100) comment '联系人姓名',
  contact_mobile varchar(100) comment '联系人手机',
  contact_phone  varchar(100) comment '联系电话',
  fax            varchar(100) comment '传真',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.2 角色表
create table sys_entity_role
(
  name           varchar(100) comment '角色名',
  code           varchar(100) comment '角色代码',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.3 功能
create table sys_entity_function
(
  name           varchar(100) comment '功能或分类名称',
  code           varchar(100) comment '功能或分类代码',
  parent_id      varchar(100) comment '功能所属的分类',
  url            varchar(100) comment '如果是功能，则此项代表功能页地址，否则为空',
  icon           varchar(100) comment '图标',
  enable         bool comment '功能是否启用',
  type           int comment '0 - 功能分类，点击展开子功能;1 - 功能，点击进入功能页',
  `index`        int comment '排序，功能栏上自上而下，从0开始递增(相当于数组中的序号)',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.4 用户-角色关联表
create table sys_map_user_role
(
  user_id        varchar(100),
  role_id        varchar(100),

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.5 角色-功能关联表
create table sys_map_role_function
(
  role_id        varchar(100),
  function_id    varchar(100),

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.6 字典表
create table sys_entity_dict
(
  type           varchar(100) comment '字典类型，指向字典类型表id',
  name_cn        varchar(100) comment '字典中文名',
  name_en        varchar(100) comment '字典英文名',
  parent_id      varchar(100) comment '父字典项id，指向本表',
  sort           int comment '用户可手动设置sort值进行排序',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.6 字典类型表
create table sys_entity_dict_type
(
  name_cn        varchar(100) comment '字典类型中文名',
  name_en        varchar(100) comment '字典类型英文名',
  parent_id      varchar(100) comment '父类型id，指向本表',
  sort           int comment '用户可手动设置sort值进行排序',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.7 发布通知表
create table sys_entity_notice_publish
(
  title          varchar(100) comment '通知标题',
  publisher_id   varchar(100) comment '发布用户id',
  publish_date   datetime comment '发布日期',
  content        text comment '通知内容',
  status         int comment '状态: 0-草稿，1-发布',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 1.8 接收通知表
create table sys_entity_notice_receive
(
  receiver_id    varchar(100) comment '接收用户id',
  notice_id      varchar(100) comment '指向发布通知表id',
  status         int comment '0-未读，1-已读',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 2. 人力资源市场数据采集报表
-- 2.1 调查表（省用户）
create table hr_entity_research
(
  title          varchar(100) comment '调查标题',
  publisher_id   varchar(100) comment '发起人id（省用户）',
  publish_date   datetime comment '发起时间',
  start_date     datetime comment '调查开始日期',
  end_date       datetime comment '调查截止日期',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 2.1 调查任务表（监测点用户）
create table hr_entity_research_task
(
  executor_id    varchar(100) comment '执行人id（监测点用户）',
  research_id    varchar(100) comment '调查id',
  status         int comment '0 - 未审核，1 - 审核中，2 - 退回，3 - 通过',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);

-- 2.2 十二张报表
-- 公有字段
create table hr_entity_form
(
  task_id        varchar(100) comment '所属任务id',

  id             varchar(100) primary key,
  remarks        varchar(200) comment '备注',
  create_user_id varchar(100) comment '创建者id',
  modify_user_id varchar(100) comment '最后修改者id',
  create_date    datetime comment '创建日期',
  modify_date    datetime comment '最后修改日期',
  del_flag       bool default false comment '是否被删除'
);