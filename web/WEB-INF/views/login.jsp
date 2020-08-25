<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/register.css">
 <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
</head>
<body>
		<div class="layer">
			<h2>로그인</h2>
			<form>
			<div class="textbox">
			  <label>아이디</label>
			  <input type="text" id="user_id">
			</div>
			<div class="textbox">
			  <label for="user_pw">비밀번호</label>
			  <input type="password" id="user_pw">
			</div>

			<button action="login" type="button"  class="button">로그인</button>
			</form>
		</div>
		
		<script>
			$(document).ready(function(){
				$(".button").click(function(){
					var action = $(this).attr("action");
					var url = "login.do";
				
					var id=$("#user_id").val();
					var pw=$("#user_pw").val();
					if(id==""){
						alert("아이디를 입력하세요.");
						$("#user_id").focus(); //입력 포커스 이동
						return; //함수 종료
						}
					else if(pw==""){
						alert("비밀번호를 입력하세요");
						$("#user_pw").focus();
						return;
						}
					
					
					var form = { 
							"id":id,
							"pw":pw,
							}
					$.ajax({
						type : "POST",
						url : url,
						data : form,
						success: function(data){
						console.log(data.canLogin);
						if(data.canLogin){
							alert("로그인 성공");
						$(location).attr("href","<c:url value='./' />");
							}
					else{
								alert("로그인 불가");
						 	}
					}
						});
					});
			});

						
			
		</script>



</body>
</html>