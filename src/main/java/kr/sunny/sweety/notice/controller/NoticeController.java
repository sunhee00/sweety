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

import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.notice.mapper.NoticeMapper;


/**
 * Handles requests for the application home page.
 */


@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@RequestMapping("notice.do")
	public String notice() {
		return "notice/notice";
	}
	
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
}

