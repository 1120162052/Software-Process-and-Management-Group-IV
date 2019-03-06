-- 初始化数据库
drop database if exists ssm;
create database ssm;
ALTER DATABASE ssm CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
use ssm;


-- 所有关联：
-- 1、用户-角色：多对多
-- 2、角色-权限：多对多
-- 3、菜单-权限：多对一


-- 用户
create table sys_entity_user(
  username varchar(100),
  password varchar(100),

  id varchar(100) primary key,
  common_status int default 1         comment '1 - 有效，0 - 无效',
  common_create_user_id varchar(100)  comment '创建者id',
  common_create_date datetime         comment '创建日期',
  common_modify_user_id varchar(100)  comment '最后修改者id',
  common_modify_date datetime         comment '最后修改日期'
);

-- 角色
create table sys_entity_role(
  name varchar(100),
  code varchar(100) comment '角色代码，作为角色的标识符',

  id varchar(100) primary key,
  common_status int default 1         comment '1 - 有效，0 - 无效',
  common_create_user_id varchar(100)  comment '创建者id',
  common_create_date datetime         comment '创建日期',
  common_modify_user_id varchar(100)  comment '最后修改者id',
  common_modify_date datetime         comment '最后修改日期'
);

-- 权限（实际上就是功能）
create table sys_entity_permission(
  name varchar(100),
  code varchar(100)       comment '功能代码，作为功能的标识符',
  type int                comment '0 - 功能分类，点击展开子功能;1 - 功能，点击进入功能页',
  parent_id varchar(100)  comment '功能所属的分类',
  url varchar(100)        comment '如果是功能，则此项代表功能页地址，否则为空',
  index_ int              comment '排序，功能栏上自上而下，从0开始递增(相当于数组中的序号)',

  id varchar(100) primary key,
  common_status int default 1         comment '1 - 有效，0 - 无效',
  common_create_user_id varchar(100)  comment '创建者id',
  common_create_date datetime         comment '创建日期',
  common_modify_user_id varchar(100)  comment '最后修改者id',
  common_modify_date datetime         comment '最后修改日期'
);

-- 关联：用户-角色
create table sys_map_user_role(
  user_id varchar(100),
  role_id varchar(100),

  id varchar(100) primary key,
  common_status int default 1         comment '1 - 有效，0 - 无效',
  common_create_user_id varchar(100)  comment '创建者id',
  common_create_date datetime         comment '创建日期',
  common_modify_user_id varchar(100)  comment '最后修改者id',
  common_modify_date datetime         comment '最后修改日期'
);

-- 关联：角色-权限
create table sys_map_role_permission(
  role_id varchar(100),
  permission_id varchar(100),

  id varchar(100) primary key,
  common_status int default 1         comment '1 - 有效，0 - 无效',
  common_create_user_id varchar(100)  comment '创建者id',
  common_create_date datetime         comment '创建日期',
  common_modify_user_id varchar(100)  comment '最后修改者id',
  common_modify_date datetime         comment '最后修改日期'
);

-- 用户
insert into sys_entity_user (id, username, password) values ('u1', 'admin', 'admin');
insert into sys_entity_user (id, username, password) values ('u2', 'zhangsan', '123456')

-- 角色
insert into sys_entity_role (id, name, code) values ('r1', '管理员', 'admin');
insert into sys_entity_role (id, name, code) values ('r2', '普通用户', 'normalUser')

-- 权限
--    1.分类
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p1', '系统功能', 'sys:default', 0, null, null, 0);
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p4', '自定义功能', 'custom:default', 0, null, null, 1);
--    2.系统功能
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p2', '用户管理', 'sys:user', 1, 'p1', 'functions/sys/userManager', 0);
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p3', '角色管理', 'sys:role', 1, 'p1', 'functions/sys/roleManager', 1);
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p6', '功能管理', 'sys:function', 1, 'p1', 'function/sys/functionManager', 2);
--    3.自定义功能
insert into sys_entity_permission (id, name, code, type, parent_id, url, index_) values ('p5', '测试功能', 'custom:testFunction', 1, 'p4', 'functions/custom/testFunction', 0);

-- 关联：用户-角色
insert into sys_map_user_role (id, user_id, role_id) values ('ur1', 'u1', 'r1');
insert into sys_map_user_role (id, user_id, role_id) values ('ur2', 'u2', 'r2');

-- 关联：角色-权限 （管理员不需要和权限关联）
insert into sys_map_role_permission (id, role_id, permission_id) values ('rp1', 'r2', 'p4'); -- 普通用户 - 自定义功能
insert into sys_map_role_permission (id, role_id, permission_id) values ('rp2', 'r2', 'p5'); -- 普通用户 - 测试功能
