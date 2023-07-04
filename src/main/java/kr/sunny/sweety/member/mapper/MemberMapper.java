package kr.sunny.sweety.member.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import kr.sunny.sweety.member.entity.LoginModel;
import kr.sunny.sweety.member.entity.MyInfoModel;
import kr.sunny.sweety.member.entity.OrderModel;



@Mapper
public interface MemberMapper {
	//회원유무 체크
	public LoginModel loginCheck(Map<String, Object> paramMap);

	//회원가입 아이디 중복체크
	public int idCheck(Map<String, Object> paramMap);
	
	//회원가입
	public int memJoin(Map<String, Object> paramMap);
	
	//마이페이지 폼
	public MyInfoModel myPageInfo(String user_id);
	
	//마이페이지 폼
	public List<OrderModel> orderSituation(Map<String, Object> paramMap);
	
	//마이페이지 폼
	public int countOrderSituation(Map<String, Object> paramMap);
}
