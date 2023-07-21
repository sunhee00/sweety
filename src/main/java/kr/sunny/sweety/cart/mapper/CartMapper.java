package kr.sunny.sweety.cart.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import kr.sunny.sweety.cart.entity.CartModel;
import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.product.entity.ProductDetailModel;


@Mapper
public interface CartMapper {

	//내 장바구니 리스트 불러오기
	public List<CartModel> cartList(Map<String, Object> paramMap);
	public int countCartList(Map<String, Object> paramMap);

	//장바구니 품목 취소
	public int delCart(Map<String, Object> paramMap);
}
