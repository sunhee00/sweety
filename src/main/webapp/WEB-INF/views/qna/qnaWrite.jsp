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
	
	
	function fn_qnaInsert() {
		
		//qna패스워드 일치 체크
		if(!fn_pwCheck()) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			return;
		}
		
		//data유효성체크
		if(!fn_nullCheck()) {
			alert("항목을 전부 채워주세요");
			return;
		}
		
		document.form1.action= "${contextPath}/qna/qnaInsert.do";
		document.form1.submit(); //제출
	}
	
	//data 유효성 체크
	function fn_nullCheck() {
		var qna_title = $("#qna_title").val();
		var qna_cont = $("#qna_cont").val();
		var user_id = $("#user_id").val();
		var qna_pw = $("#qna_pw").val();
		var checkArr = []
		checkArr.push(qna_title,qna_cont, user_id, qna_pw);
		for(var i in checkArr) {
			if(checkArr[i] == null || checkArr[i] =="") {
				return false;
			}
		}
	    return true;
	}

	//비밀번호 확인
	function fn_pwCheck(){
		
  		var qna_pw = $("#qna_pw").val();
  		var qna_pw_chk = $("#qna_pw_chk").val();
		if(qna_pw != qna_pw_chk) {
			$("#pwChkArea").html("비밀번호가 일치하지 않습니다.").css("color","red");
			pwOk = false;
		}else {
			pwOk = true;
			$("#pwChkArea").empty();
		}
		return pwOk;
	}
	
	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<h2>Q&A 작성하기</h2>
		<form name="form1" method="post" action="">
		  <div class="form-group">
		    <label for="qna_title">제목:</label>
		    <input type="text" class="form-control" id="qna_title" name="qna_title"  maxlength='50'  placeholder="제목을 입력해주세요.(50자까지)">
		  </div>
		  <div class="form-group">
		    <label for="qna_cont">내용:</label>
		    <textarea class="form-control" id="qna_cont"  name="qna_cont" maxlength='100' placeholder="내용을 입력해주세요.(100자까지)"></textarea>
		    <p id="remain_cont"></p>
		  </div>
		  <div class="form-group">
		    <label for="user_id">아이디:</label>
		    <input type="text" class="form-control" id="user_id" name="user_id" value="${user_id}" readonly>
		    <label for="qna_pw">비밀번호:</label>
		    <input type="password" class="form-control" id="qna_pw" name="qna_pw" onkeyup="fn_pwCheck()" placeholder="게시글 비밀번호">
		    <label for="qna_pw_chk">비밀번호 확인:</label>
		    <input type="password" class="form-control" id="qna_pw_chk" name="qna_pw_chk" onkeyup="fn_pwCheck()" placeholder="게시글 비밀번호 체크">
		    <p id="pwChkArea"></p>
		  </div>
		  <input type="hidden" value="${qna_lv}" id="qna_lv" name="qna_lv">
		  <input type="hidden" value="1" id="qna_seq" name="qna_seq">
		</form>
		<a class="btn btn-info" href="javascript:fn_qnaInsert()">등록하기</a>
		<a class="btn btn-warning" href="${contextPath}/qna/qna.do">취소하기</a>
  	</div>
	
</body>
</html>