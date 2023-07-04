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
		fn_orderSituationList();
	});
	
	function fn_orderSituationList() {
		var param = {
				order_shipping_yn : $("#order_shipping_yn").val()
		}
		var osListCallback = function (reval) {
			console.log(reval);
			$("#order_tbody").empty().append(reval);
		}
		fn_callAjax("orderSituationList.do","post",false,param,"text", osListCallback);
	}
	
</script>
</head>
<body>
<input type="hidden" val="${order_shipping_yn}"/>
<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="empSamList">
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>주문번호</th>
		        <th>제품번호</th>
		        <th>제품명</th>
		        <th>제품가격</th>
		        <th>작성일자</th>
		      </tr>
		    </thead>
		    <tbody id="order_tbody"></tbody>
		 </table>
</div>

	<div class="paging_area"  id="empSamPagination"> </div>
	
</div>




</body>
</html>