-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-02 08:34:49
-- 服务器版本： 5.6.17-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- 表的结构 `cms_admin`
--

CREATE TABLE IF NOT EXISTS `cms_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` char(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `realname` char(20) NOT NULL COMMENT '别称',
  `phone` char(20) NOT NULL COMMENT '电话',
  `email` char(20) NOT NULL COMMENT '邮箱',
  `qq` char(20) NOT NULL COMMENT 'QQ号',
  `last_ip` varchar(15) NOT NULL COMMENT '最后登录ip',
  `last_time` int(11) NOT NULL COMMENT '最后登录时间',
  `login_count` int(11) NOT NULL COMMENT '登录次数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0=删除；1=正常；2=黑名单）',
  `role` smallint(5) unsigned NOT NULL COMMENT '账号角色（0:超级管理员，其余按照角色表）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cms_admin`
--

INSERT INTO `cms_admin` (`id`, `username`, `password`, `realname`, `phone`, `email`, `qq`, `last_ip`, `last_time`, `login_count`, `status`, `role`) VALUES
(1, 'admin', 'c56d0e9a7ccec67b4ea131655038d604', 'admin', '18688888888', '123456@qq.com', '123456', '127.0.0.1', 1468897128, 42, 1, 1),
(2, 'test123', 'c56d0e9a7ccec67b4ea131655038d604', '管理员', '18688888888', '123456@qq.com', '123456', '127.0.0.1', 1467687072, 47, 1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `cms_admin_menu_rule`
--

CREATE TABLE IF NOT EXISTS `cms_admin_menu_rule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL COMMENT '父 id',
  `module` varchar(20) NOT NULL COMMENT '模块',
  `controller` varchar(20) NOT NULL COMMENT '控制器',
  `action` varchar(20) NOT NULL COMMENT '操作',
  `type` tinyint(4) unsigned NOT NULL COMMENT '类型（0=菜单；1=菜单+验证）',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态（0=隐藏；1=显示）',
  `menu_name` varchar(255) NOT NULL COMMENT '名称',
  `rule_name` varchar(255) NOT NULL COMMENT '规则名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `list_order` int(11) unsigned NOT NULL COMMENT '排序',
  `logo` varchar(50) NOT NULL COMMENT '图标',
  `level` tinyint(3) unsigned NOT NULL COMMENT '菜单等级',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单权限表' AUTO_INCREMENT=46 ;

--
-- 转存表中的数据 `cms_admin_menu_rule`
--

INSERT INTO `cms_admin_menu_rule` (`id`, `parent_id`, `module`, `controller`, `action`, `type`, `status`, `menu_name`, `rule_name`, `remark`, `list_order`, `logo`, `level`) VALUES
(1, 0, 'Admin', 'Menu', 'index', 1, 1, '菜单管理', '', '', 30000000, 'list', 1),
(12, 11, 'Admin', 'Menu', 'list', 0, 1, '菜单管理', '', '', 30101000, 'angle-double-right', 3),
(11, 1, 'Admin', 'Menu', 'admin', 1, 1, '后台菜单', '', '', 30100000, 'caret-right', 2),
(13, 12, 'Admin', 'Menu', 'add', 0, 0, '菜单添加', '', '', 30101010, 'angle-right', 4),
(14, 13, 'Admin', 'Menu', 'doAdd', 0, 0, '菜单添加--操作', '', '', 30101011, 'angle-right', 5),
(15, 12, 'Admin', 'Menu', 'save', 0, 0, '菜单编辑', '', '', 30101020, 'angle-right', 4),
(16, 15, 'Admin', 'Menu', 'doSave', 0, 0, '菜单编辑--操作', '', '', 30101021, 'angle-right', 5),
(17, 12, 'Admin', 'Menu', 'show', 0, 0, '菜单详情', '', '', 30101030, 'angle-right', 4),
(18, 12, 'Admin', 'Menu', 'del', 0, 0, '菜单删除', '', '', 30101040, 'angle-right', 4),
(23, 21, 'Admin', 'Role', 'index', 1, 1, '管理组', '', '', 20100000, 'caret-right', 2),
(24, 23, 'Admin', 'Role', 'list', 0, 1, '角色管理', '', '', 20101000, 'angle-double-right', 3),
(22, 0, 'Admin', 'Tool', 'index', 1, 1, '扩展工具', '', '', 40000000, 'cloud', 1),
(20, 0, 'Admin', 'Setting', 'index', 1, 1, '设置', '', '', 10000000, 'cogs', 1),
(21, 0, 'Admin', 'User', 'index', 1, 1, '用户管理', '', '', 20000000, 'group', 1),
(25, 24, 'Admin', 'Role', 'add', 0, 0, '角色添加', '', '', 20101010, 'angle-right', 4),
(26, 24, 'Admin', 'Role', 'save', 0, 0, '角色编辑', '', '', 20101020, 'angle-right', 4),
(27, 25, 'Admin', 'Role', 'doAdd', 0, 0, '角色添加--操作', '', '', 20101011, 'angle-right', 5),
(28, 26, 'Admin', 'Role', 'doSave', 0, 0, '角色编辑--操作', '', '', 20101021, 'angle-right', 5),
(29, 24, 'Admin', 'Role', 'setPower', 0, 0, '权限设置', '', '', 20101030, 'angle-right', 4),
(30, 24, 'Admin', 'Role', 'show', 0, 0, '角色详情', '', '', 20101040, 'angle-right', 4),
(31, 24, 'Admin', 'Role', 'del', 0, 0, '角色删除', '', '', 20101050, 'angle-right', 4),
(32, 29, 'Admin', 'Role', 'doSetPower', 0, 0, '权限设置--操作', '', '', 20101031, 'angle-right', 5),
(33, 23, 'Admin', 'User', 'list', 0, 1, '管理员', '', '', 20102000, 'angle-double-right', 3),
(34, 33, 'Admin', 'User', 'add', 0, 0, '管理员添加', '', '', 20102010, 'angle-right', 4),
(35, 34, 'Admin', 'User', 'doAdd', 0, 0, '管理员添加--操作', '', '', 20102011, 'angle-right', 5),
(36, 33, 'Admin', 'User', 'save', 0, 0, '管理员编辑', '', '', 20102020, 'angle-right', 4),
(37, 36, 'Admin', 'User', 'doSave', 0, 0, '管理员编辑--操作', '', '', 20102021, 'angle-right', 5),
(38, 33, 'Admin', 'User', 'setBlack', 0, 0, '管理员拉黑', '', '', 20102030, 'angle-right', 4),
(39, 33, 'Admin', 'User', 'setEnable', 0, 0, '管理员启用', '', '', 20102040, 'angle-right', 4),
(40, 33, 'Admin', 'User', 'del', 0, 0, '管理员删除', '', '', 20102050, 'angle-right', 4),
(41, 20, 'Admin', 'User', 'message', 1, 1, '个人信息', '', '', 10100000, 'caret-right', 2),
(42, 41, 'Admin', 'User', 'info', 0, 1, '信息修改', '', '', 10101000, 'angle-double-right', 3),
(43, 42, 'Admin', 'User', 'setInfo', 0, 0, '信息修改--操作', '', '', 10101010, 'angle-right', 4),
(44, 41, 'Admin', 'User', 'pass', 0, 1, '密码修改', '', '', 10102000, 'angle-double-right', 3),
(45, 44, 'Admin', 'User', 'setPass', 0, 0, '密码修改--操作', '', '', 10102010, 'angle-right', 4);

-- --------------------------------------------------------

--
-- 表的结构 `cms_admin_role`
--

CREATE TABLE IF NOT EXISTS `cms_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `power` text NOT NULL COMMENT '权限拼接',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态（0=禁用；1=开启）',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `cms_admin_role`
--

INSERT INTO `cms_admin_role` (`id`, `name`, `power`, `status`, `remark`, `create_time`, `update_time`) VALUES
(1, '超级管理员', '0', 1, '拥有网站最高管理员权限！', 1329633709, 1329633709),
(4, '新的测试', 'Admin_Setting_index,Admin_User_message,Admin_User_info,Admin_User_setInfo,Admin_User_pass,Admin_User_setPass', 1, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cms_config`
--

CREATE TABLE IF NOT EXISTS `cms_config` (
  `name` varchar(50) NOT NULL,
  `type` varchar(150) NOT NULL COMMENT '多个默认值用|分隔',
  `value` text NOT NULL,
  `info` varchar(20) NOT NULL,
  `desc` text NOT NULL,
  `tab_id` varchar(20) NOT NULL DEFAULT '0' COMMENT '小分组ID',
  `tab_name` varchar(20) NOT NULL COMMENT '小分组名称',
  `gid` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置表';

--
-- 转存表中的数据 `cms_config`
--

INSERT INTO `cms_config` (`name`, `type`, `value`, `info`, `desc`, `tab_id`, `tab_name`, `gid`, `sort`, `status`) VALUES
('site_name', 'type=text&size=80&validate=required:true', '吾爱源码', '网站名称', '网站的名称', '0', '', 1, 12, 1),
('site_url', 'type=text&size=80&validate=required:true,url:true', 'http://127.0.0.1/', '网站网址', '请填写网站的网址，包含（http://域名）', '0', '', 1, 11, 1),
('site_logo', 'type=image&validate=required:true,url:true', 'http://127.0.0.1/static/logo.png', '网站LOGO', '请填写网站LOGO的网址，包含（http://域名）！默认模板推荐 190宽*60高', '0', '', 1, 10, 1),
('site_qq', 'type=text&validate=qq:true', '123456', '联系QQ', '前台涉及到需要显示QQ的地方，将显示此值！', '0', '', 1, 0, 1),
('site_email', 'type=text&validate=email:true', '123456@qq.com', '联系邮箱', '前台涉及到需要显示邮箱的地方，将显示此值！', '0', '', 1, 0, 1),
('site_icp', 'type=text', '吾爱源码', 'ICP备案号', '可不填写。放置于大陆的服务器，需要网站备案。', '0', '', 1, 0, 1),
('seo_title', 'type=text&size=80&validate=required:true', '吾爱源码', 'SEO标题', '一般不超过80个字符！', '0', '', 1, 0, 1),
('seo_keywords', 'type=text&size=80', '吾爱源码', 'SEO关键词', '一般不超过100个字符！', '0', '', 1, 0, 1),
('seo_description', 'type=textarea&rows=4&cols=93', '吾爱源码', 'SEO描述', '一般不超过200个字符！', '0', '', 1, 0, 1),
('site_footer', 'type=textarea&rows=6&cols=93', '吾爱源码', '网站底部隐藏信息', '可填写统计、客服等HTML代码，代码前台隐藏不可见！！', '0', '', 1, 0, 1),
('user_first_spread_rate', 'type=text&size=10&validate=required:true,number:true,range:[0,100]', '0', '子用户分享佣金比例', '子用户（分享用户再次分享的用户）分享链接购买团购商品获得佣金比例（百分比 0-100）微信中分享有效！如果此值+用户分享的佣金值和大于100，则取100减去用户分享的佣金值', 'user_spread', '推广佣金', 2, 0, 1),
('merchant_verify', 'type=radio&value=1:须审核|0:不审核', '1', '商户注册审核', '商户是否须审核后才能登录', 'base', '基础配置', 6, 0, 1),
('store_verify', 'type=radio&value=1:须审核|0:不审核', '1', '添加店铺审核', '商户添加店铺是否须审核后才能操作', 'base', '基础配置', 6, 0, 1),
('meal_pic_size', 'type=text&size=10&validate=required:true', '1', '商品图片尺寸（M）', '商家添加商品图片时最大的文件尺寸，单位为M，可以为小数！请谨慎修改', 'base', '基础配置', 5, 0, 1),
('meal_pic_width', 'type=text&size=10&validate=required:true', '720,640', '商品图片截取宽度', '与图片高度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', 'base', '基础配置', 5, 0, 1),
('meal_pic_height', 'type=text&size=10&validate=required:true', '400,356', '商品图片截取高度', '与图片宽度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', 'base', '基础配置', 5, 0, 1),
('store_open_meal', 'type=radio&value=1:开启|0:关闭', '1', '店铺自行开通订餐功能', '商户能自行配置店铺是否有订餐功能', 'base', '基础配置', 5, 1, 1),
('store_open_group', 'type=radio&value=1:开启|0:关闭', '1', '店铺自行开通团购功能', '商户能自行配置店铺是否有团购功能', '0', '', 4, 0, 1),
('store_open_payone', 'type=radio&value=1:允许|0:不允许', '1', '店铺开启货到付款', '店铺是否能开启货到付款的功能', 'base', '基础配置', 5, 2, 1),
('store_open_paythree', 'type=radio&value=1:允许|0:不允许', '1', '店铺开启在线支付', '店铺是否能开启在线支付的功能', 'base', '基础配置', 5, 2, 1),
('group_pic_size', 'type=text&size=10&validate=required:true', '1', '商品图片尺寸（M）', '商家添加商品图片时最大的文件尺寸，单位为M，可以为小数！请谨慎修改', '0', '', 4, 0, 1),
('group_pic_width', 'type=text&size=10&validate=required:true', '640,460', '商品图片截取宽度', '与图片高度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 4, 0, 1),
('group_pic_height', 'type=text&size=10&validate=required:true', '388,279', '商品图片截取高度', '与图片宽度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 4, 0, 1),
('group_verify', 'type=radio&value=1:须审核|0:不审核', '1', '添加团购须审核', '商家添加团购信息是否需要管理员后台审核', '0', '', 4, 1, 1),
('wechat_qrcode', 'type=image&validate=required:true,url:true', 'http://127.0.0.1/upload/config/000/000/001/56710f7e54569.jpg', '公众号二维码', '您的公众号二维码', '0', '', 8, 0, 1),
('now_city', 'type=text&size=10', '105', '默认城市编号', '当前网站默认服务的城市编号，在城市区域中获取', '0', '默认城市编号', 1, 0, 1),
('group_page_row', 'type=text&size=10&validate=required:true', '20', '团购列表每页数量', '团购列表每页显示的数量', '0', '', 4, 4, 1),
('group_page_val', 'type=text&size=10&validate=required:true,english:true', 'page', '团购列表页面分页参数', '团购列表页面分页的GET参数，通常为page！只允许英文', '0', '', 4, 3, 1),
('wechat_name', 'type=text&size=80&validate=required:true', 'x', '公众号名称', '公众号的名称', '0', '', 8, 0, 1),
('wechat_sourceid', 'type=text&size=80&validate=required:true', 'x', '公众号原始id', '公众号原始id', '0', '', 8, 0, 1),
('wechat_id', 'type=text&size=80&validate=required:true', 'x', '微信号', '微信号', '0', '', 8, 0, 1),
('wechat_appid', 'type=text&size=80&validate=required:true', 'x', 'AppID', 'AppID', '0', '', 8, 0, 1),
('wechat_appsecret', 'type=text&size=80&validate=required:true', 'x', 'AppSecret', 'AppSecret', '0', '', 8, 0, 1),
('wechat_token', 'type=text&size=80&validate=required:true', 'x', '微信验证TOKEN', '微信验证TOKEN', '0', '', 8, 0, 1),
('pay_tenpay_open', 'type=radio&value=1:开启|0:关闭', '0', '开启', '', 'tenpay', '财付通支付', 7, 0, 1),
('pay_tenpay_partnerid', 'type=text&size=80', '', '商户号', '', 'tenpay', '财付通支付', 7, 0, 1),
('pay_tenpay_partnerkey', 'type=text&size=80', '', '密钥', '', 'tenpay', '财付通支付', 7, 0, 1),
('pay_yeepay_open', 'type=radio&value=1:开启|0:关闭', '0', '开启', '', 'yeepay', '银行卡支付（易宝支付）', 7, 0, 1),
('pay_yeepay_merchantaccount', 'type=text&size=80', '', '商户编号', '', 'yeepay', '银行卡支付（易宝支付）', 7, 0, 1),
('pay_yeepay_merchantprivatekey', 'type=text&size=80', '', '商户私钥', '', 'yeepay', '银行卡支付（易宝支付）', 7, 0, 1),
('pay_yeepay_merchantpublickey', 'type=text&size=80', '', '商户公钥', '', 'yeepay', '银行卡支付（易宝支付）', 7, 0, 1),
('pay_yeepay_yeepaypublickey', 'type=text&size=80', '', '易宝公钥', '', 'yeepay', '易宝支付', 7, 0, 1),
('pay_yeepay_productcatalog', 'type=text&size=80', '1', '商品类别码', '', 'yeepay', '银行卡支付（易宝支付）', 7, 0, 1),
('pay_allinpay_open', 'type=radio&value=1:开启|0:关闭', '0', '开启', '', 'allinpay', '银行卡支付（通联支付）', 7, 0, 1),
('pay_allinpay_merchantid', 'type=text&size=80', '', '商户号', '', 'allinpay', '银行卡支付（通联支付）', 7, 0, 1),
('pay_allinpay_merchantkey', 'type=text&size=80', '', 'MD5 KEY', '', 'allinpay', '银行卡支付（通联支付）', 7, 0, 1),
('pay_weixin_open', 'type=radio&value=1:开启|0:关闭', '1', '开启', '', 'weixin', '微信支付', 7, 0, 1),
('pay_weixin_appid', 'type=text&size=80', 'wx2c21ac80f37d2a08', 'Appid', '微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看。', 'weixin', '微信支付', 7, 0, 1),
('pay_weixin_mchid', 'type=text&size=80', '10098462', 'Mchid', '受理商ID，身份标识', 'weixin', '微信支付', 7, 0, 1),
('pay_weixin_key', 'type=text&size=80', 'shenzhengshiweinengliang10802108', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', 'weixin', '微信支付', 7, 0, 1),
('pay_weixin_appsecret', 'type=text&size=80', 'e1955ac18171be1af01f6ac4a9035f2b', 'Appsecret', 'JSAPI接口中获取openid，审核后在公众平台开启开发模式后可查看。', 'weixin', '微信支付', 7, 0, 1),
('reply_pic_size', 'type=text&size=10&validate=required:true', '5', '评论图片尺寸（M）', '用户添加评论图片时最大的文件尺寸，单位为M，可以为小数！请谨慎修改。因为用户可能在手机上拍照使用，建议使用3-5M', '0', '', 9, 0, 1),
('reply_pic_width', 'type=text&size=10&validate=required:true', '375,95', '评论图片截取宽度', '与图片宽度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 9, 0, 1),
('reply_pic_height', 'type=text&size=10&validate=required:true', '500,126', '评论图片截取高度', '与图片宽度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 9, 0, 1),
('meal_score', 'type=text&size=10&validate=required:true,number:true', '1', '积分设置', '订餐时支付1元钱得到相对应的积分，只支持正整数', 'base', '基础配置', 5, 0, 1),
('group_score', 'type=text&size=10&validate=required:true,number:true', '1', '积分设置', '团购时支付1元钱得到相对应的积分，只支持正整数', '0', '', 4, 0, 1),
('login_weixin_appid', 'type=text&size=80&validate=required:true', 'wx5e502b653810fc64', 'AppID', '从微信开放平台获取', 'login_weixin', 'Web微信登录', 10, 0, 1),
('login_weixin_appsecret', 'type=text&size=80&validate=required:true', 'adea96ca258198b80aa2412b491681af', 'AppSecret', '从微信开放平台获取', 'login_weixin', 'Web微信登录', 10, 0, 1),
('user_score_get', 'type=text&size=10&validate=required:true,number:true', '1', '消费1元获得积分数', '消费1元获得的积分', 'user_score', '积分策略', 2, 0, 1),
('weixin_login_bind', 'type=radio&value=1:必须|0:可选', '1', '微信登录绑定帐号', '微信登录必须绑定帐号', 'reg_login', '注册登录', 2, 0, 1),
('share_ticket', '', 'sM4AOVdWfPE4DxkXGEs8VP78QQeCAgv-dgSE3fvMAqEnPk08T_dW10qTu3WfDrnL8Kb0a8fcc4OHijOqxl2Fmw', '', '', '0', '', 0, 0, 1),
('share_dated', '', '1450287531', '', '', '0', '', 0, 0, 1),
('merchant_qrcode_indexsort', 'type=text&size=10&validate=required:true,number:true', '1', '扫商户码增加排序储值', '用户通过商户二维码第一次关注公众号，增加的团购首页排序储值！一次展现将会扣除1分', 'base', '基础配置', 6, 0, 1),
('pay_offline_open', 'type=radio&value=1:开启|0:关闭', '1', '开启', '', 'offline', '线下支付', 7, 0, 1),
('group_around_range', 'type=text&size=10&validate=required:true', '5000', '附近团购最远距离', '用户在查找附近团购时，能显示的最远距离。单位为米', '0', '', 4, 0, 1),
('meal_around_range', 'type=text&size=10&validate=required:true', '1000', '附近订餐最远距离', '用户在查找附近订餐时，能显示的最远距离。单位为米', 'base', '基础配置', 5, 0, 1),
('merchant_around_range', 'type=text&size=10&validate=required:true', '1000000000', '附近商家最远距离', '用户在查找附近商家时，能显示的最远距离。单位为米', 'base', '基础配置', 6, 0, 1),
('im_appid', 'type=text&validate=required:true', '32', 'AppID', '', '0', '', 0, 0, 1),
('im_appkey', 'type=text&validate=required:true', '24cc0d4462ed05e4ef82a3f2b63d1ec0', '', '', '0', '', 0, 0, 1),
('site_merchant_logo', 'type=image&validate=required:true,url:true', 'http://127.0.0.1/static/images/merchant_logo.png', '商户后台LOGO', '请填写网站LOGO的网址，包含（http://域名）！默认模板推荐 30宽*30高', '0', '', 1, 9, 1),
('classify_verify', 'type=radio&value=1:须审核|0:不审核', '1', '发布是否审核', '发布分类信息是否需要后台审核', '0', '', 11, 0, 1),
('is_open_oauth', 'type=radio&value=1:开启|0:关闭', '0', '允许商家绑定公众号', '如果开启，则每个商家都拥有此功能。如果关闭，可以单独给商家开启！', 'base', '基础配置', 6, 0, 1),
('is_open_weidian', 'type=radio&value=1:开启|0:关闭', '1', '允许商家开微店', '如果开启，则每个商家都拥有此功能。如果关闭，可以单独给商家开启！', 'base', '基础配置', 6, 0, 1),
('site_phone', 'type=text', '400-0000-000', '联系电话', '前台涉及到需要显示联系电话的地方，将显示此值！', '0', '', 1, 8, 1),
('wap_redirect', 'type=select&value=0:不跳转|1:自动跳转|2:询问跳转', '1', '手机访问电脑网站', '手机访问电脑网站跳转', '0', '', 1, 0, 1),
('wechat_encode', 'type=select&value=0:明文模式|1:兼容模式|2:安全模式', '0', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', '0', '', 8, 0, 1),
('wechat_encodingaeskey', 'type=text&size=80', 'x', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', '0', '', 8, 0, 1),
('wechat_follow_show_open', 'type=radio&value=1:开启|0:关闭', '1', '已关注用户是否显示关注', '已关注用户再通过分享链接进来是否显示关注提示', '0', '', 8, 0, 1),
('wechat_follow_txt_txt', 'type=text&size=80&validate=required:true', 'x', '分享时关注公众号链接名称', '公众号图文消息链接的文字！{nickname}代表分享者的昵称，如果分享者填写了真实名字，则优先使用真实名字。', '0', '', 8, -1, 1),
('wechat_follow_txt_url', 'type=text&size=80&validate=required:true,url:true', 'http://mp.weixin.qq.com', '分享时关注公众号链接', '若用户使用微信进入网站，没有关注公众号！首页和详情页将会展示按钮跳转到此链接，建议使用微信的链接', '0', '', 8, -2, 1),
('wap_home_show_classify', 'type=radio&value=1:开启|0:关闭', '1', 'wap首页显示', 'wap网站首页是否显示分类信息的分类列表', '0', '', 11, 1, 1),
('home_share_show_open', 'type=select&value=0:关闭|1:开启显示商家信息|2:开启跳转到商家微网站', '0', '显示粉丝首次进入本站商家', '在网站首页显示用户是通过那个商家进入本站的', 'promote', '商家推广', 6, 0, 1),
('home_share_txt', 'type=text&validate=required:true', '您属于{title}的粉丝', '首次进入本站的店铺', '{title}代表商家的店铺名称。', 'promote', '商家推广', 6, -1, 1),
('print_format', 'type=textarea&rows=20&cols=93', '客户姓名：{user_name}\r\n客户电话：{user_phone}\r\n客户地址：{user_address}\r\n客户留言：{user_message}\r\n下单时间：{buy_time}\r\n************************\r\n{goods_list}\r\n************************\r\n菜品总数：{goods_count}\r\n菜品总价：￥{goods_price}\r\n订单号：{orderid}\r\n订单状态：{pay_status}\r\n支付方式：{pay_type}\r\n※※※※※※※※※※※※※※※※\r\n店铺名称：{store_name}\r\n店铺电话：{store_phone}\r\n店铺地址：{store_address}\r\n打印时间：{print_time}\r\n谢谢惠顾，欢迎再次光临！', '输出格式', '客户姓名：{user_name} <br/>客户电话：{user_phone} <br/>客户地址：{user_address} <br/>下单时间：{buy_time} <br/>菜单： {goods_list} <br/>菜品总数：{goods_count} <br/>菜品总价：{goods_price} <br/>订单号：{orderid} <br/>订单状态：{pay_status} <br/>支付方式：{pay_type} <br/>商家名称：{store_name} <br/>商家电', 'print', '小票打印机', 5, 0, 1),
('print_server_key', 'type=text&validate=required:true', '1', '小票打印机Key', '和小票打印机通信的key,请联系我们获取', 'print', '小票打印机', 5, 1, 1),
('print_server_topdomain', 'type=text&size=80', 'vnlcms.com', '小票打印机连接的顶级域名', '和小票打印机连接的顶级域名，如果不填写的，默认是您网站的顶级域名', 'print', '小票打印机', 5, 1, 1),
('wx_token', 'type=text&size=80', '', '公众号消息校验Token', '公众号消息校验Token', 'weixinmp', '商家公众号绑定配置', 6, 0, 1),
('wx_appsecret', 'type=text&size=80', '', '网页授权AppSecret', '网页授权AppSecret', 'weixinmp', '商家公众号绑定配置', 6, 0, 1),
('wx_appid', 'type=text&size=80', '', '网页授权AppID', '网页授权AppID', 'weixinmp', '商家公众号绑定配置', 6, 0, 1),
('wx_encodingaeskey', 'type=text&size=80', '', '公众号消息加解密Key', '公众号消息加解密Key', 'weixinmp', '商家公众号绑定配置', 6, 0, 1),
('system_version', '', '1.2', '', '', '0', '', 0, 0, 1),
('weixin_buy_follow_wechat', 'type=select&value=0:无限制|1:关注公众号享受微信优惠|2:关注公众号才能购买商品', '0', '团购微信优惠限制', '微信购买商品享受微信优惠的限制', '0', '', 8, 0, 1),
('platform_get_merchant_percent', 'type=text&size=10', '5/100', '商家销售分成比例', '平台从商家的总销售额中获取的一定比例的抽成（按百分比，不要填写%）,填写0表示不拿抽成', 'base', '基础配置', 6, 0, 1),
('classify_logo', 'type=image&validate=required:false,url:true', '', '分类信息LOGO', '请填写网站分类信息模块的LOGO，包含（http://域名）！默认模板推荐 190宽*60高', '0', '', 11, 0, 1),
('flseo_description', 'type=textarea&rows=4&cols=93', 'o2o生活通', 'SEO描述', '一般不超过200个字符！', '0', '', 11, 1, 1),
('flseo_keywords', 'type=text&size=80', 'o2o生活通', 'SEO关键词', '一般不超过100个字符！', '0', '', 11, 2, 1),
('flseo_title', 'type=text&size=80&validate=required:true', '分类信息网', 'SEO标题', '一般不超过80个字符！', '0', '', 11, 3, 1),
('pay_alipay_open', 'type=radio&value=1:开启|0:关闭', '0', '开启', '', 'alipay', '支付宝支付', 7, 0, 1),
('pay_alipay_name', 'type=text&size=80', '', '帐号', '', 'alipay', '支付宝支付', 7, 0, 1),
('pay_alipay_pid', 'type=text&size=80', '', 'PID', '', 'alipay', '支付宝支付', 7, 0, 1),
('pay_alipay_key', 'type=text&size=80', '', 'KEY', '', 'alipay', '支付宝支付', 7, 0, 1),
('wx_componentverifyticket', 'type=text', 'xx', '', '', '0', '', 0, 0, 1),
('pay_weixin_client_cert', 'type=file&file=pem', '', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', 'weixin', '微信支付', 7, 0, 1),
('pay_weixin_client_key', 'type=file&file=pem', '', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', 'weixin', '微信支付', 7, 0, 1),
('web_category_show_limit', 'type=text&size=10&validate=required:true', '9', 'PC端首页一级分类显示数量', 'PC端首页一级分类显示数量！填写显示的数量，防止内容溢出。', '0', '', 1, 0, 1),
('merchant_qrcode_fans', 'type=text&size=10&validate=required:true,number:true', '1', '扫商户码关注增加粉丝数', '用户通过商户二维码第一次关注公众号，平台给商家自动增加0~指定值个数的粉丝给商家！', 'base', '基础配置', 6, 0, 1),
('meal_page_row', 'type=text&size=10&validate=required:true', '24', '快店列表每页数量', '快店列表每页显示的数量', 'base', '基础配置', 5, 0, 1),
('meal_page_val', 'type=text&size=10&validate=required:true,english:true', 'page', '快店列表页面分页参数', '快店列表页面分页的GET参数，通常为page！只允许英文', 'base', '基础配置', 5, 0, 1),
('sms_key', 'type=text&validate=required:true', '1', '短信秘钥', '购买短信时候获取的秘钥', '0', '', 15, 12, 0),
('sms_sign', 'type=text&validate=required:true', '1', '客户的签名', '您发送短信是的签名', '0', '', 15, 12, 1),
('sms_place_order', 'type=select&value=0:都不通知|1:只通知客户|2:只通知商家|3:两者都通知', '3', '下单提醒', '客户在下单时候发起的提醒', '0', '', 15, 0, 1),
('sms_success_order', 'type=select&value=0:都不通知|1:只通知客户|2:只通知商家|3:两者都通知', '3', '支付成功后提醒', '客户在支付成功后时候发起的提醒', '0', '', 15, 0, 1),
('sms_finish_order', 'type=select&value=0:都不通知|1:只通知客户|2:只通知商家|3:两者都通知', '3', '客户完成消费后提醒', '客户在完成消费后时候发起的提醒', '0', '', 15, 0, 1),
('sms_cancel_order', 'type=select&value=0:都不通知|1:只通知客户|2:只通知商家|3:两者都通知', '3', '客户取消订单后提醒', '客户取消订单时候发起的提醒', '0', '', 15, 0, 1),
('sms_server_topdomain', 'type=text&validate=required:true', 'vnlcms.com', '绑定的顶级域名', '你网站的顶级域名', '0', '', 15, 12, 0),
('wap_site_footer', 'type=textarea&rows=6&cols=93', '', 'wap站底部隐藏信息', '可填写统计、客服等HTML代码，代码前台隐藏不可见！！', '0', '', 1, 0, 1),
('group_print_format', 'type=textarea&rows=20&cols=93', '客户姓名：{user_name}\r\n客户电话：{user_phone}\r\n客户地址：{user_address}\r\n**************************************\r\n订 单 号：{orderid}\r\n商品名称：{goods_name}\r\n购买数量：{goods_count}\r\n总 价：{goods_price}\r\n优 惠：{minus_price}\r\n实 收：{true_price}\r\n购买时间：{buy_time}\r\n付款时间：{pay_time}\r\n消费时间：{use_time}\r\n支付方式：{pay_type}\r\n**************************************\r\n店铺名称：{store_name}\r\n店铺电话：{store_phone}\r\n店铺地址：{store_address}\r\n打印时间：{print_time}\r\n谢谢惠顾，欢迎再次光临！', '团购输出格式', '客户姓名：{user_name} \r\n客户电话：{user_phone} \r\n客户地址：{user_address} \r\n************************************** \r\n订 单 号：{orderid} \r\n商品名称：{goods_name} \r\n购买数量：{goods_count} \r\n总 价：{goods_price} \r\n优 惠：{minus_price} \r\n实 收：{true_price} \r\n购买时间：{buy_time} \r\n付款时间：{pay_ti', 'print', '小票打印机', 5, 0, 1),
('level_onoff', 'type=radio&value=1:开启|0:关闭', '1', '会员等级', '开启会员等级，会员下单会获得相应商品配置的优惠策略', 'level_manage', '会员等级管理', 2, 0, 1),
('group_level_onoff', 'type=radio&value=1:开启|0:关闭', '1', '等级优惠', '开启后商家可以配置商品团购等级优惠', '0', '', 4, 0, 1),
('is_open_click_fans', 'type=radio&value=1:开启|0:关闭', '1', '点击推广信息成为粉丝', '用户点击推广的产品成为该产品所属商家的粉丝', 'base', '基础配置', 6, 0, 1),
('activity_sign_term', 'type=radio&value=1:允许|0:不允许', '1', '报名活动选择期数', '商家在报名活动的时候，是否能选择未来活动的期数！如果不允许，商家只能选择当前正在进行的活动期数。', '0', '', 14, 0, 1),
('activity_pic_size', 'type=text&size=10&validate=required:true', '1', '商品图片尺寸（M）', '商家添加商品图片时最大的文件尺寸，单位为M，可以为小数！请谨慎修改', '0', '', 14, 0, 1),
('activity_pic_width', 'type=text&size=10&validate=required:true', '360,268', '活动图片截取宽度', '与图片高度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 14, 0, 1),
('activity_pic_height', 'type=text&size=10&validate=required:true', '334,248', '活动图片截取高度', '与图片宽度配合使用，两个值用英文逗号分隔代表大图，小图！请谨慎修改', '0', '', 14, 0, 1),
('activity_score_scale', 'type=text&size=10&validate=required:true,number:true', '1', '参与活动积分比例', '参与积分平台积分抵扣商家积分的比例。例如设置了10，则只需要商家积分除以10的平台积分即可参与活动。', '0', '', 14, 0, 1),
('activity_open', 'type=radio&value=1:开启|0:关闭', '1', '开启活动', '是否开启活动功能，如果选择不开启，首页的活动将被广告位占位！', '0', '', 14, 1, 1),
('group_alias_name', 'type=text&size=4&validate=required:true', '团购', '团购别名', '给团购取个别称（两个字）', '0', '', 4, 0, 1),
('meal_alias_name', 'type=text&size=4&validate=required:true', '快店', '快店别名', '给快店取个别称（两个字）', 'base', '基础配置', 5, 0, 1),
('site_show_footer', 'type=textarea&rows=6&cols=93', '吾爱源码', '网站底部显示信息', '网站底部显示内容！为了样式的美观及误操作，HTML标签仅允许显示A链接标签！回车代表页面中的换行。', '0', '', 1, 0, 1),
('live_service_have', '', '1', '', '', '0', '', 0, 0, 1),
('site_water_mark_pos', 'type=select&value=1:左上角|2:顶部|3:右上角|4:左侧|5:中间|6:右侧|7:左下角|8:底部|9:右下角', '9', '水印的位置', '水印打在图片的位置', '0', '', 1, 10, 1),
('user_spread_rate', 'type=text&size=10&validate=required:true,number:true,range:[0,100]', '0', '用户分享佣金比例', '用户分享链接购买团购商品获得佣金比例（百分比 0-100）微信中分享有效', 'user_spread', '推广佣金', 2, 0, 1),
('appoint_page_row', 'type=text&size=10&validate=required:true', '20', '预约列表每页数量', '预约列表页面分页的GET参数，通常为page！只允许英文', '0', '', 3, 0, 1),
('appoint_page_val', 'type=text&size=10&validate=required:true,english:true', 'page', '预约列表页面分页参数', '预约列表页面分页的GET参数，通常为page！', '0', '', 3, 0, 1),
('appoint_verify', 'type=radio&value=1:须审核|0:不审核', '0', '添加预约须审核', '商家添加预约信息是否需要管理员后台审核', '0', '', 3, 0, 1),
('store_type', 'type=radio&value=1:开启|0:关闭', '1', '店铺类型是否开启', '商户能自行配置店铺类型', 'base', '基础配置', 5, 1, 1),
('site_wap_tpl', 'type=wapTpl&validate=required:true', 'pure', 'WAP版模板风格', 'WAP版模板风格（如果系统程序部分模块中写定模板将无法更换）', '0', '', 1, 0, 1),
('site_web_tpl', 'type=webTpl&validate=required:true', 'blue', 'PC版模板风格', 'PC版模板风格（如果系统程序部分模块中写定模板将无法更换）', '0', '', 1, 0, 1),
('wechat_share_img', 'type=image&validate=required:true,url:true', 'http://127.0.0.1/upload/config/000/000/001/56710f9372d2a.jpg', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', '0', '', 8, 0, 1),
('site_water_mark', 'type=image&validate=url:true', '', '网站水印', '建议使用宽度小于120像素的gif、png透明图片作为水印', '0', '', 1, 10, 1),
('sms_api', 'type=text&validate=required:true&size=100', 'http://api.smsbao.com/sms?u={uid}&p={pwd}&m={moblie}&c={content}', '短信API地址', '帐号{uid}密码{pwd}号码{moblie}内容{content}', '0', '', 15, 0, 1),
('sms_uid', 'type=text&validate=required:true', 'qq10802108', '帐号', '', '0', '', 15, 0, 1),
('sms_pwd', 'type=text&validate=required:true', '1qaz2w3e', '密码', '', '0', '', 15, 0, 1),
('sms_pwd_md5', 'type=radio&value=1:开启|0:关闭', '1', 'API密码MD5加密', '', '0', '', 15, 0, 1),
('sms_success', 'type=text', '0', '发送成功状态值', '', '0', '', 15, 0, 1),
('im_key', 'type=text&size=80', '点击下方按钮获取', '交友聊天KEY', 'wap手机端的交友聊天key', '0', '交友聊天KEY', 1, 0, 1),
('baidu_map_key', 'type=text&size=80', '4c1bb2055e24296bbaef36574877b4e2', '百度地图KEY', 'wap手机端的百度地图key', '0', '百度地图KEY', 1, 0, 1),
('live_service_type', '', 'electric,water', '', '', '0', '', 0, 0, 1),
('live_service_appid', '', '10219', '', '', '0', '', 0, 0, 1),
('live_service_appkey', '', '0ce593059f922ff18354c42e365359bb', '', '', '0', '', 0, 0, 1),
('system_key', '', '8212f33a14941a0669d42d57e5a1e284', '', '', '0', '', 0, 0, 1),
('customer_one_score', 'type=text&size=10', '0', '单个粉丝可获得积分', '单个粉丝可获得积分', 'customer_send', '群发设置', 6, 0, 1),
('customer_one_score_exchange', 'type=text&size=10', '0', '首页排序储存值兑换积分', '一个首页排序储存值可兑换的积分数', 'customer_send', '群发设置', 6, 0, 1),
('im_url', 'type=text&validate=url:true', 'http://im-link.32rom.com', '交友聊天系统URL', '交友聊天系统URL，如需绑定域名，请将域名cname指向到 im-link.meihua.com', '0', '', 1, 0, 1),
('house_display', 'type=text&validate=required:true', '2 1 3 4 5', '首页显示排序', '1为新闻列表，2为社区服务，3为推荐团购，4为推荐快店，5为推荐预约，其他数字无效！编号之间用空格来分隔，编号位置靠前优先显示', '0', '', 22, 0, 1),
('house_open', 'type=radio&value=1:开启|0:关闭', '1', '开启社区', '是否开启社区功能', '0', '', 22, 1, 1),
('site_close', 'type=select&value=0:开启|1:PC端关闭|2:WAP端关闭(含微信)|3:全部关闭', '0', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', '0', '', 1, -1, 1),
('site_close_reason', 'type=textarea&rows=6&cols=93', '', '网站关闭原因', '将显示在页面上给用户查看', '0', '', 1, -1, 1),
('merchant_link_showOther', 'type=radio&value=0:显示|1:隐藏', '1', '商家功能库显示平台链接', '例如商家在功能库添加团购链接，是否显示平台其他链接。（暂时只支持团购）', 'base', '基础配置', 6, 0, 1),
('merchant_edit_group', 'type=radio&value=1:开启|0:关闭', '0', '商家编辑团购权限', '商家是否可以自行编辑团购', 'base', '基础配置', 6, 0, 1),
('merchant_ownpay', 'type=select&value=0:只开启平台支付|1:两者共存|2:商家配置任一支付后只读商家', '0', '商家自有支付', '两者共存（例如商家只开启微信支付，优先读取商家，平台其他支付也会显示） 只读商家（例如商家只开启微信支付，优先读取商家，平台其他支付不会显示）', 'base', '基础配置', 6, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cms_config_group`
--

CREATE TABLE IF NOT EXISTS `cms_config_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` char(20) NOT NULL,
  `galias` char(20) NOT NULL,
  `gsort` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='配置分组' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `cms_config_group`
--

INSERT INTO `cms_config_group` (`gid`, `gname`, `galias`, `gsort`, `status`) VALUES
(1, '基础配置', '', 10, 1),
(2, '会员配置', '', 9, 1),
(3, '预约配置', '', 6, 1),
(4, '团购配置', '', 5, 1),
(5, '订餐配置', '', 6, 1),
(6, '商户配置', '', 8, 1),
(7, '支付配置', '', 4, 1),
(8, '公众号配置', '', 3, 1),
(9, '评论配置', '', 2, 1),
(10, '第三方登录', '', 1, 1),
(11, '分类信息', '', 0, 1),
(15, '短信通知设置', '', 0, 1),
(14, '平台活动', 'activity', 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
