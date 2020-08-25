<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/coment.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<style>

.textarea{
 width: 50%;
 margin-left: 100px;
 font-size: 20px;
 font-family: Consolas, sans-serif;
}
.reply_btn{
	margin-top:10px;
	margin-bottom:10px;
	
}
.div_textarea{
	margin-top:100px;
	margin-bottom: 30px;
}
.form_textarea{
	display: flex;
	flex-direction: row;
}
.div_comment{
	display:flex;
	flex-direction:column;
	width:100%;
	border:2px inset #808080;
	margin-bottom:20px;
}

.user_name{
    font-size:14px;
    font-weight: bold;
}
.comments-list .media{
    border-bottom: 1px dotted #ccc;
}
.button_cocoment{
	background-color: white;
	border-radius: 10px;
}
.div_cocoment_button{
	float: right;
}
.div_cocoment1{
	display: none;
	width: 100%;
	height: 100px;
	background-color:blue; 
}
.div_cocoment2{
	display: flex;
	width: 100%;
	height: 100px;
	background-color:red; 
}


</style>

		<div>
				<!--댓글 입력창 -->
			<div class="div_textarea">
				<c:if test="${empty loginInfo }">
					<textarea class="textarea" rows="2"cols="10"  placeholder="로그인 후 가능" name="content" id="content" readonly="readonly" ></textarea>
					<input  type="button" class="reply_btn" id="reply_btn" value="댓글 등록">
				</c:if>
				<c:if test="${not empty loginInfo }">
				<form class="form_textarea" >
					<input type="hidden" name="c_board_number" id="c_board_number" value="${board.board_number}">
					<input type="hidden" name="user_idx" id="user_idx" value="${sessionScope.loginInfo.idx}">
					<input type="hidden" name="coment_state" id="coment_state" value=0>
					<textarea class="textarea" rows="2"cols="10"  placeholder="댓글 작성" name="content" id="content"></textarea>
					<input  type="button" class="reply_btn" id="reply_btn" value="댓글 등록">
				</form>
				</c:if>
			</div>
		<div class="container">
            <div class="row">
                <div class="col-md-8">
                  <div class="page-header">
                    <h1> 댓글 </h1>
                  </div> 
                 <c:if test="${not empty coment}">
                   <c:forEach items="${coment}" var="row">
                   <div class="comments-list">
                       <div class="media">
                           <p class="pull-right"><small><fmt:formatDate pattern="yyyy년-MM월-dd일  HH시:mm분:ss초" value="${row.coment_date }"/></small></p>
	                             <div class="div_cocoment_button">
	                            <button class="button_cocoment" id="button_cocoment">답글 작성</button>
	                             </div>
                            <div class="media-body">
	                              <h4 class="media-heading user_name">작성자:${row.name }</h4>
	                            	 ${row.coment }
	                             <c:if test="${sessionScope.loginInfo.idx==row.user_idx}">	                             
	                              <p>
	                              <small><a href="">수정</a> - <a href="">삭제</a></small>
	                              </p>
	                             </c:if>
                            </div>
								<div id="div_cocoment" class="div_cocoment1">
									<h2>ggg</h2>
								</div>
                         </div>
                   	</div>
                    </c:forEach>  
                 </c:if>
                 <c:if test="${empty coment}">
                 <h2>댓글이 아직 없습니다</h2>
                 </c:if>

                </div>
            </div>
        </div>
	</div>
	
<script type="text/javascript">
$(document).ready(function(){
	  $('.reply_btn').click(function(){
		var url="coment.ajax";
		var c_board_number= $("#c_board_number").val();
		var user_idx= $("#user_idx").val();
		var coment_state= $("#coment_state").val();
		var content=$("#content").val();

		
		var form = { 
				"c_board_number":c_board_number,
				"user_idx":user_idx,
				"content":content,
				"coment_state":coment_state
				}

		$.ajax({
			type : "POST",
			url : url,
			data : form,
			success: function(data){
			location.reload();
				 }
			});
	  })

	$('.button_cocoment').click(function(){

	$("div_cocoment").addClass("div_cocoment2");



});
	})

	
</script>

</body>
</html>