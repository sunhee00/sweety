<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:if test="${count > 0}">
	<c:forEach items="${qnaReply}" var="list">
		<div id="${list.qna_seq}">
		    <div><p>제목: ${list.qna_title}</p></div>
		    <div><p><span>${list.qna_no}</span><span>작성자: ${list.user_id}</span></p><p><span>작성날짜: ${list.qna_date}</span></p></div>
		    <div><p>${list.qna_cont}</p></div>
		    <div>
		    <c:if test="${user_id eq list.user_id}">
		    	<a class="btn btn-info" href="javascript:fn_goReplyUpdate()">수정하기</a>
		    </c:if>
		    </div>
		  </div>
	</c:forEach>
</c:if>
<input type="hidden" id="count" name="count" value="${count}"/>
