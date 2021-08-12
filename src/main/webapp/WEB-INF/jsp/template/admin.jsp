<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${userName}"/>
<c:set var="password" value="${password}"/>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>admin</title>
</head>
<body>
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<!-- start middle menu-->
	<div class="container admin">
		<div class="row middleMenu">
			<div class="row col-12">
				<div class="row col-8 tab_bar">
					<div class="col-6" onclick="go_manage();">SHOP MANAGE</div>
					<div class="col-6 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MEMBER MANAGE</div>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/admin/adminMemberList">LIST</a>
						<a class="dropdown-item" href="#">DROP</a>
						
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