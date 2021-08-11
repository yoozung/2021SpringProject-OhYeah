<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
<a href="/">메인</a>
<c:choose>
<c:when test="${not empty username}">
	<a href="#">
		<c:out value="${userName}"/>
	</a>
</c:when>
<c:when test="${userName eq null}">
	<!-- <a href="/signInPage">로그인</a>
	<a href="/oauth2/authorization/google">Google 로그인</a> -->
</c:when>
<c:otherwise>
	<a href="/signOutReq">로그아웃</a>
</c:otherwise>
</c:choose>
</div>