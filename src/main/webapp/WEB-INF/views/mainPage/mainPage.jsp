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
<title>Sweety</title>
<style>
	* {
		box-sizing: border-box;
	}
	.items {
	 	text-align:center;
	 	border:solid;
	}
	.itemAttr {
		margin:auto 0;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		fn_mainProduct();
	});
	
	//메인페이지 제품리스트
	function fn_mainProduct() {
		var param = {};
		var listCallback = function (reval) {
			var newProductHtml="";
			if(reval != null) {
				console.log(reval);
				for(var list in reval) {
					console.log(reval[list]);
					newProductHtml+="<input type='hidden' class='product_no' value='"+reval[list].product_no+"'/>";
					newProductHtml+="<div class='items'>";
					newProductHtml+="<a style='height:100%; margin:auto 0;' href='${contextPath}/product/productDetail.do?product_no="+reval[list].product_no+"'>"
					newProductHtml+="<p class='itemAttr' style='height:80%;'><img style='width:100%; height:100%;' src='${contextPath}"+reval[list].product_file+"'/></p>"
					newProductHtml+="<p class='itemAttr' style='height:10%;'>"+reval[list].product_name+"</p>"
					newProductHtml+="<p class='itemAttr' style='height:10%;'>"+reval[list].product_price+"원</p>"
					newProductHtml+="</a>"
					newProductHtml+="</div>"
				}
				$("#productArea").empty().append(newProductHtml);
				
				
			}
		}
		fn_callAjax("mainProduct.do","post",false,param,"json", listCallback);
	}
	
	
</script>
</head>
<body>
	

	<div class="container">
	<%-- header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<h2 style="width:60%; margin:30px auto;">신제품</h2>
		<div id="productArea" style="width:60%; margin:0 auto; display:grid; grid-template-columns: 1fr 1fr 1fr""></div>
		
		
	</div>
	
</body>
</html>