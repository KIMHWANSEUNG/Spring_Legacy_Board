<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<div>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>post_code</th>
			<th>addr1</th>
			<th>addr2</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${uv}" var="uvRow">
			<tr class="tr" >
				<td>${uvRow.idx}</td>
				<td>${uvRow.id}</td>
				<td>${uvRow.pw}</td>
				<td>${uvRow.name}</td>
				<td>${uvRow.phone_number}</td>
				<td>${uvRow.email}</td>
				<td>${uvRow.post_code}</td>
				<td>${uvRow.addr1}</td>
				<td>${uvRow.addr2}</td>
                            
			</tr>
		
		</c:forEach>

	</tbody>
</table>
</div>

</body>
</html>