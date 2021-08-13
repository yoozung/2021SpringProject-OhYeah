<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
<%@ include file="../Fragment/TopNav/topNav.jsp" %>
<c:set var="userName" value="${member.getName()}" />
<c:set var="mobile" value="${member.getMobile()}" />
<c:set var="email" value="${member.getEmail()}" />
<c:set var="password" value="${member.getPassword()}" /> 
<form action="#" method="post">
<label for="account">이름</label>
<input type="text" name="account" value="${userName}"/>
<br/>
<label for="mobile">핸드폰</label>
<input type="text" name="mobile" value="${mobile}"/>
<br/>
<label for="email">이메일</label>
<input type="text" name="email" value="${email}"/>
<br/>
<label for="password">비밀번호</label>
<input type="password" name="password" value="${password}" />
<br/>
<input type="button" name="bacward" onclick="javascript:window.history.back()" value="뒤로가기"/>
</form>
</body>
</html>