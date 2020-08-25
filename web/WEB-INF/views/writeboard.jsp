<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록하기</title>
<link rel="stylesheet" href="resources/css/write.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div id="page-wrapper" class="clearfix">
    <h1>글 등록하기</h1>
    <p>작성자: ${sessionScope.loginInfo.name} </p>

    <form action="#" method="POST" id="file-form">
       <div class="">
        <input type="hidden" name="user_idx" id="user_idx" value="${sessionScope.loginInfo.idx}">
      </div>
      <div class="field">
        <input type="text" name="board_title" id="board_title" placeholder="제목을 작성하세요">
      </div>
      <div class="field">
        <textarea name="board_content" id="board_content" placeholder="내용을 작성하세요"></textarea>
      </div>
      <div class="field">
      </div>
    </form>
        <button type="button" class="button1">글 등록</button>
  </div>
  
  <script>
  $(document).ready(function(){
	  $('.button1').click(function(){
		var url="write.ajax";
		var user_idx= $("#user_idx").val();
		var board_title=$("#board_title").val();
		var board_content=$("#board_content").val();

		console.log(user_idx);
		//보내는 url
		
		var form = { 
				"user_idx":user_idx,
				"board_title":board_title,
				"board_content":board_content,
				}

		$.ajax({
			type : "POST",
			url : url,
			data : form,
			success: function(data){
			$(location).attr("href","<c:url value='./board' />");
				 }
			});	  
	
	  })
  });
  
  </script>
</body>
</html>