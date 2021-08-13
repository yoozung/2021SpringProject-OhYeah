<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>줄 서기 신청하기</title>
</head>
<body>
<form action="/waitList/getLineAction" method="post">
<h3>식당: </h3>
<div style="background-color: #333; width: 100%; height: 300px; text-align: center; color: #EEE; ">PHOTO</div>
<h4>인원수</h4>
<label for="count"> 대기 인원 </label>
<input type="text" name="count" value="0"/>
<input type="submit" value="줄 서기" />
<input type="reset" value="취소" />
</form>
</body>
</html>