<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		
			
			<h2>내 정보</h2>
			<form>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input id="user_id" type="text" class="form-control" name="user_id" value="${mim.user_id}" readonly/>
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				  <input id="user_pw_new" type="password" class="form-control" name="user_pw_new" onkeyup="fn_pwCheck()" placeholder="변경비밀번호"/>
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
				  <input id="user_pw_new_check" type="password" class="form-control" name="user_pw_new_check"  onkeyup="fn_pwCheck()" placeholder="변경비밀번호확인"/>
				  <span id="pw_alert" class="form-control" name="pw_alert" style="color:red;"></span>
				</div>
				<div class="input-group">
				  <span class="input-group-addon">이름</span>
				  <input id="user_name" type="text" class="form-control" name="user_name" value="${mim.user_name}" placeholder="이름"/>
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
				  <input id="user_email" type="email" class="form-control" name="user_email" value="${mim.user_email}" placeholder="이메일"/>
				</div>
				<div class="input-group" >
				  <span class="input-group-addon">주소</span>
				  <input id="user_zip" type="number" class="form-control" name="user_zip" placeholder="우편번호" value="${mim.user_zip}" readonly/>
				  <a href="javascript:fn_getZip();" class="btn btn-default" id="search_zip" name="btn">우편번호 검색</a>
				  <input id="user_addr" type="text" class="form-control" name="user_addr" placeholder="주소" value="${mim.user_addr}" readonly/>
				  <input id="user_addr_detail" type="text" class="form-control" name="user_addr_detail" value="${mim.user_addr_detail}" placeholder="상세주소"/>
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></i></span>
				  <div style="display:inline-block; margin: auto 0;">
					  <input id="user_tel1" type="number" class="form-control" name="user_tel1" style="width:20%" value="${mim.user_tel1}"/>
					  <span class="form-control" style="width:5%">-</span>
					  <input id="user_tel2" type="number" class="form-control" name="user_tel2" style="width:20%" value="${mim.user_tel2}"/>
					  <span class="form-control" style="width:5%">-</span>
					  <input id="user_tel3" type="number" class="form-control" name="user_tel3" style="width:20%" value="${mim.user_tel3}"/>
				  </div>
				  
				  
				</div>
				<div class="input-group">
				  <span class="input-group-addon">생일</span>
				  <input id="user_birth" type="date" class="form-control" name="user_birth" value="${mim.user_birth}"/>
				</div>
				<a href="javascript:fn_nullCheck();" class="btn btn-info" id="joinButton" name="btn">회원 정보 수정</a>
				<a href="javascript:fn_cancel();" class="btn btn-danger" id="cancleButton" name="btn">취소</a>
			</form>
		</div>
  	</div>
</body>
</html>