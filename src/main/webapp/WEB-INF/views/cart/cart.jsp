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
<title>장바구니</title>
<script type="text/javascript">
	//페이징 설정
	var pageSize = 10; //한페이지당 게시글 수
	var pageBlockSize = 5; //페이징 블록
	
	//onload
	$(function () {
		fn_cartList();
		
		
	});
	
	//cart 리스트 뿌려주기
	function fn_cartList(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				pageSize : pageSize,
				pageBlockSize : pageBlockSize,
				pageNum : pagenum
		}
		var cartListCallback = function (reval) {
			//add Grd to body
			$("#cart_tbody").empty().append(reval);
			var count = $("#count").val();
			
			//pagination
			var pagination = fn_pagination(pageSize, pageBlockSize, count, pagenum, "fn_noticeList");
			console.log(pageSize+","+ pageBlockSize+","+  count+","+  pagenum)
			$("#pagination").empty().append(pagination);
			
			//총액계산
			fn_prePay();
			
		}
		fn_callAjax("cartList.do","post",false,param,"text",cartListCallback);
		
	}
	
	//결제예정 가격
	function fn_prePay() {
		var allPrice = 0;
		var count = $("#count").val();
		for(var i=0; i<count; i++) {
			
			allPrice += Number($("#price"+i).val());
		}
		allPrice = allPrice.toLocaleString('ko-KR')
		$("#allPrice").empty().append("총가격: " + allPrice);
	}
	
	//품목 취소하기
	function fn_cartCancel(product_no) {
		var param = {
				product_no : product_no
		}
		var cancelCallback = function(reval) {
			if(reval > 0) {
				alert("상품이 삭제되었습니다.");
				fn_cartList();
			}
			
		}
		fn_callAjax("cartCancel.do","post",false,param,"json",cancelCallback);
		
	}
	

	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<table class="table table-hover" >
			    <thead style="text-align:center">
			      <tr>
			        <th>제품번호</th>
			        <th>사진</th>
			        <th>제품명</th>
			        <th>제품수량</th>
			        <th>제품 가격</th>
			        <th>제품 총 가격</th>
			        <th>삭제</th>
			      </tr>
			    </thead>
			    <tbody id="cart_tbody"></tbody>
			 </table>
			 <div class="paging_area"  id="pagination" style="text-align:center;"></div>
			 <div id="allPrice"></div>
			 <a href="" class="btn btn-info">결제하기</a>
		</div>
		
		
		
		
	  </div>
	
</body>
</html>