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
<title>${pdm.product_name}</title>
<script type="text/javascript">
	
	
	//onload
	$(function () {
		
		
	});
	
	//장바구니에 담는 함수
	function fn_intoCart(userId) {	
		var param = {
				user_id: userId,
				product_no : $("#product_no").val(),
				pAmt : $("#pAmt").val()
		}
		
		var cartCallback = function (reval) {
			if(reval > 0) {
				if(confirm("장바구니 담기 성공! 장바구니로 이동하시겠습니까?")){
					window.location.href = "${contextPath}/cart/cart.do";
				}else {
					$("#pAmt").val("");
					return;
				}
			}
		}
		fn_callAjax("intoCart.do","post",false,param,"json", cartCallback);
	}
	
	//데이터 유효성 체크
	function fn_dataCheck(userId) {
		//변수
		var pAmt = $("#pAmt").val();
		var maxAmt = 100;
		
		if(userId == null || userId == "") {
			alert("로그인 후 장바구니를 이용할 수 있습니다.");
			window.location.href = "${contextPath}/member/login.do";
			return;
		}
		if(pAmt > 0 && pAmt <= maxAmt) {
			fn_intoCart(userId);
		}else {
			alert("정확한 수량을 입력해 주세요. 1-" + maxAmt + "개까지 주문 가능합니다.")
		}
	}
	
		


	
</script>
</head>
<body>
	<input type="hidden" name="product_no" id="product_no" value="${pdm.product_no}"/>
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="panel panel-default" style="width:60%; margin:0 auto;">
	    <div><img src="${contextPath}${pdm.product_file}"/></div>
	    <div><p>${pdm.product_name}</p></div>
	    <div>${pdm.product_price}</div>
	    <div><input type="number" name="pAmt" id="pAmt" value="0"/></div>
	    <div>${pdm.product_memo}</div>
	    <div><a href="javascript:fn_dataCheck('${user_id}')" class="btn btn-default">장바구니</a><a href="javascript:fn_goPay();" class="btn ">구매하기</a></div>	
	</div>
  </div>
	
</body>
</html>