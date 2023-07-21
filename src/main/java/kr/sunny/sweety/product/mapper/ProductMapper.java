package kr.sunny.sweety.product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.product.entity.ProductDetailModel;
import kr.sunny.sweety.product.entity.ProductModel;


@Mapper
public interface ProductMapper {
	//상품 페이지
	public List<ProductModel> productList(Map<String, Object> paramMap);
	public int countProductList(Map<String, Object> paramMap);
	
	//상품 상세페이지
	public ProductDetailModel getDetail(int product_no);
	
	//장바구니에 물건이 이미 있는지 체크
	public int checkCart(Map<String, Object> paramMap);
	
	//장바구니에 물건이 이미 있으면 수량update
	public int updateCart(Map<String, Object> paramMap);
	
	//장바구니 담기
	public int intoCart(Map<String, Object> paramMap);
}
