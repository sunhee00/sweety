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
<title>상품정보</title>
<script type="text/javascript">
	//페이징 설정
	var pageSize = 9; //한페이지당 게시글 수
	var pageBlockSize = 5; //페이징 블록
	
	//onload
	$(function () {
		fn_product();
		
	});
	
	
	function fn_product(pagenum) {
		pagenum = pagenum || 1;
		
		var param = {
				pageSize : pageSize,
				pageBlockSize : pageBlockSize,
				pageNum : pagenum,
				product_cd : $("#product_cd").val()
		}

		var productListCallback = function (reval) {
			console.log(reval);
			var rowMax = 3;
			var productHtml="";
			var pl = null;
			if(reval != null) {
				pl = reval.pl;
				
				for(var i=0; i<((pl.length/rowMax)+1); i++) {
					productHtml+="<div>";
					//한 행당 시작과 끝의 index번호
					var sIndex = i*rowMax;
					var eIndex = sIndex+rowMax;
					eIndex = eIndex>pl.length-1?pl.length:eIndex;
					for(var j=sIndex; j<eIndex; j++) {
						productHtml+="<input type='hidden' class='product_no' value='"+pl[j].product_no+"'/>";
						productHtml+="<div class='items'>";
						productHtml+="<a style='height:100%; margin:auto 0;' href='${contextPath}/product/productDetail.do?product_no="+pl[j].product_no+"'>"
						productHtml+="<p class='itemAttr' style='height:80%;'><img style='width:100%; height:100%;' src='${contextPath}"+pl[j].product_file+"'/></p>"
						productHtml+="<p class='itemAttr' style='height:10%;'>"+pl[j].product_name+"</p>"
						productHtml+="<p class='itemAttr' style='height:10%;'>"+pl[j].product_price+"원</p>"
						productHtml+="</a>"
						productHtml+="</div>"
					}
					productHtml+="</div>";
				}
				
				
				
				$("#productArea").empty().append(productHtml);
				
				
			}
		}
		fn_callAjax("productList.do","post",false,param,"json", productListCallback);
	}
	
		


	
</script>
</head>
<body>
	<input type="hidden" value="${product_cd}" id="product_cd" name="product_cd"/>	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<h2 style="width:60%; margin:30px auto;">
			<c:if test="${product_cd eq 'S'}">과자</c:if>
			<c:if test="${product_cd eq 'C'}">사탕/초콜릿</c:if>
			<c:if test="${product_cd eq 'D'}">음료수</c:if>
			<c:if test="${product_cd eq 'I'}">아이스크림</c:if>
		</h2>
		<div id="productArea" style="width:60%; margin:0 auto; display:flex;"></div>
  </div>
	
</body>
</html>