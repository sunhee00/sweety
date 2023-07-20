<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<c:if test="${count eq 0 }">
		<tr>
			<td colspan="15">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${count > 0 }">
		<c:forEach items="${om}" var="list">
			<tr>
				<td>${list.order_no}</td>
				<td>${list.order_price}</td>
				<td>${list.order_date}</td>
			<c:if test="${list.order_shipping_yn eq 'O'}">
				<td>주문완료</td>
			</c:if>
			<c:if test="${list.order_shipping_yn eq 'D'}">
				<td>배송중</td>
			</c:if>
			<c:if test="${list.order_shipping_yn eq 'C'}">
				<td>배송완료</td>
			</c:if>
		<c:if test="${list.order_cancel_yn eq 'N'}">
			<c:if test="${list.order_shipping_yn eq 'O'}">
				<td><a href="javascript:fn_orderCancel(${list.order_no})">취소하기</a></td>
			</c:if>
			<c:if test="${list.order_shipping_yn ne 'O'}">
				<td>취소불가</td>
			</c:if>
		</c:if>
		<c:if test="${list.order_cancel_yn eq 'Y'}">
				<td>취소완료</td>
		</c:if>	
			
				<td><a class="btn btn_default" href="${contextPath}/member/orderSituationDetail.do?order_shipping_yn=${list.order_shipping_yn}&order_no=${list.order_no}">상세보기</a></td>
			</tr>
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="count" name="count" value ="${count}"/>
