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
	
	
	//notice게시글 update
	function fn_goUpdate(noticeNo) {
		var notice_no;
		notice_no = document.createElement('input');
		notice_no.setAttribute('type', 'hidden');
		notice_no.setAttribute('name', 'notice_no');
		notice_no.setAttribute('value', noticeNo);
		
		document.form1.appendChild(notice_no);
		
		document.form1.action = "${contextPath}/notice/noticeWrite.do";
		document.form1.submit();
		
	}
	
	function fn_goDelete(noticeNo) {
		
		var notice_no;
		notice_no = document.createElement('input');
		notice_no.setAttribute('type', 'hidden');
		notice_no.setAttribute('name', 'notice_no');
		notice_no.setAttribute('value', noticeNo);
		
		document.form1.appendChild(notice_no);
		
		document.form1.action = "${contextPath}/notice/noticeDelete.do";
		document.form1.submit();
	}
	
	


	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<form name="form1" method="post">
			  <div>
			    <div><p id="notice_title">제목: ${noticeDetail.notice_title}</p></div>
			    <div><p><span>${noticeDetail.notice_no}</span><span id="user_id">작성자: ${noticeDetail.user_id}</span></p><p><span id="notice_date" name="notice_date">작성날짜: ${noticeDetail.notice_date}</span></p></div>
			    <div><p id="notice_cont" name="notice_cont">${noticeDetail.notice_cont}</p></div>
			    <div>
			    <c:if test="${user_id eq 'admin'}">
			    	<a class="btn btn-info" href="javascript:fn_goUpdate(${noticeDetail.notice_no})">수정하기</a>
			    	<a class="btn btn-info" href="javascript:fn_goDelete(${noticeDetail.notice_no})">삭제하기</a>
			    </c:if>
			    	<a class="btn btn-info" href="${contextPath}/notice/notice.do">뒤로가기</a>
			    </div>
			  </div>
			</form>
			
			
				
			
		</div>
  	</div>
	
</body>
</html>