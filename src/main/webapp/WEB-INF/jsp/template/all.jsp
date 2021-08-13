<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${member.getName()}"/>
<c:set var="authorities" value="${member.getRole()}"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OhYeah!!</title>
</head>
<body> 
<%@ include file="../Fragment/inc/topBefore.jsp" %>
<div class="container-fluid mainSector1">
	<c:if test="${authorities eq 'ROLE_CONSUMER'}">
	<%@ include file="../Fragment/inc/carousel.jsp" %>
	</c:if>
	<c:if test="${authorities eq NULL}">
	<%@ include file="../Fragment/inc/carousel.jsp" %>
	</c:if>
</div>
<div class="container-fluid mainSectorM1">
</div>
<div class="container-fluid mainSector2">
	<c:if test="${authorities eq 'ROLE_CONSUMER'}">
	<%@ include file="../Fragment/inc/mainSector2.jsp" %>
	</c:if>
	<c:if test="${authorities eq NULL}">
	<%@ include file="../Fragment/inc/mainSector2.jsp" %>
	</c:if>
</div>

<%@ include file="../Fragment/inc/footer.jsp"%>
</body>
<script type="text/javascript" src="/resource/js/common.js"></script>
</html>