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
				<td>${list.order_shipping_yn}</td>
				<td>${list.order_cancle_yn}</td>
				<td><a href="javascript:fn_orderCancle(${order_no})">취소하기</a></td>
				<td><a href="javascript:fn_orderDetail(${order_no})">상세보기</a></td>
			</tr>
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="count" name="count" value ="${count}"/>
