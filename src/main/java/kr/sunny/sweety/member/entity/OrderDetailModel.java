package kr.sunny.sweety.member.entity;

import lombok.Data;

@Data
public class OrderDetailModel {
	
	private int product_no;
	private String product_name;
	private String order_date;
	private int order_detail_amt;
	private int order_detail_price;
	private String product_file;
	
}
