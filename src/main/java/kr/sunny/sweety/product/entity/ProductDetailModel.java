package kr.sunny.sweety.product.entity;

import lombok.Data;

@Data
public class ProductDetailModel {
	private int product_no;
	private String product_cd;
	private String product_name;
	private int product_price;
	private String product_memo;
	private String product_file;
}

