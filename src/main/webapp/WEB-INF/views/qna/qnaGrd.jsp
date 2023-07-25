<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${count eq 0}">
	<tr><td colspan="4">게시글이 존재하지 않습니다</td></tr>
</c:if>
<c:if test="${count > 0}">
	<c:forEach items="${qnaList}" var="list">
		<tr onclick="fn_goQnaDetail(${list.qna_no},${list.qna_lv},${list.qna_seq})">
		  <td>
		  <c:if test="${list.qna_lv > 1}">ㄴ</c:if>
		  ${list.qna_no}</td>
	      <td>${list.qna_title}</td>
	      <td>${list.user_id}</td>
	      <td>${list.qna_date}</td>
		</tr>
	</c:forEach>
</c:if>
<input type="hidden" id="count" name="count" value="${count}"/>
