<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
<styLe>
	.tb_02{border:2px solid rgb(0, 167, 133);
	  display: flex;
	  flex-direction: column;
	  min-height:300px;
	  width:100%;
	  align-items:center;
	  text-align: center;
	}
	.tb_02 tbody th{background-color:#fafafa;height:40px;line-height:40px;border:1px solid #d9d9d9;border-top:none}
.tb_02 tbody td{border:1px solid #d9d9d9;padding: 18px 0;text-align:left;padding-left:20px; width:200px;}
.tb_02 tbody td.txtL{text-align:left;padding-left:20px}

.tb_02.fm_w tbody td{padding:8px 0 8px 20px}
.tr_content{
	width:40rem;
}

</styLe>
<div class="tb_02">
		<h2>게시글</h2>
	<table border="1" width="1000px">
		<colgroup><col width="40%"><col width="80%"></colgroup>
	<tbody>
		<tr >
			<th scope="row">작성자</th>
			<td >${board.name}</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td >${board.board_title}</td>
 		</tr>
		<tr>
			<th scope="row">작성일</th>
			<td ><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.board_date}"/></td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td >${board.board_content}</td>
		</tr>
			</tbody>					
	</table>
	
	<jsp:include page="comment.jsp"/>


	
</div>
</body>
</html>