<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../TagLib/Taglib.jsp"%>
<c:set var="userName" value="${userName}"/>
<div class="topMenu">
	<div>
		<a href="/"><img src="/resource/img/logo3.png"></a>
	</div>
	<div>
	<c:choose>
		<c:when test="${empty userName}">
			<a class="topSide" href="/">회원가입</a>
		 	<a class="topSide" href="/main">로그인</a>
		</c:when>
		<c:when test="${not empty userName}">
			<a class="topSide" href="/logout">로그아웃</a>
			<a class="topSide" href="#">
				<c:out value="${userName}"/>
			</a>			
		</c:when>
	</c:choose>
	</div>
</div>