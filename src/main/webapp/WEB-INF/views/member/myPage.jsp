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
	
	$(function () {
		
	});
	
	
	//주문정보 상세페이지로
	function fn_goOdSitu(order_shipping_yn) {
		
	}
	
	
</script>
</head>
<body>
<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<div class="btn-group btn-group-justified">
			  <a href="${contextPath}/member/orderSituation.do?order_shipping_yn=O" class="btn btn-default"><div>주문완료</div><div id="od_com">--</div></a>	
			  <a href="${contextPath}/member/orderSituation.do?order_shipping_yn=D" class="btn btn-default"><div>배송중</div><div id="sp_du">--</div></a>
			  <a href="${contextPath}/member/orderSituation.do?order_shipping_yn=C" class="btn btn-default"><div>배송완료</div><div id="sp_com">--</div></a>
			</div>
		</div>
		<div style="width:60%; margin:3% auto;">
			<a href="${contextPath}/member/myPageInfoForm.do" class="btn btn-info">내 정보 수정</a>
		</div>
</div>




</body>
</html>