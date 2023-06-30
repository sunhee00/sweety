<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="${contextPath}">sweety</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="#">과자</a></li>
	      <li><a href="#">음료수</a></li>
	      <li><a href="#">아이스크림</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    <li><a href="#"><span class="glyphicon glyphicon-question-sign"></span> Q&A</a></li>
	      <li><a href="${contextPath}/notice/notice.do"><span class="glyphicon glyphicon-blackboard"></span> Notice</a></li>
	      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	      <li><a href="${contextPath}/login/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	    </ul>
	    <!-- 로그인 했을 시 -->
	    <ul class="nav navbar-nav navbar-right" style="display:none;">
	      <li><a href="#"><span class="glyphicon"></span>장바구니</a></li>
	      <li><a href="#"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
	      <li><a href="${contextPath}/login/login.do"><span class="glyphicon glyphicon-log-out"></span> Login</a></li>
	    </ul>
	  </div>
	</nav>
	  
	<div class="container">
	  
	</div>
</body>
</html>