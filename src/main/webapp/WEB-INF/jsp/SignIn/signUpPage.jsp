<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
<link rel="stylesheet" type="text/css" href="/resource/css/inc.css" />
<link rel="stylesheet" type="text/css" href="/resource/css/sign.css" />
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp"%>
<div class="signUpFormDiv">
<form action="/signUpPage/SignUp" id="signUpForm" method="post">
<table class="signUpForm">
<tr class="layer">
	<td colspan="2"><h3>회원가입</h3></td>
</tr>
<tr class="layer">
	<td class="tdTitle"><label for="email">아이디</label></td>
	<td class="tdContent"><input class="input" type="text" name="email" value="" placeholder="이메일주소를 아이디로 사용합니다." /></td>
</tr>
<tr class="layer">
	<td class="tdTitle"><label for="password">비밀번호</label></td>
	<td class="tdContent"><input class="input" type="password" name="password" value="" /></td>
</tr>
<tr class="layer">
	<td class="tdTitle"><label for="name">이름</label></td>
	<td class="tdContent"><input class="input" type="text" name="name" value="" /></td>
</tr>
<tr class="layer">
	<td class="tdTitle"><label for="mobile">핸드폰</label></td>
	<td class="tdContent"><input class="input" type="text" name="mobile" value="" /></td>
</tr>
<tr class="layer">
	<td class="tdTitle"><label for="mobile">회원 분류</label></td>
	<td class="tdContent">
		<select class="input" form="signUpForm" name="role">
			<option value="ROLE_CONSUMER">일반회원</option>
			<option value="ROLE_OWNER">사업자회원</option>
		</select>
	</td>
</tr>
<tr>
	<td class="tdFull" colspan="2">
		<input type="reset" value="취소" />
		<input type="submit" value="회원가입" />
	</td>
</tr>
</table>

</form>
</div>
</body>
</html>