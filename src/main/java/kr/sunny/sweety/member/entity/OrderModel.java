package kr.sunny.sweety.member.entity;

public class OrderModel {
	private int order_no;
	//총액
	private int order_price;
	private String order_cancel_yn;
	private String order_date;
	private String order_shipping_yn; //O:주문완료 D:배송중 C:배송완료
	private int product_no;
	private String product_name;
	//물건 각각의 총 수량
	private int order_detail_amt;
	//물건 각각의 총액
	private int order_detail_price;
}
