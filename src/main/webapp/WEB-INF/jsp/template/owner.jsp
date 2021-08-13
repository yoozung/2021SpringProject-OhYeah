<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${userName}"/>
<c:set var="password" value="${password}"/>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>owner</title>
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<!-- start middle menu-->

	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 asd1 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SHOP MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">등록신청</a>
							<a class="dropdown-item" href="#">내 식당 조회</a>
							<a class="dropdown-item" href="#">식당 정보 수정 신청</a>
							<a class="dropdown-item" href="#">식당 정보 삭제 신청</a>
							
						</div>
					</div>
					<div class="col-6 asd2 tab_line">
						<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">WAIT MANAGE</div>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">식당 상황 알리기</a>
							<a class="dropdown-item" href="#">대기자 호출</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
<%@ include file="../Fragment/inc/carousel.jsp" %>






	<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>