package kr.sunny.sweety.main.controller;


import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.sunny.sweety.main.entity.MainProductModel;
import kr.sunny.sweety.main.mapper.MainMapper;

/**
 * Handles requests for the application home page.
 */

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainMapper mainmapper;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("main.", locale);
		
		
		
		return "mainPage/mainPage";
	}
	
	//메인페이지 상품 나열
	@RequestMapping("/mainProduct.do")
	@ResponseBody
	public List<MainProductModel> mainProduct(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		List<MainProductModel> mm = mainmapper.getNewProduct();
		return mm;

	}
	
}
