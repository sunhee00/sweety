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
<title>회원가입</title>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>
<script type="text/javascript">
	
	var idOk = false;
	var pwOk = false;
	
	
	function fn_getZip() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_zip').value = data.zonecode;
                document.getElementById("user_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_addr_detail").focus();
            }
        }).open();
    }
	//input 공백체크
	function fn_nullCheck() {
		var user_id = $("#user_id").val().trim();
		var user_pw = $("#user_pw").val().trim();
		var user_name = $("#user_name").val().trim();
		var user_email = $("#user_email").val().trim();
		var user_zip = $("#user_zip").val().trim();
		var user_addr = $("#user_addr").val();
		var user_addr_detail = $("#user_addr_detail").val();
		var user_tel1 = $("#user_tel1").val();
		var user_tel2 = $("#user_tel2").val();
		var user_tel3 = $("#user_tel3").val();
		var user_birth = $("#user_birth").val();
		if(user_id == null || user_pw == null || user_name == null || user_email == null || user_zip == null || user_addr == null || 
			user_addr_detail == null || user_tel1 == null || user_tel2 == null || user_tel3 == null || user_birth == null ||
			user_id == "" || user_pw == "" || user_name == "" || user_email == "" || user_zip == "" || user_addr == "" || 
			user_addr_detail == "" || user_tel1 == "" || user_tel2 == "" || user_tel3 == "" || user_birth == "") {
			alert("모든 항복을 입력해주세요.");
		}else {
			if(idOk == false) {
				alert("아이디 중복체크를 해주세요");
			}
			if(pwOk == false) {
				alert("비밀번호가 일치하지 않습니다");
			}
			if(idOk && pwOk) {
				fn_memberJoin();
			}
		}
		
	}
	//회원가입
	function fn_memberJoin() {
		var param = {
				user_id : $("#user_id").val().trim(),
				user_pw : $("#user_pw").val().trim(),
				user_name : $("#user_name").val().trim(),
				user_email : $("#user_email").val().trim(),
				user_zip : $("#user_zip").val().trim(),
				user_addr : $("#user_addr").val(),
				user_addr_detail : $("#user_addr_detail").val(),
				user_tel1 : $("#user_tel1").val(),
				user_tel2 : $("#user_tel2").val(),
				user_tel3 : $("#user_tel3").val(),
				user_birth : $("#user_birth").val()
		}
		
		var joinCallback = function (reval) {
			if(reval == 1) {
				alert("회원가입 성공");
				window.location.href="${contextPath}";
			}else {
				alert("회원가입 실패");
			}
			
		}
		
		fn_callAjax("memJoin.do","post",false,param,"json",joinCallback);
	}
	
	
	//아이디 중복체크
	function fn_idCheck() {
		var user_id = $("#user_id").val();
		if(user_id == null || user_id == "" || user_id.length < 12 || user_id.length > 14) {
			alert("사용할 아이디를 제대로 입력해주세요. 아이디는 12-14자리로 가능합니다");
		}else {
			var param = {
					user_id : user_id
				}
				var idCheckCallback = function (reval) {
					if(reval == 1) {
						alert("사용 불가능한 아이디입니다.");
						idOk = false;
					}else {
						alert("사용 가능한 아이디입니다");
						idOk = true;
					}
					console.log("idOk:" + idOk);
				}
				fn_callAjax("idCheck.do","post",false,param,"json",idCheckCallback);
		}
		
		
	}
	
	//비밀번호 확인
	function fn_pwCheck(){
		
  		var user_pw = $("#user_pw").val();
  		var user_pw_check = $("#user_pw_check").val();
		if(user_pw != user_pw_check) {
			$("#pw_alert").html("비밀번호가 서로 일치하지 않습니다.");
			pwOk = false;
		}else {
			$("#pw_alert").html("");
			pwOk = true;
		}
	  	console.log("pwOk:"+pwOk);
	}
</script>
</head>
<body>
	
	
	
	<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<h2>회원가입</h2>
			<form>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input id="user_id" type="text" class="form-control" name="user_id" placeholder="아이디(12-14자리)"/>
				  <a href="javascript:fn_idCheck();" class="btn btn-default" id="search_id" name="btn">아이디중복체크</a>
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				  <input id="user_pw" type="password" class="form-control" name="user_pw" onkeyup="fn_pwCheck()" placeholder="비밀번호"/>
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
				  <input id="user_pw_check" type="password" class="form-control" name="user_pw_check"  onkeyup="fn_pwCheck()" placeholder="비밀번호확인"/>
				  <span id="pw_alert" class="form-control" name="pw_alert" style="color:red;"></span>
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