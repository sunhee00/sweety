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
<title>공지사항</title>
<script type="text/javascript">
	//페이징 설정
	var pageSize = 10; //한페이지당 게시글 수
	var pageBlockSize = 5; //페이징 블록
	
	//onload
	$(function () {
		fn_noticeList();
		
	});
	
	//noticelist 뿌려주기
	function fn_noticeList(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				pageSize : pageSize,
				pageBlockSize : pageBlockSize,
				pageNum : pagenum
		}
		var listCallback = function (reval) {
			$("#notice_tbody").empty().append(reval);
			var totalcnt = $("#totalcnt").val();
			var pagination = fn_pagination(pageSize, pageBlockSize, totalcnt, pagenum, "fn_noticeList");
			console.log(pageSize+","+ pageBlockSize+","+  totalcnt+","+  pagenum)
			$("#pagination").empty().append(pagination);
		}
		fn_callAjax("noticeList.do","post",false,param,"text",listCallback);
		
	}
	
		


	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="panel panel-default">
	    <div class="panel-heading">BOARD</div>
	    <div class="panel-body" id="view">Panel Content</div>
	    <div class="panel-body" id="wform" tyle="display:none">
			  <h2>Striped Rows</h2>
			  <p>The .table-striped class adds zebra-stripes to a table:</p>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>내용</th>
			        <th>작성자</th>
			        <th>작성일자</th>
			      </tr>
			    </thead>
			    <tbody id="notice_tbody"></tbody>
			  </table>
		</div>
		<div id="pagination"  style="text-align:center;"></div>
    	<div class="panel-footer"></div>
	</div>
  </div>
	
</body>
</html>