<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${userName}"/>

<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>After Main</title>
</head>
<body>
<%@ include file="Fragment/inc/topBefore.jsp" %>
<h1>After MAIN</h1>
<c:choose>
	<c:when test="${empty userName}">
		<h3>WELCOME <c:out value="Guest"/> !!</h3>
	</c:when>
	<c:when test="${not empty userName}">
		<h3>WELCOME <c:out value="${userName}"/> !!</h3>
	</c:when>
</c:choose>
</body>
</html>