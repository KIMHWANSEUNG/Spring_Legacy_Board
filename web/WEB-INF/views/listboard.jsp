<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="static/css/common.css">
<link rel="stylesheet" href="static/css/sub.css">
</head>
<body>
		<!-- 본문 start -->
		<section class="content" id="content">
			<div class="board_list center">
				<div class="list_header clearFix">
					<!-- 검색 바 start -->
					<div class="search_wrap">
						<div class="search_input_wrap">
							<label class="fs_00">검색어를 입력해주세요.</label>
							<input type="text" name="" placeholder="검색어를 입력해주세요.">
						</div>
						<div class="search_btn_wrap">
							<button type="button">검색</button>
						</div>
					</div>
					<!-- //검색 바 end -->
					<!-- 분류 선택 start -->
					<div class="tag_btns">
						<ul>
							<li class="on"><a href="#">전체보기</a></li>
						</ul>
					</div>
					<!-- //분류 선택 end -->
				</div>
				<div class="board_table_wrap">
					<table class="board_table">
						<colgroup>
							<col width="20%" />
							<col width="50%" />
							<col width="14%" />
							<col width="19%" />
						</colgroup>
						<thead>
							<tr>
								<th class="col01">번호</th>
								<th class="col02">제목</th>
								<th class="col03">작성자</th>
								<th class="col04">등록일</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach items="${uv}" var="row">
								<tr>
									<td class="col01" >${row.board_number}</td>
									<td  class="col02"><a href="showboard?board_number=${row.board_number}">${row.board_title}</a></td>
									<td class="col03"> ${row.name}</td>
									<td class="col04"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${row.board_date}"/></td>		                            
								</tr>
					</c:forEach>
						</tbody>
					</table>
					<div class="board_admin_btn">
						<button onclick="gopage();" type="button"  class="board_register_btn">등록</button>
					</div>
					<!--페이징 처리  -->
					<div style="display: block; text-align: center;">		
						<c:if test="${paging.startPage != 1 }">
							<a href="/board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="/board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="/board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</section>
		
		<script type="text/javascript">
		function gopage(){
				location.replace("/write");
			}

		function goboard(){

			

			}
		

		</script>

</body>
</html>