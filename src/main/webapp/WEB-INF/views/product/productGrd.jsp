<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<c:if test="${count eq 0}">
	<tr><td colspan="4">제품이 존재하지 않습니다</td></tr>
</c:if>
<c:if test="${count > 0}">
	<c:forEach items="${productList}" var="list">
		<tr>
		  <td>${list.product_no}</td>
	      <td>${list.product_cd}</td>
	      <td>${list.product_name}</td>
	      <td>${list.product_price}</td>
	      <td>${list.product_file}</td>
		</tr>
	</c:forEach>
</c:if>
<input type="hidden" id="totalcnt" name="totalcnt" value="${totalcnt}"/>
