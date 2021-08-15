<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>줄 서기 신청하기</title>
<link rel="stylesheet" type="text/css" href="/resource/css/WaitList/WaitList.css"/>
</head>
<body>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<form action="/waitList/getLineAction" method="post">
<div>
<table class="table">
	<tbody>
		<tr>
			<td>
				<h3 id="WaitRestaurantName"></h3>
			</td>
		</tr>
		<tr>
			<td class="photo">
			</td>
		</tr>
		<tr>
			<td class="inputHead">
				<label for="shopName">식당 이름</label>
			</td>
			<td class="inputBody">
				<input type="text" id="shopName" name="shopName" value="" readonly />
			</td>
		</tr>
		<tr>
			<td class="inputHead">
				<label for="shopNo">식당번호</label>
			</td>
			<td class="inputBody">
				<input type="text" id="shopNo" name="shopNo" value="" readonly />
			</td>
		</tr>
		<tr>
			<td class="inputHead">
				<label for="waitName">신청자 이름</label>
			</td>
			<td class="inputBody">
				<input type="text" name="waitName" value="" />
			</td>
		</tr>
		<tr>
			<td class="inputHead">
				<label for="waitMobile">신청자 연락처</label>
			</td>
			<td class="inputBody">
				<input type="text" name="waitMobile" value="" />
			</td>
		</tr>
		<tr>
			<td class="inputHead">
				<label for="headCount">대기인원</label>
			</td>
			<td class="inputBody">
				<input type="text" name="headCount" value=""/>
			</td>
		</tr>		
	</tbody>
</table>
	<div class="row">
		<div class="col-6 btn">
			<input type="button" value="취소"/>
		</div>
		<div class="col-6 btn">
			<input type="submit" value="줄 서기"/>
		</div>
	</div>
</div>
</form>
</body>
<script type="text/javascript">
</script>
<script type="text/javascript" src="/resource/js/WaitList/WaitList.js"></script>
</html>