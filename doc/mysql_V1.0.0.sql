/**
* @author 钟启辉
* @date 2017/8/30 17:51
* @description 用户信息表
**/
CREATE TABLE `user_info` (
  `sn` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键sn',
  `real_name` varchar(64) NOT NULL COMMENT '真实姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(32) NOT NULL COMMENT '邮箱地址',
  `status` tinyint(1) NOT NULL COMMENT '用户状态：0正常；1禁用；2锁定',
  `insert_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '该用户插入时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '该用户修改时间',
  PRIMARY KEY (`sn`),
  UNIQUE KEY `idx_user_info_email` (`email`),
  UNIQUE KEY `idx_user_info_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/**
* @author 钟启辉
* @date 2017/8/30 18:31
* @description 固定资产表
**/
CREATE TABLE `assets _info` (
  `sn` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_sn` bigint(20) NOT NULL COMMENT '用户sn',
  `payment_sn` bigint(20) NOT NULL COMMENT '支付工具sn',
  `money` double NOT NULL COMMENT '支付工具中的剩余资产',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assets 资产表';

/**
* @author 钟启辉
* @date 2017/8/30 18:32
* @description 账单表
**/
CREATE TABLE `bills_info` (
  `sn` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bills_id` varchar(128) NOT NULL COMMENT '账单id',
  `user_sn` bigint(20) NOT NULL COMMENT '账单归属的sn',
  `payment_sn` bigint(20) NOT NULL COMMENT '支付工具的sn',
  `pay_method` tinyint(4) NOT NULL COMMENT '支付的方式，0表示支入，1表示支出',
  `amount` double NOT NULL COMMENT '账单金额',
  `insert_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账单插入时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '账单修改时间',
  `note` varchar(1000) DEFAULT NULL COMMENT '账单说明',
  `address` varchar(255) DEFAULT NULL COMMENT '发生账单地点',
  PRIMARY KEY (`sn`),
  UNIQUE KEY `bills_info_id` (`bills_id`),
  KEY `bills_info_insert_time` (`insert_time`),
  KEY `bills_info_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单表';

/**
* @author 钟启辉
* @date 2017/8/30 18:33
* @description 支付工具表
**/
CREATE TABLE `payment_tool` (
  `sn` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键sn',
  `payment_name` varchar(30) NOT NULL COMMENT '支付名称，如：微信，支付宝等',
  `status` tinyint(4) NOT NULL COMMENT '状态，0正常，1禁用',
  `insert_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付方式插入时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付方式修改时间',
  `note` varchar(255) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付工具';