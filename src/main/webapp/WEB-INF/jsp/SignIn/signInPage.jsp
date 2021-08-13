<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/resource/css/inc.css" />
<link rel="stylesheet" type="text/css" href="/resource/css/sign/signIn.css" />
</head>
<body>
	<div class="container signInPage">
		<div class="signInForm">
			<form action="/signInPage/SignIn" method="POST">
				<div class="row title">
					<div class="col-4"></div>
					<div class="col-4 titleLogo">
						<span class="Coral">오</span><span>늘의</span> <br /> <span
							class="Coral Coral2">예</span><span>약</span>
					</div>
					<div class="col-4"></div>
				</div>
				<div class="row blank signInfo">
					<div class="col-12">
						<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a> <a href="#">회원가입</a>
					</div>
				</div>
				<div class="row form">
					<div class="col-12">
						<div class="row input">
							<div class="col-12">
								<input type="text" name="account" placeholder="아이디" />
							</div>
						</div>
						<div class="row input">
							<div class="col-12">
								<input type="password" name="password" placeholder="비밀번호" />
							</div>
						</div>
						<div class="row blank"></div>
						<div class="row ">
							<div class="col-12">
								<input class="signInBtn" type="submit" name="signIn" value="로그인" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>