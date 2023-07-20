package kr.sunny.sweety.member.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import kr.sunny.sweety.member.entity.LoginModel;
import kr.sunny.sweety.member.entity.MyInfoModel;
import kr.sunny.sweety.member.entity.OrderDetailModel;
import kr.sunny.sweety.member.entity.OrderModel;



@Mapper
public interface MemberMapper {
	//회원유무 체크
	public LoginModel loginCheck(Map<String, Object> paramMap);

	//회원가입 아이디 중복체크
	public int idCheck(Map<String, Object> paramMap);
	
	//회원가입
	public int memJoin(Map<String, Object> paramMap);
	
	//마이페이지
	public MyInfoModel myPageInfo(String user_id);
	
	//마이페이지 주문완료등 개수 표시
	public int countOrder(String order_shipping_yn);
	
	//마이페이지 주문상태
	public List<OrderModel> orderSituation(Map<String, Object> paramMap);
	
	//마이페이지 주문상태 카운트
	public int countOrderSituation(Map<String, Object> paramMap);
	
	//주문상태 취소
	public int orderCancel(Map<String, Object> paramMap);
	
	//마이페이지 주문상태
	public List<OrderDetailModel> orderDetailSituation(Map<String, Object> paramMap);
	
	//마이페이지 주문상태 카운트
	public int countOrderDetailSituation(Map<String, Object> paramMap);
	
	//마이페이지 회원정보 수정
	public int myPageUpdate(Map<String, Object> paramMap);
}
