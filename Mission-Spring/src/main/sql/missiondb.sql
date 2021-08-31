SELECT * from member;
SELECT * from dw_card_log;
SELECT * from dw_account;



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
	`favorite_flag`	varchar(45)	NOT NULL,
	PRIMARY KEY (`no`,`id`)
);

CREATE TABLE `user_challenge` (
	`challege_pk`	int	NOT NULL AUTO_INCREMENT,
	`id`	varchar(45)	NOT NULL,
	`challenge_name`	varchar(45)	NOT NULL,
	`challenge_end_date`	varchar(45)	NULL,
	`challenge_type`	varchar(45)	NOT NULL,
	`target_amount`	int	NOT NULL,
	PRIMARY KEY (`challege_pk`,`id`)
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
	`title`	varchar(45)	NOT NULL,
	`writer`	varchar(45)	NOT NULL,
	`content`	varchar(45)	NOT NULL,
	`view_cnt`	varchar(45)	NULL,
	`reply_cnt`	int	NULL,
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`no`)
);




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

