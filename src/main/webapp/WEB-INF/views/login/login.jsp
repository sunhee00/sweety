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
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function () {
		
	});
	
	//input 공백체크
	function fn_nullCheck() {
		var user_id = $("#user_id").val().trim();
		var user_pw = $("#user_pw").val().trim();
		if(user_id == null || user_pw == null || user_id == "" || user_pw == "") {
			alert("아이디랑 비번을 입력해주세요.");
		}else {
			loginCheck(user_id, user_pw);
		}
		
	}
	
	
	//로그인체크
	function loginCheck(user_id, user_pw) {
		var param = {
				user_id : user_id,
				user_pw : user_pw
		}
		var loginCheckListCallback = function(reval) {
			
		}
		fn_callAjax("login/loginCheck.do","post",false,param,"text",loginCheckListCallback);
	}
	
	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div>
			<h2>로그인</h2>
			<div class="form-group">
			  <label for="user_id">아이디</label>
			  <input type="text" class="form-control" id="user_id" placeholder="아이디를 입력해 주세요." required>
			</div>
			<div class="form-group">
			  <label for="user_pw">비밀번호</label>
			  <input type="password" class="form-control" id="user_pw" placeholder="비밀번호를 입력해 주세요." required>
			</div>
			<div class="form-group">
				<a href="${contextPath}/joinMem/joinMem.jsp" class="btn btn-info" id="joinButton" name="btn">회원가입</a>
				<a href="javascript:fn_nullCheck()" class="btn btn-primary" id="loginButton" name="btn">로그인</a>
			</div>
		</div>
  	</div>
	
</body>
</html>