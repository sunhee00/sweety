<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
<title>Q&A</title>
<script type="text/javascript">
	
	//onload
	$(function () {
		
	});
	
	//qna insert
	function fn_noticeInsert(notice_no) {
		
		var nt = 'I';
		

		
		//data유효성체크
		if(!fn_nullCheck()) {
			alert("항목을 전부 채워주세요");
			return;
		}
		//기존에 작성된 글 수정시에
		if(notice_no != "" && notice_no != null) {
			nt = "U";
		}
		
		//새 게시글 insert인지 기존 게시글 update인지 구분
		var noticeType;
		noticeType = document.createElement('input');
		noticeType.setAttribute('type', 'hidden');
		noticeType.setAttribute('name', 'noticeType');
		noticeType.setAttribute('value', nt);
		
		document.form1.appendChild(noticeType);

		document.form1.action= "${contextPath}/notice/noticeInsert.do";
		document.form1.submit(); //제출
	}
	
	//data 유효성 체크
	function fn_nullCheck() {
		var notice_title = $("#notice_title").val();
		var notice_cont = $("#notice_cont").val();
		var notice_writer = $("#notice_writer").val();
		var checkArr = []
		checkArr.push(notice_title,notice_cont, notice_writer);
		for(var i in checkArr) {
			if(checkArr[i] == null || checkArr[i] =="") {
				return false;
			}
		}
	    return true;
	}

	
	
	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<h2>공지사항 작성하기</h2>
		<form name="form1" method="post" action="">
		  <div class="form-group">
		    <label for="qna_title">제목:</label>
		    <input type="text" class="form-control" id="notice_title" name="notice_title"  value="${noticeDetail.notice_title}" maxlength='50'  placeholder="제목을 입력해주세요.(50자까지)">
		  </div>
		  <div class="form-group">
		    <label for="qna_cont">내용:</label>
		    <textarea class="form-control" id="notice_cont"  name="notice_cont"  maxlength='100' placeholder="내용을 입력해주세요.(100자까지)">${noticeDetail.notice_cont}</textarea>
		    
		  </div>
		  <div class="form-group">
		    <label for="notice_writer">작성자:</label>
		    <input type="text" class="form-control" id="notice_writer" name="notice_writer" value="${noticeDetail.notice_writer}">
		    <input type="hidden" id="notice_no" name="notice_no" value="${noticeDetail.notice_no}">
		  </div>
		  
		</form>
		<a class="btn btn-info" href="javascript:fn_noticeInsert(${noticeDetail.notice_no})">등록하기</a>
		<a class="btn btn-warning" href="${contextPath}/notice/notice.do">취소하기</a>
  	</div>
	
</body>
</html>