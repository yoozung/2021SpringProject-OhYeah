<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>사업자 | 대기조회 가게 선택</title>
<style type="text/css">
table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }

  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
tr:hover { background-color: #eeeeff; cursor: pointer; }
</style>
</head> 
<body>
<form action="/ownerWaitList" method="get">
<div class="container">
	<h4>대기 관리할 가게 선택</h4>
	<table>
		<tr>
			<th>번호</th>
			<th>사업자의번호</th>
			<th>가게번호(관리할 가게 선택)</th>
			<th>가게명</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.MEMBERNO}</th>
			<th><input type="submit" name="shopNo" value="${dto.SHOPNO}"></th>
			<th>${dto.SHOPNAME}</th>
			<th>${dto.SHOPMOBILE}</th>
			<th>${dto.SHOPADDRESS}</th>
			
		</tr>
		</c:forEach>
	</table>
	
	
</div>
</form>
</body>
</html>