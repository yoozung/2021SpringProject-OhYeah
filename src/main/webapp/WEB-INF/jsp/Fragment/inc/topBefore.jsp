<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../TagLib/Taglib.jsp"%>
<!-- 탑메뉴 -->
<div class="container">
<c:set var="userName" value="${userName}"/>
	<div class="row topMenu">
		<div class="col-3">
			<a href="/"><img src="/resource/img/logo3.png"></a>
		</div>
		
		<c:choose>
		<c:when test="${empty userName}">
		<div class="col-9">
			<div class="topSide">
				<a href="/signUpPage">회원가입</a> <a href="/signInPage">로그인</a>
			</div>
		</div>
		</c:when>
		<c:when test="${not empty userName}">
		<div class="col-9">
			<div class="topSide">
				<a href="/">마이페이지</a> <a href="/logout">로그아웃</a>
			</div>
		</div>
		</c:when>
		</c:choose>
	</div>
</div>