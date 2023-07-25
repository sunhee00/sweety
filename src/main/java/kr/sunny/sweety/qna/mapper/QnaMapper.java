package kr.sunny.sweety.qna.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import kr.sunny.sweety.notice.entity.NoticeModel;
import kr.sunny.sweety.qna.entity.QnaModel;


@Mapper
public interface QnaMapper {
	//qna list
	public List<QnaModel> qnaList(Map<String, Object> paramMap);
	//qna list 총 개수
	public int countQnaList(Map<String, Object> paramMap);
	
	//insert to qna table 
	public int qnaInsertNo(Map<String, Object> paramMap);
	public int qnaInsert(Map<String, Object> paramMap);
	public int qnaDetailInsert(Map<String, Object> paramMap);
	public int qnaUpdate(Map<String, Object> paramMap);
	public int qnaDetailUpdate(Map<String, Object> paramMap);
	//qna 게시글 상세조회
	public QnaModel getQnaDetail(Map<String, Object> paramMap);
	//qna 답글 불러오기
	public List<QnaModel> getQnaReply(Map<String, Object> paramMap);
	
	//qna 답글 번호(qna_seq) 불러오기
	public int getQnaSeq(Map<String, Object> paramMap);
	//reply 개수 가져오기
	public int getQnaReplyCount(Map<String, Object> paramMap);
}
