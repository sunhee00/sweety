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
				<td>${list.product_no}</td>
				<td style="width:10%;"><img style="width:100%;" alt="" src="${contextPath}${list.product_file}"></td>
				<td>${list.product_name}</td>
				<td>${list.order_date}</td>
				<td>${list.order_detail_amt}</td>
				<td>${list.order_detail_price}</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="count" name="count" value ="${count}"/>
