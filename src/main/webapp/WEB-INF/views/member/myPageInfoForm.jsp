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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>내 정보</title>
<script type="text/javascript">
	var pwCheck = false;
	$(function () {
		
	});
	
	
	//정보 불러오기 
	function pwCheck() {
		var param = {
				
		};
		var myInfoCallback = function (reval) {
			
		}
		fn_callAjax("myPageInfo.do","post",false,param,"json",joinCallback);
	}
</script>
</head>
<body>
<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		
		<div style="width:60%; margin:0 auto;">
			<h2>내 정보</h2>
			<form>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input id="user_id" type="text" class="form-control" name="user_id" readonly/>
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				  <input id="user_pw_new" type="password" class="form-control" name="user_pw_new" onkeyup="fn_pwCheck()" placeholder="변경비밀번호"/>
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
				  <input id="user_pw_new_check" type="password" class="form-control" name="user_pw_new_check"  onkeyup="fn_pwCheck()" placeholder="변경비밀번호확인"/>
				  <span id="pw_alert" class="form-control" name="pw_alert"></span>
				</div>
				<div class="input-group">
				  <span class="input-group-addon">이름</span>
				  <input id="user_name" type="text" class="form-control" name="user_name" placeholder="이름"/>
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
				  <input id="user_email" type="email" class="form-control" name="user_email" placeholder="이메일"/>
				</div>
				<div class="input-group" >
				  <span class="input-group-addon">주소</span>
				  <input id="user_zip" type="number" class="form-control" name="user_zip" placeholder="우편번호" readonly/>
				  <a href="javascript:fn_getZip();" class="btn btn-default" id="search_zip" name="btn">우편번호 검색</a>
				  <input id="user_addr" type="text" class="form-control" name="user_addr" placeholder="주소" readonly/>
				  <input id="user_addr_detail" type="text" class="form-control" name="user_addr_detail" placeholder="상세주소"/>
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></i></span>
				  <div style="display:inline-block; margin: auto 0;">
					  <input id="user_tel1" type="number" class="form-control" name="user_tel1" style="width:20%"/>
					  <span class="form-control" style="width:5%">-</span>
					  <input id="user_tel2" type="number" class="form-control" name="user_tel2" style="width:20%"/>
					  <span class="form-control" style="width:5%">-</span>
					  <input id="user_tel3" type="number" class="form-control" name="user_tel3" style="width:20%"/>
				  </div>
				  
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon">생일</span>
				  <input id="user_birth" type="date" class="form-control" name="user_birth"/>
				</div>
				<a href="javascript:fn_nullCheck();" class="btn btn-info" id="joinButton" name="btn">회원가입</a>
			</form>
		</div>
  	</div>
</body>
</html>