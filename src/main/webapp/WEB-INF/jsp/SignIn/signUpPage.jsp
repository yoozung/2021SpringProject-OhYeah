<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
</head>
<body>
<h3>회원가입</h3>
<form action="/signUpPage/SignUp" method="post">
<label for="email">이메일</label>
<input type="text" name="email" value=""/>
<br/>
<label for="password">패스워드</label>
<input type="password" name="password" value=""/>
<br/>
<label for="name">이름</label>
<input type="text" name="name" value=""/>
<br/>
<label for="mobile">핸드폰</label>
<input type="text" name="mobile" value=""/>
<br/>
<input type="submit" value="회원가입" />
<input type="reset" value="취소" />
</form>
</body>
</html>