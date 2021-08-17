<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">
<title>사업자 | 대기목록</title>
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
<div class="container">
<form action="/call" name="waitManage" method="get">
	<h4>대기현황</h4>
	<table>
		<tr>
			<th>번호</th>
			<th>가게번호</th>
			<th>예약번호</th>
			<th>신청자 이름</th>
			<th>신청자 연락처</th>
			<th>대기인원</th>
			<th>대기상태</th>
			<th>선택</th>
			
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<th>${status.count}</th>
			<th>${dto.shopNo}</th>
			<th>${dto.waitNo}</th>
			<th>${dto.waitName}</th>
			<th>${dto.waitMobile}</th>
			<th>${dto.headCount}</th>
			<th>${dto.waitState}</th>
			<th><!-- ${dto.waitNo} --> <input type="submit" style="display: inline-block;" name="waitNo" value="${dto.waitNo}" /> </th>
		</tr>
		</c:forEach>
	</table>

</form>
</div>
</body>
</html>