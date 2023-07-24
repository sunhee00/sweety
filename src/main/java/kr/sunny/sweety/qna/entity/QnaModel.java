package kr.sunny.sweety.qna.entity;

import lombok.Data;

@Data
public class QnaModel {
	private int qna_no;
	private String qna_title;
	private String user_id;
	private String qna_date;
	private int qna_seq;
	private int qna_lv;
}

