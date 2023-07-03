package kr.sunny.sweety.member.mapper;


import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import kr.sunny.sweety.member.entity.LoginModel;



@Mapper
public interface MemberMapper {
	//회원유무 체크
	public LoginModel loginCheck(Map<String, Object> paramMap);

	//회원가입 아이디 중복체크
	public int idCheck(Map<String, Object> paramMap);
	
	//회원가입
	public int memJoin(Map<String, Object> paramMap);
}
