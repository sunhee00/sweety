package kr.sunny.sweety.qna.controller;



import java.util.ArrayList;
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
	public String qnaWrite(Model model, @RequestParam Map<String, Object> paramMap,HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String msg = "";
		QnaModel qnaDetail = null;
		
		String user_id = (String) session.getAttribute("user_id");
		if(user_id == null || user_id.equals("")) {
			msg = "L";
			rttr.addFlashAttribute("msg", msg);
			return "redirect:qna.do";
		}
		
		//qnaDetail.jsp에서 수정하기 누를 시.
		System.out.println(paramMap);
		if(!paramMap.isEmpty() && paramMap != null) {
			
			qnaDetail = qnaMapper.getQnaDetail(paramMap);
			model.addAttribute("qnaDetail", qnaDetail);
			System.out.println(qnaDetail);
		}
		
		model.addAttribute("user_id", user_id);
	     
	      return "qna/qnaWrite";
	  }
	
	
	@RequestMapping("qnaInsert.do")
	public String qnaInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println(paramMap);
		
		
		//경로 직접쳐서 들어왔을 때
		if(paramMap.isEmpty()) {
			return "redirect:qnaWrite.do";
		}
		
		
		
		String qnaType = (String)paramMap.get("qnaType");
		String user_id = (String) session.getAttribute("user_id");
		
		//redirect msg
		String msg = qnaType;
		
		paramMap.put("user_id", user_id);
		
		//tb_qna insert반환값
		int qnaIns = 0;
		
		//tb_qna_detail insert반환값
		int qnaDetailIns = 0;
		
		//새 qna게시글 insert
		if(qnaType.equals("I")) {
			int qna_no = qnaMapper.qnaInsertNo(paramMap);
			paramMap.put("qna_no", qna_no);
			qnaIns = qnaMapper.qnaInsert(paramMap);
			qnaDetailIns = qnaMapper.qnaDetailInsert(paramMap);
		}
		
		//기존 qna게시글 update
		if(qnaType.equals("U")){
			qnaIns = qnaMapper.qnaUpdate(paramMap);
			qnaDetailIns = qnaMapper.qnaDetailUpdate(paramMap);
		}
		
		
		rttr.addFlashAttribute("msg", msg);
		
		if(qnaIns >0 && qnaDetailIns > 0) {
			
			return "redirect:qna.do";
		}
		
		rttr.addFlashAttribute("msg", "CI");
		return "redirect:qnaWrite.do";
	}
	
	
	@RequestMapping("qnaDetail.do")
	public String qnaDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		QnaModel qnaDetail = qnaMapper.getQnaDetail(paramMap);
		System.out.println(paramMap.get("qna_lv"));
		model.addAttribute("user_id",user_id);
		model.addAttribute("qnaDetail", qnaDetail);
	     
	      return "qna/qnaDetail";
	  }
	
	//qna답변
	@RequestMapping("qnaReply.do")
	public String qnaReply(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		List<QnaModel> qnaReply = qnaMapper.getQnaReply(paramMap);
		String user_id = (String) session.getAttribute("user_id");
		int count = qnaMapper.getQnaReplyCount(paramMap);
		
		model.addAttribute("qnaReply", qnaReply);
		model.addAttribute("user_id",user_id);
		model.addAttribute("count",count);
	      return "qna/qnaReplyGrd";
	  }
	
	//답글등록
	@RequestMapping("qnaReplyInsert.do")
	@ResponseBody
	public List<Integer> qnaReplyInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		paramMap.put("user_id", user_id);
		
		
		int qna_seq = qnaMapper.getQnaSeq(paramMap);
		paramMap.put("qna_seq", qna_seq);
		System.out.println(qna_seq + "qna");
		int qnaReplyInsertDetail = qnaMapper.qnaDetailInsert(paramMap);
		
		
		List<Integer> replyList = new ArrayList<>();
		
		replyList.add(qnaReplyInsertDetail);
		
		
		
	
	      return replyList;
	  }
	
	
}

