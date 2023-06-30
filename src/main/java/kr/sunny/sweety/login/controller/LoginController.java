package kr.sunny.sweety.login.controller;



import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.sunny.sweety.login.entity.LoginModel;
import kr.sunny.sweety.login.mapper.LoginMapper;
import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	LoginMapper loginMapper;
	
	@RequestMapping("login.do")
	public String notice() {
		return "login/login";
	}
	
	@RequestMapping("loginCheck.do")
	public String salManagementList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		LoginModel userCheck = loginMapper.loginCheck(paramMap);
	    
		if(userCheck != null) {
			
		}
		
		model.addAttribute(paramMap);
		return "redirect:mainPage/mainPage";
	}
}

