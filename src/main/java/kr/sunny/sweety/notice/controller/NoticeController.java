package kr.sunny.sweety.notice.controller;



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


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@RequestMapping("notice.do")
	public String notice(Model model, HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("user_id",user_id);
		
		return "notice/notice";
	}
	
	//공지사항 리스트
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      int pagenum = Integer.parseInt((String) paramMap.get("pageNum"));
	      int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
	      int pageindex = (pagenum - 1) * pageSize;
	      
	      paramMap.put("pageSize", pageSize);
	      paramMap.put("pageindex", pageindex);
	      
	      // Controller  Service  Dao  SQL
	      List<NoticeModel> noticeList = noticeMapper.noticeList(paramMap);
	      int totalcnt = noticeMapper.countNoticeList(paramMap);
	      
	      model.addAttribute("noticeList", noticeList);
	      model.addAttribute("totalcnt", totalcnt);
	      
	      System.out.println("실행!!!!!!!!!!!!!");

	      return "notice/noticeGrd";
	   }
	
	//공지사항 게시글 조회
	@RequestMapping("noticeDetail.do")
	public String qnaDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		
		NoticeModel noticeDetail = noticeMapper.getNoticeDetail(paramMap);
		
		
		model.addAttribute("user_id",user_id);
		model.addAttribute("noticeDetail", noticeDetail);
	     
	      return "notice/noticeDetail";
	  }
	
	//notice 게시글 작성/수정
	@RequestMapping("noticeWrite.do")
	public String qnaWrite(Model model, @RequestParam Map<String, Object> paramMap,HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		NoticeModel noticeDetail = null;
		
	
		
		//noticeDetail.jsp에서 수정하기 누를 시.
		if(!paramMap.isEmpty() && paramMap != null) {
			
			noticeDetail = noticeMapper.getNoticeDetail(paramMap);
			model.addAttribute("noticeDetail", noticeDetail);
			System.out.println(noticeDetail);
		}
		
	     
	      return "notice/noticeWrite";
	  }
	
	//게시글 등록
	@RequestMapping("noticeInsert.do")
	public String qnaInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		//경로 직접쳐서 들어왔을 때
		if(paramMap.isEmpty()) {
			return "redirect:noticeWrite.do";
		}
		
		//insert인지 update인지 구분
		String noticeType = (String)paramMap.get("noticeType");
		
		System.out.println(noticeType);
		//로그인 session
		String user_id = (String) session.getAttribute("user_id");
		paramMap.put("user_id", user_id);
		
		//tb_notice insert반환값
		int noticeIns = 0;
		
		
		//새 notice게시글 insert
		if(noticeType.equals("I")) {
			int notice_no = noticeMapper.noticeInsertNo(paramMap);
			paramMap.put("notice_no", notice_no);
			System.out.println(notice_no);
			noticeIns = noticeMapper.noticeInsert(paramMap);
		}
		
		//기존 qna게시글 update
		if(noticeType.equals("U")){
			noticeIns = noticeMapper.noticeUpdate(paramMap);
		}
		
		
		
		String msg = "";
		if(noticeIns > 0) {
			
			msg = noticeType;
			
			rttr.addFlashAttribute("msg", msg);
			return "redirect:notice.do";
		}
		
		msg = "CI";
		rttr.addFlashAttribute("msg", msg);
		return "redirect:noticeWrite.do";
	}
	
	//notice 게시글 삭제
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(Model model, @RequestParam Map<String, Object> paramMap,HttpServletRequest request,
	         HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		String msg = "";
		//경로 직접치기 방지
		if(!paramMap.isEmpty()) {
			int noticeDel = noticeMapper.noticeDelete(paramMap);
			
			if(noticeDel > 0) {
				msg = "D";
			}else {
				msg = "CD";
			}
			
		}
		
		
		rttr.addFlashAttribute("msg", msg);
		
	    return "redirect:notice.do";
	  }
	
}

