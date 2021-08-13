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
<c:set var="status" value="${status}" />
<c:set var="msg" value="${'로그인에 실패했습니다.'}" />
<form action="/signInFragment/SignIn" method="post">
<label for="account">아이디</label>
<input type="text" name="account" value=""/>
<br/>
<label for="password">비밀번호</label>
<input type="password" name="password" value="" />
<br/>
<c:if test="${status == 'fail'}">
<p><c:out value="${msg}"/></p>
</c:if>
<input type="submit" name="signInSubmit" value="로그인" />
</form>
</body>
</html>