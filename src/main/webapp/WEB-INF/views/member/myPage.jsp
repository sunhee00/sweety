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
	var pwOk;
	
	$(function () {
		
	});
	
	
	//주문정보 상세페이지로
	function fn_goOdSitu(order_shipping_yn) {
		window.location.href="${contextPath}/member/orderSituation.do?order_shipping_yn=" + order_shipping_yn;
	}
	//회원정보 수정
	function fn_myInfoUpdate() {
		var param = {}
		var myInfoVal = function (reval) {
			console.log(reval);
			$("#myInfoArea").empty().append(reval);
		}
		fn_callAjax("myPageInfoForm.do","post",false,param,"text", myInfoVal);
	}
	
	//우편번호 찾기
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
	//비밀번호 확인
	function fn_pwCheck(){
		
  		var user_pw = $("#user_pw_new").val();
  		var user_pw_check = $("#user_pw_new_check").val();
		if(user_pw != user_pw_check) {
			$("#pw_alert").html("비밀번호가 서로 일치하지 않습니다.");
			pwOk = false;
		}else {
			$("#pw_alert").html("");
			pwOk = true;
		}
	  	console.log("pwOk:"+pwOk);
	}
	
	//input 공백체크
	function fn_nullCheck() {
		var user_id = $("#user_id").val().trim();
		var user_pw = $("#user_pw_new").val().trim();
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
		
			if(pwOk == false) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			fn_memberUpdate();
		}
		
	}
	//회원정보수정
	function fn_memberUpdate() {
		var param = {
				user_id : $("#user_id").val().trim(),
				user_pw : $("#user_pw_new").val().trim(),
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
		
		var updateCallback = function (reval) {
			if(reval > 0) {
				alert("정보 수정 성공");
				$("#myInfoArea").empty();
				
			}else {
				alert("정보 수정 실패");
			}
			
		}
		
		fn_callAjax("myPageUpdate.do","post",false,param,"json",updateCallback);
	}
	//회원정보창 닫기
	function fn_cancel() {
		$("#myInfoArea").empty();
	}
	
	
</script>
</head>
<body>
<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<div class="btn-group btn-group-justified">
			  <a href="javascript:fn_goOdSitu('O')" class="btn btn-default"><div>주문완료</div><div id="od_com">${od_com_count}</div></a>	
			  <a href="javascript:fn_goOdSitu('D')" class="btn btn-default"><div>배송중</div><div id="sp_du">${sp_du_count}</div></a>
			  <a href="javascript:fn_goOdSitu('C')" class="btn btn-default"><div>배송완료</div><div id="sp_com">${sp_com_count}</div></a>
			</div>
			<a href="javascript:fn_myInfoUpdate()" class="btn btn-info">내 정보 수정</a>
			<div id="myInfoArea" style="width:60%; margin:0 auto;"></div>
		</div>
		<div style="width:60%; margin:3% auto;">
			
		</div>
		
</div>




</body>
</html>