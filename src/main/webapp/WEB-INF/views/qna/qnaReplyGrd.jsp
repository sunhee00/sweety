<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:if test="${count > 0}">
	<c:forEach items="${qnaReply}" var="list">
		<div id="reply${list.qna_seq}" style="border:solid;">
		    <div><p>제목: ${list.qna_title}</p></div>
		    <div><p><span>작성자: ${list.user_id}</span></p><p><span>작성날짜: ${list.qna_date}</span></p></div>
		    <div><p>${list.qna_cont}</p></div>
		    <div>
		    <c:if test="${user_id eq list.user_id}">
		    	<a class="btn btn-info" href="javascript:fn_goReplyUpdate(${list.qna_no},${list.qna_seq},${list.qna_lv})">수정하기</a>
		    	<a class="btn btn-info" href="javascript:fn_goDelete(${list.qna_no},${list.qna_seq},${list.qna_lv})">삭제하기</a>
		    </c:if>
		    </div>
		  </div>
		  <input type="hidden" value="${list.qna_seq}" id="qna_seq" name="qna_seq">
		  <input type="hidden" value="${list.qna_lv}" id="qna_lv" name="qna_lv">
	</c:forEach>
</c:if>
<input type="hidden" id="count" name="count" value="${count}"/>
