package kr.sunny.sweety.qna.controller;



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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;
import kr.sunny.sweety.qna.entity.QnaModel;
import kr.sunny.sweety.qna.mapper.QnaMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/qna/")
public class QnaController {
	
	@Autowired
	QnaMapper qnaMapper;
	
	@RequestMapping("qna.do")
	public String qna() {
		return "qna/qna";
	}
	
	@RequestMapping("qnaList.do")
	public String qnaList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      int pagenum = Integer.parseInt((String) paramMap.get("pageNum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
	      
	      // Controller  Service  Dao  SQL
	      List<QnaModel> qnaList = qnaMapper.qnaList(paramMap);
	      int count = qnaMapper.countQnaList(paramMap);
	      
	      model.addAttribute("qnaList", qnaList);
	      model.addAttribute("count", count);
	      
	      System.out.println("실행!!!!!!!!!!!!!");

	      return "qna/qnaGrd";
	   }
	
	@RequestMapping("qnaWrite.do")
	public String qnaWrite(Model model, @RequestParam Map<String, Object> paramMap, @RequestParam("qna_lv") int qna_lv, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null || user_id.equals("")) {
			rttr.addFlashAttribute("msg", true);
			return "redirect:qna.do";
		}
		model.addAttribute("user_id", user_id);
		model.addAttribute("qna_lv", qna_lv);
	     
	      return "qna/qnaWrite";
	  }
	
	
	@RequestMapping("qnaInsert.do")
	public String qnaInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		paramMap.put("user_id", user_id);
		int qna_no = qnaMapper.qnaInsertNo(paramMap);
		paramMap.put("qna_no", qna_no);
		
		int qnaIns = qnaMapper.qnaInsert(paramMap);
		int qnaDetailIns = qnaMapper.qnaDetailInsert(paramMap);
		if(qnaIns >0 && qnaDetailIns > 0) {
			return "redirect:qna.do";
		}
		return "redirect:qnaWrite.do";
	}
}

