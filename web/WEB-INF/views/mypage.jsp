<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
<script	 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/register.css">
 <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
</head>
<body>
		<div class="layer">
			<h2>마이페이지</h2>
			<form>
			<div class="textbox">
			  <input type="hidden" id="index" value="${sessionScope.loginInfo.idx}">
			</div>
			<div class="textbox">
			  <label>아이디</label>
			  <input type="text" id="user_id" value="${sessionScope.loginInfo.id}">
			</div>
			<div class="textbox">
			  <label for="user_pw">비밀번호</label>
			  <input type="password" id="user_pw" value="${mv.pw}">
			</div>
			<div class="textbox">
			  <label for="user_pw_confirm">비밀번호 확인</label>
			  <input type="password" id="user_pw_confirm" >
			</div>						
			<div class="textbox">
			  <label for="user_name">이름</label>
			  <input type="text" id="user_name" value="${mv.name}">
			</div>
			<div class="textbox">
			  <label for="user_phone_number">전화번호</label>
			  <input type="text" id="user_phone_number" value="${mv.phone_number}">
			</div>			
			<div class="textbox">
			  <label for="user_email">이메일</label>
			  <input type="text" id="user_email" value="${mv.email}">
			</div>
			<div class="textbox">
			  <label for="post_code">우편번호</label>
			  <input type="text" name="post_code" id="post_code" readonly="readonly" value="${mv.post_code}">
			  <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 찾기</button>
			</div>
			<div class="textbox">
			  <label for="addr1">도로명 주소</label>
			  <input type="text" name="addr1" id="addr1" readonly="readonly" value="${mv.addr1}">
			</div>												
			<div class="textbox">
			  <label for="addr2">상세 주소</label>
			  <input type="text"  name="addr2" id="addr2" value="아몰랑" value="${mv.addr2}">
			</div>

			<button action="update" type="button"  class="button">수정</button>
			<button action="delete" type="button" class="button">삭제</button>
			</form>
		</div>
		
		<script>
			$(document).ready(function(){
				$(".button").click(function(){
					var action = $(this).attr("action");
					var url;
					if(action == "update"){
						url= "userUpdate.ajax";	
						}else if(action == "delete"){
						url ="userDelete.ajax";
						}else{
							return false;
						}
				
					var index= $("#index").val();
					var id=$("#user_id").val();
					var pw=$("#user_pw").val();
					var name=$("#user_name").val();
					var phone_number=$("#user_phone_number").val();
					var email=$("#user_email").val();
					var post_code=$("#post_code").val();
					var addr1=$("#addr1").val();
					var addr2=$("#addr2").val();
					//보내는 url
					
					var form = { 
							"idx":index,
							"id":id,
							"pw":pw,
							"name":name,
							"phone_number":phone_number,
							"email":email,
							"post_code":post_code,
							"addr1":addr1,
							"addr2":addr2
							}
					console.log(index);
					console.log(action);
					$.ajax({
						type : "POST",
						url : url,
						data : form,
						success: function(data){
						//$(location).attr("href","<c:url value='./cardList.do' />");
						console.log("success");
							 }
						});
					});
			});
			function getParameterByName(name){
			    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			        results = regex.exec(location.search);
			    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
			}
						
			
		</script>



</body>
</html>