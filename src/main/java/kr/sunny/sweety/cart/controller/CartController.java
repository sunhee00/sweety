package kr.sunny.sweety.cart.controller;



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

import kr.sunny.sweety.cart.entity.CartModel;
import kr.sunny.sweety.cart.mapper.CartMapper;
import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;
import kr.sunny.sweety.product.entity.ProductDetailModel;
import kr.sunny.sweety.product.mapper.ProductMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/cart/")
public class CartController {
	
	@Autowired
	CartMapper cartMapper;
	
	@RequestMapping("cart.do")
	public String cart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {

		return "cart/cart";
	}
	
	@RequestMapping("cartList.do")
	public String cartList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		  int pagenum = Integer.parseInt((String) paramMap.get("pageNum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
	      
			String user_id = (String) session.getAttribute("user_id");
			paramMap.put("user_id", user_id);
			
			List<CartModel> cm = cartMapper.cartList(paramMap);
			int count = cartMapper.countCartList(paramMap);
			
			model.addAttribute("cm",cm);
			model.addAttribute("count",count);
			return "cart/cartGrd";
	}
	
	@RequestMapping("cartCancel.do")
	@ResponseBody
	public int cartCancel(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		paramMap.put("user_id", user_id);
		
		int delCart = cartMapper.delCart(paramMap);
		
	
		return delCart;
	}
	
	
	
	
}

