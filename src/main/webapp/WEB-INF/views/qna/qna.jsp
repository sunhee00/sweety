<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
<title>Q&A</title>
<script type="text/javascript">
	//페이징 설정
	var pageSize = 10; //한페이지당 게시글 수
	var pageBlockSize = 5; //페이징 블록
	
	
	//onload
	$(function () {
		fn_qnaList();
		fn_delCheck();
	});
	
	//게시글 상태 확인
	function fn_delCheck() {
		var msg = $("#msg").val();
		switch(msg){
			
			case 'U':
				alert('게시글 수정완료');
				break;
			case 'I':
				alert('게시글 작성완료');
				break;
			case 'L':
				alert('로그인 후 문의해주세요');
				break;
			case 'CI':
				alert('게시글 등록/수정 실패');
				break;
		}
	}
	
	//qnalist 뿌려주기
	function fn_qnaList(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				pageSize : pageSize,
				pageBlockSize : pageBlockSize,
				pageNum : pagenum
		}
		var qnaListCallback = function (reval) {
			$("#qna_tbody").empty().append(reval);
			var count = $("#count").val();
			var pagination = fn_pagination(pageSize, pageBlockSize, count, pagenum, "fn_qnaList");
			console.log(pageSize+","+ pageBlockSize+","+  count+","+  pagenum)
			$("#pagination").empty().append(pagination);
		}
		fn_callAjax("qnaList.do","post",false,param,"text",qnaListCallback);
		
	}
	
	function fn_goQnaDetail(qnaNo,qnaLv,qnaSeq) {
		
		var qna_no;
		var qna_lv;
		var qna_seq;
		var f = document.createElement('form');
	    
		
		
		
			
		qna_no = document.createElement('input');
		qna_no.setAttribute('type', 'hidden');
		qna_no.setAttribute('name', 'qna_no');
		qna_no.setAttribute('value', qnaNo);
		f.appendChild(qna_no);
		
		qna_lv = document.createElement('input');
		qna_lv.setAttribute('type', 'hidden');
		qna_lv.setAttribute('name', 'qna_lv');
		qna_lv.setAttribute('value', qnaLv);
		f.appendChild(qna_lv);
		
		qna_seq = document.createElement('input');
		qna_seq.setAttribute('type', 'hidden');
		qna_seq.setAttribute('name', 'qna_seq');
		qna_seq.setAttribute('value', qnaSeq);
		f.appendChild(qna_seq);
		
	    
	    
	    f.setAttribute('method', 'post');
	   	f.setAttribute('action', '${contextPath}/qna/qnaDetail.do');
	    document.body.appendChild(f);
	    f.submit();
	}
	
		


	
</script>
</head>
<body>
	
	<input type="hidden" value="${msg}" id="msg">
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="panel panel-default">
	    <div class="panel-heading">BOARD</div>
	    <div class="panel-body" id="view">Panel Content</div>
	    <div class="panel-body" id="wform" tyle="display:none">
			  <h2>Q&A</h2>
			  <p style="text-align:right;"><a class="btn btn-warning" href="${contextPath}/qna/qnaWrite.do">문의하기: <span class="glyphicon glyphicon-pencil"></span></a></p>            
			  <table class="table table-hover">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>작성일자</th>
			      </tr>
			    </thead>
			    <tbody id="qna_tbody"></tbody>
			  </table>
		</div>
		<div id="pagination"  style="text-align:center;"></div>
    	<div class="panel-footer"></div>
	</div>
  </div>
	
</body>
</html>