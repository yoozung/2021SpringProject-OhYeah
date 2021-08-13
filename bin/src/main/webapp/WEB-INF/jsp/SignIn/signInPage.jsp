<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
</head>
<body>
<%@ include file="../Fragment/TopNav/topNav.jsp" %>
<form action="/signInPage" method="POST">
<label for="signAccount">아이디</label>
<input type="text" name="signAccount" value=""/>
<br/>
<label for="signPassword">비밀번호</label>
<input type="password" name="signPassword" value="" />
<br/>
<input type="submit" name="signInSubmit" value="로그인" />
</form>
</body>
</html>