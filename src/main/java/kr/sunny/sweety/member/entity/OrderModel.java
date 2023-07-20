package kr.sunny.sweety.member.entity;

import lombok.Data;

@Data
public class OrderModel {
	
	private int order_no;
	//총액
	private int order_price;
	private String order_cancel_yn;
	private String order_date;
	private String order_shipping_yn; //O:주문완료 D:배송중 C:배송완료
	
}
