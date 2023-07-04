package kr.sunny.sweety.member.entity;

import lombok.Data;

@Data
public class MyInfoModel {
		private String user_id;
		private String user_pw;
	   private String user_name;
	   private String user_email;
	   private int user_zip;
	   private String user_addr;
	   private String user_addr_detail;
	   private int user_tel1;
	   private int user_tel2;
	   private int user_tel3;
	   private String user_date;
	   private String user_birth;
}
