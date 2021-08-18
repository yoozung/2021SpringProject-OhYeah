<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>사업자 | 식당목록</title>
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
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<div class="container">
	<h4>가게목록조회</h4>
	<table>
		<tr>
			<th>번호</th>
			<th>사업자의번호</th>
			<th>가게번호</th>
			<th>가게명</th>
			<th>전화번호</th>
			<th>분류</th>
			<th>사이트</th>
			<th>좌석수</th>
			<th>주소</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.MEMBERNO}</th>
			<th>${dto.SHOPNO}</th>
			<th>${dto.SHOPNAME}</th>
			<th>${dto.SHOPMOBILE}</th>
			<th>${dto.SHOPCATEGORY}</th>
			<th>${dto.SHOPSITE}</th>
			<th>${dto.SHOPSEAT}</th>
			<th>${dto.SHOPADDRESS}</th>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>