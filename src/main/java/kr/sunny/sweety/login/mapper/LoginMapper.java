package kr.sunny.sweety.login.mapper;


import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import kr.sunny.sweety.login.entity.LoginModel;



@Mapper
public interface LoginMapper {
	//회원유무 체크
	public LoginModel loginCheck(Map<String, Object> paramMap);

}
