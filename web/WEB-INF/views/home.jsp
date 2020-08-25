<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>공부방</title>
	<style type="text/css">
		.layer{
		  display: flex;
		  flex-direction: column;
		  min-height:300px;
		  width:100%;
		  align-items:center;
		  text-align: center;
		}
	</style>
</head>
<body>
	<div class="layer">
		<h1>스프링 공부 프로젝트 <h1>
	<c:choose>
	 <c:when test="${not empty sessionScope.loginInfo}">	 
		<h2>${sessionScope.loginInfo.name}님 환영합니다.</h2>
		<h2><a href="board">게시판</a></h2>
		<h2><a href="list">회원목록</a></h2>		
		<h2><a href="mypage">마이페이지</a></h2>
		<h2><a href="logout.do">로그아웃</a></h2>
	 </c:when>
	 <c:when test="${empty sessionScope.loginInfo}">
	 	<h2><a href="board">게시판</a></h2>
		<h2><a href="register">회원가입</a></h2>
		<h2><a href="login">로그인</a></h2>		
	 </c:when>
	</c:choose>
	</div>
</body>
</html>
