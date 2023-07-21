<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${count eq 0 }">
		<tr>
			<td colspan="15">장바구니에 상품이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${count > 0 }">
		<c:forEach items="${cm}" var="list" varStatus="lists">
			
				<tr>
					
					<td>${list.product_no}</td>
					<td style="width:10%;"><a href="${contextPath}/product/productDetail.do?product_no=${list.product_no}"><img style="width:100%;" alt="" src="${contextPath}${list.product_file}"></a></td>
					<td>${list.product_name}</td>
					<td>${list.cart_amt}</td>
					<td><fmt:formatNumber value="${list.product_price}" type="number" pattern="#,###" /></td>
					<td ><fmt:formatNumber value="${list.product_price * list.cart_amt}" type="number" pattern="#,###" />
					<input type="hidden" id="price${lists.index}" value="${list.product_price * list.cart_amt}"/>
					</td>
					<td><a href="javascript:fn_cartCancel(${list.product_no})">x</a></td>
				</tr>
			
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="count" name="count" value ="${count}"/>