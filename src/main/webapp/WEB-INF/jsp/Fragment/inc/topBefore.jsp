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
				<a href="/signUpPage">JOIN</a> <a href="/signInPage">LOG IN</a> <a href="/oauth2/authorization/google">GOOGLE</a>
			</div>
		</div>
		</c:when>
		<c:when test="${not empty userName}">
		<div class="col-9">
			<div class="topSide">
				<a href="/">MY PAGE</a> <a href="/logout">LOG OUT</a>
			</div>
		</div>
		</c:when>
		</c:choose>
	</div>
	
<!-- 	<div>
		<div class="topSide">
			<a href="/test1111">(임시) 식당지도</a>
			<a href="/admin/adminMemberList">(임시) 전체 회원목록</a>
		</div>
	</div> -->
</div>