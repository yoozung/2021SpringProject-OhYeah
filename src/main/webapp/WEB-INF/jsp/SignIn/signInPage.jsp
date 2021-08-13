<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
<link rel="stylesheet" type="text/css" href="/resource/css/inc.css" />
<link rel="stylesheet" type="text/css" href="/resource/css/sign.css" />
</head>
<body>
	<%@ include file="../Fragment/inc/topBefore.jsp"%>
	<c:set var="status" value="${status}" />
	<c:set var="msg" value="${'로그인에 실패했습니다.'}" />
	<div class="signInFormDiv">
		<form action="/signInPage/SignIn" method="post">
			<table class="signInForm">
				<tr class="layer">
					<td colspan="2"><h3>로그인</h3></td>
				</tr>
				<tr class="layer">
					<td class="tdTitle"><label for="account">아이디</label></td>
					<td class="tdContent"><input class="input" type="text" name="account" value="" /></td>
				</tr>
				<tr class="layer">
					<td class="tdTitle"><label for="password">비밀번호</label></td>
					<td class="tdContent"><input class="input" type="password" name="password" value="" /></td>
				</tr>
				<tr class="layer">
					<td class="tdFull" colspan="2"class="tdContent">
					<c:if test="${status == 'fail' }">
						<c:out value="${msg}" />
					</c:if>
					</td>
				</tr>
				<tr class="layer">
					<td class="tdFull" colspan="2"><input class="signInBtn javaBtn" type="submit" name="signInSubmit" value="로그인" /></td>
				</tr>
				<tr class="layer">
					<td class="tdFull" colspan="2"><button class="signInBtn GoogleBtn"><a href="/oauth2/authorization/google">Google</a></button></td>
				</tr>
			</table>			
		</form>
	</div>
</body>
</html>