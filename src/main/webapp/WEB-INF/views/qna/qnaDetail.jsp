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
	
	//qnalist 뿌려주기
	function fn_qnaList(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				pageSize : pageSize,
				pageBlockSize : pageBlockSize,
				pageNum : pagenum
		}
		var qnaListCallback = function (reval) {
			$("#qna_tbody").empty().append(reval);
			var count = $("#count").val();
			var pagination = fn_pagination(pageSize, pageBlockSize, count, pagenum, "fn_qnaList");
			console.log(pageSize+","+ pageBlockSize+","+  count+","+  pagenum)
			$("#pagination").empty().append(pagination);
		}
		fn_callAjax("qnaList.do","post",false,param,"text",qnaListCallback);
		
	}
	
		


	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<h2>Q&A 작성하기</h2>
		<form>
		  <div class="form-group">
		    <label for="user_id">아이디:</label>
		    <input type="text" class="form-control" id="user_id">
		    <label for="user_id">아이디:</label>
		    <input type="text" class="form-control" id="user_id">
		  </div>
		  <div class="form-group">
		    <label for="qna_title">제목:</label>
		    <input type="text" class="form-control" id="qna_title">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="pwd">
		  </div>
		</form>
  	</div>
	
</body>
</html>