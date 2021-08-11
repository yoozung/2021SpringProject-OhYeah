<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../TagLib/Taglib.jsp"%>


<c:choose>

<!-- div태그 닫지마세요 -->
<div class="container content">
	<div class="row">
<!-- div태그 닫지마세요 sideMypage_e에서 닫힙니다 -->
	
	<c:when test="">
	<!-- 공통 마이페이지 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">내정보조회/변경</a>
			</div>
			<div class="col">
				<a href="/">탈퇴</a>
			</div>
		</div>
	</c:when>

	<c:when test="">
	<!-- 소비자 대기관리 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">대기조회</a>
			</div>
			<div class="col">
				<a href="/">대기연장</a>
			</div>
		</div>
	</c:when>

	<c:when test="">
		<!-- 사업자 식당관리 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">식당 등록 신청</a>
			</div>
			<div class="col">
				<a href="/">내식당 조회</a>
			</div>
			<div class="col">
				<a href="/">식당 정보 수정 신청</a>
			</div>
			<div class="col">
				<a href="/">식당 정보 삭제 신청</a>
			</div>
		</div>
	</c:when>

	<c:when test="">
		<!-- 사업자 대기관리 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">대기관리 할 가게 선택</a>
			</div>
			<div class="col">
				<a href="/">가게 상황 알리기</a>
			</div>
			<div class="col">
				<a href="/">대기자 호출</a>
			</div>
		</div>
	</c:when>

	<c:when test="">
		<!-- 관리자 식당관리 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">등록관리</a>
			</div>
			<div class="col">
				<a href="/">식당 조회</a>
			</div>
			<div class="col">
				<a href="/">식당 정보 수정</a>
			</div>
			<div class="col">
				<a href="/">식당 정보 삭제</a>
			</div>
		</div>
	</c:when>

	<c:when test="">
		<!-- 관리자 회원관리 사이드메뉴 -->
		<div class="col-3">
			<div class="col">
				<h3>MY</h3>
			</div>
			<div class="col">
				<a href="/">회원조회</a>
			</div>
			<div class="col">
				<a href="/">회원삭제</a>
			</div>
		</div>
	</c:when>

</c:choose>