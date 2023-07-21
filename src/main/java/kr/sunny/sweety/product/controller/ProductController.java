package kr.sunny.sweety.product.controller;



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

import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;
import kr.sunny.sweety.product.entity.ProductDetailModel;
import kr.sunny.sweety.product.entity.ProductModel;
import kr.sunny.sweety.product.mapper.ProductMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	ProductMapper productMapper;
	
	@RequestMapping("product.do")
	public String product(Model model, @RequestParam Map<String, Object> paramMap,@RequestParam("product_cd") String product_cd, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		
	
		model.addAttribute("product_cd", product_cd);
		return "product/product";
	}
	
	@RequestMapping("productList.do")
	@ResponseBody
	public  Map<String, Object> productList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		int pagenum = Integer.parseInt((String) paramMap.get("pageNum"));
	    int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	    int pageindex = (pagenum - 1) * pageSize;
	      
	    paramMap.put("pageSize", pageSize);
	    paramMap.put("pageindex", pageindex);
		
	    List<ProductModel> pl = productMapper.productList(paramMap);
	    int count = productMapper.countProductList(paramMap);
		
	    Map<String, Object> plm = new HashMap<String, Object>();
	    plm.put("pl", pl);
	    plm.put("count", count);
		return plm;
	}
	
	@RequestMapping("productDetail.do")
	public String productDetail(Model model, @RequestParam Map<String, Object> paramMap,@RequestParam("product_no") int product_no, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		ProductDetailModel pdm = productMapper.getDetail(product_no);
		
		model.addAttribute("user_id",user_id);
		model.addAttribute("pdm", pdm);
		return "product/productDetail";
	}
	
	@RequestMapping("intoCart.do")
	@ResponseBody
	public int intoBag(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		int cartCom=0;
		//장바구니에 이미 같은 물건이 있는지 확인
		int checkCart = productMapper.checkCart(paramMap);
		
		//장바구니에 같은 물건이 있을 때 수량만 update
		if(checkCart == 1) {
			cartCom = productMapper.updateCart(paramMap);
		}
		//장바구니에 같은 물건이 없을 때 insert
		if(checkCart == 0){
			cartCom = productMapper.intoCart(paramMap);
		}
		
		
		
		return cartCom;
	}
	
	
}

