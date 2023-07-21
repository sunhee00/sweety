<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
	
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${contextPath}">sweety</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li><a href="${contextPath}/product/product.do?product_cd=S">과자</a></li>
		      <li><a href="${contextPath}/product/product.do?product_cd=D">음료수</a></li>
		      <li><a href="${contextPath}/product/product.do?product_cd=I">아이스크림</a></li>
		      <li><a href="${contextPath}/product/product.do?product_cd=C">사탕/초콜릿</a></li>
		    </ul>
		    <c:if test="${user_name eq null}">
			    <ul class="nav navbar-nav navbar-right">
			    	<li><a href="#"><span class="glyphicon glyphicon-question-sign"></span> Q&A</a></li>
			      	<li><a href="${contextPath}/notice/notice.do"><span class="glyphicon glyphicon-blackboard"></span> Notice</a></li>
			      	<li><a href="${contextPath}/member/join.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      	<li><a href="${contextPath}/member/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			    </ul>
		    </c:if>
		    <!-- 로그인 했을 시 -->
		    <c:if test="${user_name ne null}">
			    <ul class="nav navbar-nav navbar-right">
			    	<li><a><span style="font-weight:900; color:blue;">${user_name}</span>님 환영합니다</a></li>
			    	<li><a href="#"><span class="glyphicon glyphicon-question-sign"></span> Q&A</a></li>
			      	<li><a href="${contextPath}/notice/notice.do"><span class="glyphicon glyphicon-blackboard"></span> Notice</a></li>
					<li><a href="${contextPath}/cart/cart.do"><span class="glyphicon glyphicon-shopping-cart"></span>장바구니</a></li>
					<li><a href="${contextPath}/member/myPage.do"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
					<li><a href="${contextPath}/member/logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			    </ul>
		    </c:if>
		  </div>
		  
		</nav>
	
	
</body>
</html>