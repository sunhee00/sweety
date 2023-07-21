package kr.sunny.sweety.cart.entity;

import lombok.Data;

@Data
public class CartModel {
	
	private String user_id;
	private int product_no;
	private int cart_amt;
	private String product_name;
	private int product_price;
	private String product_file;
}

