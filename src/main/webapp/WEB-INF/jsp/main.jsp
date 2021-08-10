<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="userName" value="${userName}"/>
<c:set var="password" value="${password}"/>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>MAIN</title>
</head>
<body>
<%@ include file="Fragment/inc/topBefore.jsp" %>
<c:choose>
	<c:when test="${empty userName}">
		<h1>WELCOME <c:out value="Guest"/> !!</h1>
	</c:when>
	<c:when test="${not empty userName}">
		<h1>WELCOME <c:out value="${userName}"/> !!</h1>
		<h3>Credential: <c:out value="${password}"/></h3>
	</c:when>
</c:choose>
</body>
</html>