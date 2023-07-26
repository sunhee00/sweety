package kr.sunny.sweety.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import kr.sunny.sweety.notice.entity.NoticeModel;


@Mapper
public interface NoticeMapper {
	//공지사항 list
	public List<NoticeModel> noticeList(Map<String, Object> paramMap);
	//공지사항 list 총 개수
	public int countNoticeList(Map<String, Object> paramMap);
	//공지사항 게시글 Detail
	public NoticeModel getNoticeDetail(Map<String, Object> paramMap);
	//게시글 번호 따오기
	public int noticeInsertNo(Map<String, Object> paramMap);
	//게시글 insert
	public int noticeInsert(Map<String, Object> paramMap);
	//게시글 update
	public int noticeUpdate(Map<String, Object> paramMap);
	//게시글 삭제(update)
	public int noticeDelete(Map<String, Object> paramMap);
}
