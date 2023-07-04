package kr.sunny.sweety.member.controller;



import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.sunny.sweety.member.entity.LoginModel;
import kr.sunny.sweety.member.entity.MyInfoModel;
import kr.sunny.sweety.member.entity.OrderModel;
import kr.sunny.sweety.member.mapper.MemberMapper;
import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;
	
	@RequestMapping("login.do")
	public String notice() {
		return "member/login";
	}
	
	@RequestMapping("loginCheck.do")
	public String salManagementList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		LoginModel userCheck = memberMapper.loginCheck(paramMap);
	    
		//세션 변수 저장
	    if(userCheck != null) {
	    	session = request.getSession(true);
			session.setAttribute("user_id", userCheck.getUser_id());
			session.setAttribute("user_name", userCheck.getUser_name());
			session.setMaxInactiveInterval(60*30);
			
			return "redirect:/";
	    }else {
	    	rttr.addFlashAttribute("msg",false);
			return "redirect:/member/login.do";
	    }
	    

	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception {
	 
	 session.invalidate();
	   
	 return "redirect:/";
	}
	
	
	//회원가입폼
	@RequestMapping("join.do")
	public String join(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
	    return "member/join";

	}
		
	//회원가입 아이디 중복체크
	@RequestMapping("idCheck.do")
	@ResponseBody
	public int idCheck(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		int id = memberMapper.idCheck(paramMap);
		
		
		
	    return id;

	}
	//회원가입
	@RequestMapping("memJoin.do")
	@ResponseBody
	public int memJoin(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		int id = memberMapper.memJoin(paramMap);
	    return id;

	}
	
	//마이페이지
	@RequestMapping("myPage.do")
	public String myPage(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
	    return "member/myPage";

	}
	
	//마이페이지 배송상태
	@RequestMapping("orderSituation.do")
	public String orderSituation(Model model, @RequestParam("order_shipping_yn") String order_shipping_yn, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		model.addAttribute(order_shipping_yn);
	    return "member/myPageOrderSituation";

	}
	//마이페이지 배송상태리스트
	@RequestMapping("orderSituationList.do")
	public String orderSituationList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		paramMap.put("user_id", user_id);
		List<OrderModel> om = memberMapper.orderSituation(paramMap);
		int count = memberMapper.countOrderSituation(paramMap);
		model.addAttribute("om",om);
		model.addAttribute("count",count);
	    return "member/myPageOrderSituationGrd";

	}
	/*
	 * //마이페이지 배송상태 상세
	 * 
	 * @RequestMapping("orderSituationDetail.do") public String
	 * orderSituationDetail(Model model, @RequestParam("order_shipping_yn") String
	 * order_shipping_yn, HttpServletRequest request, HttpServletResponse response,
	 * HttpSession session, RedirectAttributes rttr) throws Exception {
	 * 
	 * model.addAttribute(order_shipping_yn); return
	 * "member/myPageOomrderSituation";
	 * 
	 * } //마이페이지 배송상태별 상세리스트
	 * 
	 * @RequestMapping("orderSituationDetailList.do")
	 * 
	 * @ResponseBody public String orderSituationDetailList(Model
	 * model, @RequestParam Map<String, Object> paramMap, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session,
	 * RedirectAttributes rttr) throws Exception { String user_id = (String)
	 * session.getAttribute("user_id"); paramMap.put("user_id", user_id);
	 * List<OrderModel> om = memberMapper.orderSituation(paramMap);
	 * model.addAttribute(om); return "member/myPageOomrderSituationGrd";
	 * 
	 * }
	 * 
	 * //마이페이지 폼
	 * 
	 * @RequestMapping("myPageInfoForm.do") public MyInfoModel myPageInfo(Model
	 * model, @RequestParam Map<String, Object> paramMap, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session,
	 * RedirectAttributes rttr) throws Exception {
	 * 
	 * String user_id = (String) session.getAttribute("user_id"); MyInfoModel mim =
	 * memberMapper.myPageInfo(user_id); return mim;
	 * 
	 * }
	 */
	
}

