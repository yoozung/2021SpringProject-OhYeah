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
				<a href="/signUpPage">JOIN</a> <a href="/signInPage">LOG IN</a>
			</div>
		</div>
		</c:when>
		<c:when test="${not empty userName}">
		<div class="col-9">
			<div class="topSide">
<<<<<<< HEAD
				<span>환영합니다 <c:out value="${userName}"/> 님</span>
				<c:if test="${authorities eq 'ROLE_ADMIN'}">
					<span>운영자</span>
				</c:if>
				<c:if test="${authorities eq 'ROLE_CONSUMER'}">
					<span>일반 회원</span>
				</c:if>
				<c:if test="${authorities eq 'ROLE_OWNER'}">
					<span>사업자 회원</span>
				</c:if>
				<a href="/myPage">마이페이지</a> 
				<a href="/signOut">로그아웃</a>
				<c:if test="${authorities eq 'ROLE_ADMIN' }" >				
					<a href="/admin/adminMemberList">전체 회원목록</a>
				</c:if>
=======

				<a href="/myPage">MY PAGE</a> <a href="/signOut">LOG OUT</a>

>>>>>>> branch 'main' of https://github.com/2021PlayDataWebCourseTeam4/Project02.git
			</div>
		</div>
		</c:when>		
		</c:choose>
		
	</div>
	
<<<<<<< HEAD
<!-- 	<div>
		<div class="topSide">
			<a href="/maptest">(임시) 식당지도</a>
			<c:choose>
			<c:when test="${authorities eq 'ROLE_ADMIN' }" >
			<a href="/admin/adminMemberList">(임시) 전체 회원목록</a>
			</c:when>
			</c:choose>
		</div>
	</div> -->
=======

>>>>>>> branch 'main' of https://github.com/2021PlayDataWebCourseTeam4/Project02.git
</div>