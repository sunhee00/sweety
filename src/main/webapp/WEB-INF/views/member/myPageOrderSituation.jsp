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
	//페이징 설정
	var pageSize = 10; //한페이지당 게시글 수
	var pageBlockSize = 5; //페이징 블록
	

	
	$(function () {
		
		//리스트로딩
		fn_orderSituationList();
		
	
	});
	
	//주문목록 리스트
	function fn_orderSituationList(pagenum) {
		pagenum = pagenum||1;
		var param = {
				order_shipping_yn : $("#order_shipping_yn").val()
				
				
		}
		var osListCallback = function (reval) {
			console.log(reval);
			$("#order_tbody").empty().append(reval);
			
			//pagination
			var count = $("#count").val();
			var pagination = fn_pagination(pageSize, pageBlockSize, count, pagenum, "fn_orderSituationList");
			$("#pagination").empty().append(pagination);
		}
		fn_callAjax("orderSituationList.do","post",false,param,"text", osListCallback);
	}
	
	//주문 취소
	function fn_orderCancel(order_no) {
		var param = {
				order_no : order_no
		}
		var cancelCallback = function (reval) {
			if(reval == 1) {
				alert("주문이 취소되었습니다");

			}else {
				alert("주문취소 실패");
			}
			fn_orderSituationList();
			
		}
		fn_callAjax("orderCancel.do","post",false,param,"json", cancelCallback);
	}
	
	
	

	
	
</script>
</head>
<body>
<input type="hidden" value="${order_shipping_yn}" id="order_shipping_yn"/>
<div class="container" >
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="empSamList">
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>주문번호</th>
		        <th>주문가격</th>
		        <th>주문일자</th>
		        <th>배송상태</th>
		        <th>취소신청</th>
		        <th>주문상세</th>
		      </tr>
		    </thead>
		    <tbody id="order_tbody"></tbody>
		 </table>
</div>

	<div class="paging_area"  id="pagination" style="text-align:center;"> </div>
	
</div>




</body>
</html>