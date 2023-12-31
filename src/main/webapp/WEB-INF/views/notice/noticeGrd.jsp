<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<c:if test="${totalcnt eq 0}">
	<tr><td colspan="4">게시글이 존재하지 않습니다</td></tr>
</c:if>
<c:if test="${totalcnt > 0}">
	<c:forEach items="${noticeList}" var="list">
		<tr onclick="fn_goNoticeDetail(${list.notice_no})">
		  <td>${list.notice_no}</td>
	      <td>${list.notice_title}</td>
	      <td>${list.notice_cont}</td>
	      <td>${list.notice_writer}</td>
	      <td>${list.notice_date}</td>
		</tr>
	</c:forEach>
</c:if>
<input type="hidden" id="totalcnt" name="totalcnt" value="${totalcnt}"/>
