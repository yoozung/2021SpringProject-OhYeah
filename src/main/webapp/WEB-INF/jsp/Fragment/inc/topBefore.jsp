<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../TagLib/Taglib.jsp"%>
<!-- 탑메뉴 -->
<div class="container">
<c:set var="userName" value="${userName}"/>
<c:set var="authorities" value="${member.getRole()}"/>
	<div class="row topMenu">
		<div class="col-3">
			<a href="/"><img src="/resource/img/logo3.png"></a>
		</div>
		
		<c:choose>
		<c:when test="${empty userName}">
		<div class="col-9">
			<div class="topSide">
				<a href="/signUpPage">회원가입</a> <a href="/signInPage">로그인</a> <a href="/oauth2/authorization/google">구글 로그인</a>
			</div>
		</div>
		</c:when>
		<c:when test="${not empty userName}">
		<div class="col-9">
			<div class="topSide">
				<a href="/myPage">마이페이지</a> <a href="/signOut">로그아웃</a>
			</div>
		</div>
		</c:when>
		</c:choose>
	</div>
	<div>
		<div class="topSide">
			<a href="/maptest">(임시) 식당지도</a>
			<c:choose>
			<c:when test="${authorities eq 'ROLE_ADMIN' }" >
			<a href="/admin/adminMemberList">(임시) 전체 회원목록</a>
			</c:when>
			</c:choose>
		</div>
	</div>
</div>