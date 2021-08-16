<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../TagLib/Taglib.jsp"%>
<!-- 탑메뉴 -->
<c:set var="userName" value="${userName}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<nav class="navbar sticky-top navbar-expand-sm bg-white text-dark">
    <!-- Links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="/main"><img class="nav-logo" src="/resource/img/main/logo.png" /></a>
      </li>
    </ul>
    <c:if test="${authorities eq null}">
    <ul class="navbar-nav menu-nav">
      <li class="nav-item">
        <a class="nav-link" href="/map/mapFormList">식당 지도</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">식당 목록</a>
      </li>
    </ul>
    </c:if>
    <c:if test="${authorities eq 'ROLE_CONSUMER'}">
    <ul class="navbar-nav menu-nav">
      <li class="nav-item">
        <a class="nav-link" href="/map/mapFormList">식당 지도</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">식당 목록</a>
      </li>     
      <li class="nav-item dropdown">
      	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		대기조회
      	</a>
      	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
      		<a class="dropdown-item" href="/waitList/WaitListMySelect">대기 조회</a>
      		<a class="dropdown-item" href="#">대기 변경</a>
      	</div>
      </li>
    </ul>
    </c:if>
    <c:if test="${authorities eq 'ROLE_OWNER'}">
    <ul class="navbar-nav menu-nav">     
       <li class="nav-item dropdown">
      	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		가게 관리
      	</a>
      	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
      		<a class="dropdown-item" href="#">가게 등록신청</a>
      		<a class="dropdown-item" href="#">가게 정보조회</a>
      		<a class="dropdown-item" href="#">가게 정보수정</a>
      		<a class="dropdown-item" href="#">가게 철수신청</a>
      	</div>
      </li>
    </ul>
    </c:if>
    <c:if test="${authorities eq null}">    
    <ul class="navbar-nav member-nav">
		<li class="nav-item">
	        <a class="nav-link" href="/signInPage">로그인</a>
	    </li>
	    <li class="nav-item">
	    	<a class="nav-link" href="/signUpPage">회원가입</a>
	    </li>   	  	
    </ul>
    </c:if> 
    <c:if test="${authorities ne null}">    
    <ul class="navbar-nav member-nav authorities">    		
   	  	<li class="nav-item">   	
   	  	<span>환영합니다! <c:out value="${userName}"/> 님</span>
   	  	<c:if test="${authorities eq 'ROLE_ADMIN'}">     	
      		<span>운영자</span>
      	</c:if>
      	<c:if test="${authorities eq 'ROLE_CONSUMER'}">
      		<span>일반 회원</span>
      	</c:if>
       	<c:if test="${authorities eq 'ROLE_OWNER'}">
      		<span>사업자 회원</span>
      	</c:if>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/myPage">마이페이지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/signOut">로그아웃</a>
      </li>
    </ul>
    </c:if> 
  </nav>