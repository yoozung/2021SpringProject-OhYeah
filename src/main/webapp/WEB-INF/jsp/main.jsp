<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<head>
<meta charset="UTF-8">

<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>MAIN</title>
</head>
<body>
<%@ include file="Fragment/inc/topBefore.jsp" %>
<!-- start middle menu-->
	<div class="container consumer">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6 tab_line" onclick="#">SHOP SEARCH</div>
					<div class="col-6 tab_line" onclick="map();">MAP</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- end middle menu-->
<%@ include file="Fragment/inc/carousel.jsp" %>

		<div class="col-9">
			내용은 여기에 작성
			<c:choose>
	<c:when test="${empty userName}">
		<h1>WELCOME <c:out value="Guest"/> !!</h1>
	</c:when>
	<c:when test="${not empty userName}">
		<h1>WELCOME <c:out value="${userName}"/> !!</h1>
		<h3>Credential: <c:out value="${authorities}"/></h3>
	</c:when>
</c:choose>
		</div>

<%@ include file="Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>