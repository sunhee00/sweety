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
	
	//onload
	$(function () {
		fn_replyList();
	});
	
	//답글 리스트
	function fn_replyList() {
		var param = {
			qna_no: $("#qna_no").val()
		}
		var replyListCallback = function (reval) {
			console.log(reval);
			$("#replyBody").empty().append(reval);

			
		}
		fn_callAjax("qnaReply.do","post",false,param,"text",replyListCallback);
	}
	
	//qna게시글 update
	function fn_goUpdate() {
		document.form1.action = "${contextPath}/qna/qnaWrite.do";
		document.form1.submit();
		
	}

	
	//qna 답변 insert
	function fn_qnaReplyInsert() {
		var param = {
				qna_title :$("#qna_reply_title").val(),
				qna_cont :$("#qna_reply_cont").val(),
				qna_lv :$("#qna_reply_lv").val(),
				qna_seq :$("#qna_reply_seq").val(),
				qna_no : $("#qna_no").val()
				
		}
		
		var replyListCallback = function (reval) {
			
			var check = true;
			for(var i in reval) {
				if(reval[i] == 0) {
					check = false;
					break;
				}
			}
			
			if(check) {
				$("#qna_reply_title").val("");
				$("#qna_reply_cont").val("");
				alert("답변이 등록되었습니다.");
				fn_replyList();
			}
				
			
			
		}
		fn_callAjax("qnaReplyInsert.do","post",false,param,"json",replyListCallback);
	}
	
	//답글수정
	function fn_goReplyUpdate(qna_no,qna_seq,qna_lv) {
		var param = {
				qna_no : qna_no,
				qna_seq : qna_seq,
				qna_lv : qna_lv
				
		}
		
		var replyUpdateCallback = function (reval) {
			console.log(reval);
			var html = "";
			html+='<form name="form3" method="post" >';
			html+='<div class="form-group">';
			html+=  '<label for="qna_reply_title">제목:</label>';
			html+=  '<input type="text" class="form-control" id="qna_reply_title" name="qna_reply_title" maxlength="50"  value="'+reval.qna_title+'"placeholder="제목을 입력해주세요.(50자까지)">';
			html+='</div>';
			html+='<div class="form-group">';
			html+=  '<label for="qna_reply_cont">내용:</label>';
			html+=  '<textarea class="form-control" id="qna_reply_cont"  name="qna_reply_cont"  maxlength="100" placeholder="내용을 입력해주세요.(100자까지)">'+reval.qna_cont+'</textarea>';
			html+=  '<p id="remain_cont"></p>';
			html+='</div>';
			html+='<input type="hidden" value="'+reval.qna_lv+'" id="qna_reply_lv" name="qna_reply_lv">';
			html+='<input type="hidden" value="'+reval.qna_seq+'" id="qna_reply_seq" name="qna_reply_seq">';
			html+='<a class="btn btn-info" href="javascript:fn_qnaReplyInsert()">수정하기</a>';
			html+='</form>';
			$("#reply"+qna_seq).empty().append(html);
				
			
			
		}
		fn_callAjax("qnaReplyUpdate.do","post",false,param,"json",replyUpdateCallback);
	}
	
	//게시글 삭제
	function fn_goDelete(qna_no,qna_seq,qna_lv) {
		var param = {
				qna_no : qna_no,
				qna_seq : qna_seq,
				qna_lv : qna_lv
		}
		
		var deleteCallback = function (reval) {
			if(qna_lv == '1') {
				alert("게시글이 삭제되었습니다.");
				window.location.href="${contextPath}/qna/qna.do";
			}else {
				alert("댓글이 삭제되었습니다.");
				fn_replyList();
			}
			
		}
		fn_callAjax("qnaDelete.do","post",false,param,"json",deleteCallback);
	}

	
</script>
</head>
<body>
	
	
	
	<div class="container">
	<%--header삽입 --%>
	<jsp:include page="../common/header.jsp"></jsp:include>
		<div style="width:60%; margin:0 auto;">
			<form name="form1" method="post">
			  <div>
			    <div><p id="qna_title">제목: ${qnaDetail.qna_title}</p></div>
			    <div><p><span>${qnaDetail.qna_no}</span><span id="user_id">작성자: ${qnaDetail.user_id}</span></p><p><span id="qna_date" name="qna_date">작성날짜: ${qnaDetail.qna_date}</span></p></div>
			    <div><p id="qna_cont" name="qna_cont">${qnaDetail.qna_cont}</p></div>
			    <div>
			    <c:if test="${user_id eq qnaDetail.user_id}">
			    	<a class="btn btn-info" href="javascript:fn_goUpdate()">수정하기</a>
			    	<a class="btn btn-info" href="javascript:fn_goDelete(${qnaDetail.qna_no},1,1)">삭제하기</a>
			    </c:if>
			    	<a class="btn btn-info" href="${contextPath}/qna/qna.do">뒤로가기</a>
			    </div>
			    <input type="hidden" value="${qnaDetail.qna_no}" id="qna_no" name="qna_no">
			    <input type="hidden" value="1" id="qna_lv" name="qna_lv">
			    <input type="hidden" value="1" id="qna_seq" name="qna_seq">
			  </div>
			</form>
			
			<div id="replyContainer" style="width:80%; margin:0;">
				<div id="replyBody"></div>
				
				<c:if test="${user_id eq 'admin' || user_id eq qnaDetail.user_id}">
				<div id="replyInput" style="border:solid;">
					<form name="form2" method="post" >
						<div class="form-group">
						  <label for="qna_reply_title">제목:</label>
						  <input type="text" class="form-control" id="qna_reply_title" name="qna_reply_title" maxlength='50'  placeholder="제목을 입력해주세요.(50자까지)">
						</div>
						<div class="form-group">
						  <label for="qna_reply_cont">내용:</label>
						  <textarea class="form-control" id="qna_reply_cont"  name="qna_reply_cont"  maxlength='100' placeholder="내용을 입력해주세요.(100자까지)"></textarea>
						  <p id="remain_cont"></p>
						</div>
						<input type="hidden" value="" id="qna_reply_seq" name="qna_reply_seq">
						<input type="hidden" value="2" id="qna_reply_lv" name="qna_reply_lv">
						<a class="btn btn-info" href="javascript:fn_qnaReplyInsert()">등록하기</a>
					</form>
				</div>
				</c:if>
				
			</div>
		</div>
  	</div>
	
</body>
</html>