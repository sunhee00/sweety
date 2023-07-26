package kr.sunny.sweety.notice.entity;

import lombok.Data;

@Data
public class NoticeModel {
	private int notice_no;
	private String notice_title;
	private String notice_cont;
	private String notice_writer;
	private String notice_del_yn;
	private String notice_date;
	private String user_id;
}

