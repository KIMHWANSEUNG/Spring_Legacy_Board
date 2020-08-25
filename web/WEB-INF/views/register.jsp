<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/register.css">
 <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">

</head>
<body>
		<div class="layer">
			<h2>회원가입</h2>
			<form>
			<div class="textbox">
			  <label>아이디</label>
			  <input type="text" id="user_id">
			</div>
			<div class="textbox">
			  <label for="user_pw">비밀번호</label>
			  <input type="password" id="user_pw">
			</div>
			<div class="textbox">
			  <label for="user_pw_confirm">비밀번호 확인</label>
			  <input type="password" id="user_pw_confirm">
			</div>						
			<div class="textbox">
			  <label for="user_name">이름</label>
			  <input type="text" id="user_name">
			</div>
			<div class="textbox">
			  <label for="user_phone_number">전화번호</label>
			  <input type="text" id="user_phone_number">
			</div>			
			<div class="textbox">
			  <label for="user_email">이메일</label>
			  <input type="text" id="user_email">
			</div>
			<div class="textbox">
			  <label for="post_code">우편번호</label>
			  <input type="text" name="post_code" id="post_code" readonly="readonly">
			  <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 찾기</button>
			</div>
			<div class="textbox">
			  <label for="addr1">도로명 주소</label>
			  <input type="text" name="addr1" id="addr1" readonly="readonly">
			</div>												
			<div class="textbox">
			  <label for="addr2">상세 주소</label>
			  <input type="text"  name="addr2" id="addr2" value="아몰랑" >
			</div>

			<button id="register" type="button"  class="register">가입</button>
			</form>
		</div>
		
<script type="text/javascript">

$( document ).ready(function(){
	//등록
	$("#register").click(function(){
		var id=$("#user_id").val();
		var pw=$("#user_pw").val();
		var name=$("#user_name").val();
		var phone_number=$("#user_phone_number").val();
		var email=$("#user_email").val();
		var post_code=$("#post_code").val();
		var addr1=$("#addr1").val();
		var addr2=$("#addr2").val();
		//보내는 url
		var action= "register.ajax";

		var form = { 
				"id":id,
				"pw":pw,
				"name":name,
				"phone_number":phone_number,
				"email":email,
				"post_code":post_code,
				"addr1":addr1,
				"addr2":addr2
				}
		console.log(form);
		$.ajax({
			type:"POST",
			url :action,
			data: form,
// 			dataType: "json",
			success : function(data){
				console.log('456456456');
				 $(location).attr("href","<c:url value= '/'/>"); 
				}
			});
		});

		});


	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				let fullRoadAddr = data.roadAddress;
				let extraRoadAddr = '';
	
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
	
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
	
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
	
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				console.log(data.zonecode);
				console.log(fullRoadAddr);
	
				$("[name=post_code]").val(data.zonecode);
				$("[name=addr1]").val(fullRoadAddr);
			}
		}).open();
	}
	


		

</script>

</body>
</html>
