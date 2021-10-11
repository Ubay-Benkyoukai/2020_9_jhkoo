CREATE TABLE `member` (
	`id`	varchar(45)	NOT NULL,
	`name`	varchar(45)	NOT NULL,
	`password`	varchar(45)	NOT NULL,
	`type`	varchar(45)	NULL,
	`phone`	varchar(45)	NOT NULL,
	`email`	varchar(45)	NOT NULL,
	`address`	varchar(200)	NOT NULL,
	`age_group`	varchar(45)	NOT NULL,
	`gender`	varchar(45)	NOT NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`property_status`	varchar(45)	NOT NULL,
	`job_key`	varchar(45)	NOT NULL,
	`cash`	int	NULL,
	`last_visit_date`	TIMESTAMP	NULL,
	`kakao_id`	varchar(45)	NULL,
	`email_key`	varchar(45)	NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cash_manage` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`cash`	varchar(45)	NOT NULL,
	`log_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`content`	varchar(200)	NULL,
	PRIMARY KEY (`no`,`id`)
);

CREATE TABLE `favorite` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`to_account_number`	varchar(45)	NOT NULL,
	`to_name`	varchar(45)	NOT NULL,
	`favorite_flag`	varchar(45)	NOT NULL DEFAULT "1",
	PRIMARY KEY (`no`,`id`)
);

CREATE TABLE `user_challenge` (
	`challenge_pk`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`challenge_name`	varchar(45)	NOT NULL,
	`challenge_end_date`	varchar(45)	NULL,
	`challenge_type`	varchar(45)	NOT NULL,
	`target_amount`	int	NOT NULL,
	PRIMARY KEY (`challenge_pk`,`id`)
);

CREATE TABLE `friend` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`friend_id`	varchar(45)	NOT NULL,
	`content`	varchar(200)	NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`agree_flag`	varchar(45)	NULL,
	PRIMARY KEY (`no`,`id`)
);

CREATE TABLE `mail` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`to_mail`	varchar(45)	NOT NULL,
	`title`	varchar(45)	NOT NULL,
	`content`	varchar(200)	NOT NULL,
	PRIMARY KEY (`no`,`id`)
);


CREATE TABLE `savings_account` (
	`account_number`	varchar(45)	NOT NULL,
	`id`	varchar(45)	NOT NULL,
	`account_password`	varchar(45)	NOT NULL,
	`balance`	int	NOT NULL,
	`bank_book_key`	varchar(45)	NOT NULL,
	`nick_name`	varchar(45)	NOT NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`saving_day`	int	NULL,
	`saving_date`	varchar(45)	NULL,
	`auto_saving`	varchar(45)	NULL,
	`auto_saving_bool`	varchar(45)	NULL,
	PRIMARY KEY (`account_number`,`id`)
);

CREATE TABLE `dw_account` (
	`account_number`	varchar(45)	NOT NULL,
	`id`	varchar(45)	NOT NULL,
	`account_password`	varchar(45)	NOT NULL,
	`balance`	int	NOT NULL,
	`bank_book_key`	varchar(45)	NOT NULL,
	`nick_name`	varchar(45)	NOT NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`main_account`	varchar(45)	NOT NULL,
	PRIMARY KEY (`account_number`,`id`)
);

CREATE TABLE `a_reply` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`board_no`	int	NOT NULL,
	`content`	varchar(200)	NOT NULL,
	`writer`	varchar(45)	NOT NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`no`)
);


CREATE TABLE `savings_account_log` (
	`log_pk`	int	NOT NULL AUTO_INCREMENT,
	`account_number`	varchar(45)	NOT NULL,
	`log_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`amount`	int	NOT NULL,
	PRIMARY KEY (`log_pk`,`account_number`)
);

CREATE TABLE `auto_transfer` (
	`log_pk`	int	NOT NULL AUTO_INCREMENT,
	`account_number`	varchar(45)	NOT NULL,
	`my_name`	varchar(45)	NOT NULL,
	`to_type`	varchar(45)	NOT NULL,
	`to_name`	varchar(45)	NOT NULL,
	`to_account_number`	varchar(45)	NOT NULL,
	`to_amount`	int	NOT NULL,
	`auto_trans_day`	int	NOT NULL,
	PRIMARY KEY (`log_pk`,`account_number`)
);

CREATE TABLE `dw_card_log` (
	`log_pk`	int	NOT NULL AUTO_INCREMENT,
	`account_number`	varchar(45)	NOT NULL,
	`log_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`amount`	int	NOT NULL,
	`log_type_key`	varchar(45)	NOT NULL,
	`to_account_number`	varchar(45)	NOT NULL,
	`to_name`	varchar(45)	NOT NULL,
	PRIMARY KEY (`log_pk`,`account_number`)
);

CREATE TABLE `job` (
	`key`	VARCHAR(25)	NOT NULL,
	`value`	VARCHAR(25)	NULL
);

CREATE TABLE `bank_book` (
	`key`	VARCHAR(25)	NOT NULL,
	`value`	VARCHAR(25)	NULL
);

CREATE TABLE `saving_bank_book` (
	`key`	VARCHAR(25)	NOT NULL,
	`value`	VARCHAR(25)	NULL,
	`rate`	VARCHAR(25)	NULL
);

CREATE TABLE `log_type` (
	`key`	VARCHAR(25)	NOT NULL,
	`value`	VARCHAR(25)	NULL
);

CREATE TABLE `a_board` (
	`no`	int	NOT NULL AUTO_INCREMENT,
	`rno` int NOT NULL AUTO_INCREMENT,
	`title`	varchar(45)	NOT NULL,
	`writer`	varchar(45)	NOT NULL,
	`content`	varchar(45)	NOT NULL,
	`view_cnt`	varchar(45)	NULL,
	`reply_cnt`	int	NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`no`)
);

DELETE FROM `a_board`;

SELECT
  @rownum:=@rownum+1 AS no
FROM  `a_board`
WHERE (@rownum:=0)=0;


ALTER TABLE `job` ADD CONSTRAINT `PK_JOB` PRIMARY KEY (
	`key`
);

ALTER TABLE `bank_book` ADD CONSTRAINT `PK_BANK_BOOK` PRIMARY KEY (
	`key`
);

ALTER TABLE `saving_bank_book` ADD CONSTRAINT `PK_SAVING_BANK_BOOK` PRIMARY KEY (
	`key`
);

ALTER TABLE `log_type` ADD CONSTRAINT `PK_LOG_TYPE` PRIMARY KEY (
	`key`
);



ALTER TABLE `cash_manage` ADD CONSTRAINT `FK_member_TO_cash_manage_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `favorite` ADD CONSTRAINT `FK_member_TO_favorite_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `user_challenge` ADD CONSTRAINT `FK_member_TO_user_challenge_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `friend` ADD CONSTRAINT `FK_member_TO_friend_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `mail` ADD CONSTRAINT `FK_member_TO_mail_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `savings_account` ADD CONSTRAINT `FK_member_TO_savings_account_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `dw_account` ADD CONSTRAINT `FK_member_TO_dw_account_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `savings_account_log` ADD CONSTRAINT `FK_savings_account_TO_savings_account_log_1` FOREIGN KEY (
	`account_number`
)
REFERENCES `savings_account` (
	`account_number`
);

ALTER TABLE `auto_transfer` ADD CONSTRAINT `FK_dw_account_TO_auto_transfer_1` FOREIGN KEY (
	`account_number`
)
REFERENCES `dw_account` (
	`account_number`
);

ALTER TABLE `dw_card_log` ADD CONSTRAINT `FK_dw_account_TO_dw_card_log_1` FOREIGN KEY (
	`account_number`
)
REFERENCES `dw_account` (
	`account_number`
);



INSERT INTO `job`(`key`, `value`)
VALUES
('1', 'IT職'),
('2', '主婦'),
('3', '自営業'),
('4', '金融職'),
('5', '販売職');

-- 口座商品テーブル : bank_book
INSERT INTO `bank_book`(`key`, `value`)
VALUES
('1','ハナプラス通帳'),
('2','ヤングハナプラス通帳'),
('3','主力ハナ通帳');

INSERT INTO `saving_bank_book`(`key`, `value`, `rate`)
VALUES
('1','ハナワンキュウ積金','2.5'),
('2','マイホームを購入する積金','2.3'),
('3','夢ハナ積金','1.5');


INSERT INTO `log_type`(`key`, `value`)
VALUES
('1','入金'),
('2','出金');



-- Test用 Account user1~4

INSERT INTO member(`id`, `name`, `password` , `phone`, `email`, `address`,
		`age_group`, `gender`, `reg_date`, `property_status`, `job_key`, `cash`)
VALUES
	  ('user1', 'user1_Name', '1234' , '010-1234-9876', 'user1@gmail.com', 'Japan', 
	   '30代', 'F', '2021-09-02 10:15:30', '五千万円未満', '1', '1000000'),
	  ('user2', 'user2_Name', '1234' , '010-1234-1357', 'user2@gmail.com', 'Japan', 
	   '30代', 'M', '2021-08-30 16:15:20', '一億円以上', '3', '10000000'),
	  ('user3', 'user3_Name', '1234' , '010-1234-2468', 'user3@gmail.com', 'Japan', 
	   '20代', 'M', '2021-08-31 16:15:20', '五百万円未満', '3', '1000000'),
	  ('user4', 'user4_Name', '1234' , '010-1234-5678', 'user4@gmail.com', 'Japan', 
	   '20代', 'M', '2021-09-01 09:15:00', '千万円未満', '1', '1000000');

INSERT INTO cash_manage(`id`, `cash`, `log_date`, `content`)
VALUES
	  ('user1', '1000000', '2021-09-02 10:18:30', 'user1 default cash'),
	  ('user2', '10000000', '2021-08-30 16:18:20', 'user2 default cash'),
	  ('user3', '1000000', '2021-08-31 16:18:20', 'user3 default cash'),
	  ('user4', '1000000', '2021-09-01 09:18:00', 'user4 default cash');
	  
INSERT INTO dw_account(`account_number`, `id`, `account_password`, `balance`, `bank_book_key`, `nick_name`, `reg_date`, `main_account`)
VALUES
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user1', '1234', 110000000, '1', 'user1_ハナプラス', '2021-09-02 10:30:00', 'N'),
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user1', '1234', 120000000, '2', 'user1_ヤングハナプラス', '2021-09-03 09:27:00', 'N'),
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user1', '1234', 130000000, '3', 'user1_主力ハナ', '2021-09-02 13:48:00', 'N'),
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user2', '1234', 110000000, '1', 'user2_ハナプラス', '2021-08-30 16:20:23', 'Y'),
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user2', '1234', 120000000, '2', 'user2_ヤングハナプラス', '2021-09-01 11:15:20', 'N'),
	  ((SELECT CONCAT('0005-031-', LPAD(IFNULL(MAX(SUBSTR(account_number, 10)), 0) + 1, 5, 0)) from dw_account b),
		'user3', '1234', 110000000, '1', 'user3_ハナプラス', '2021-08-31 16:16:22', 'Y');
