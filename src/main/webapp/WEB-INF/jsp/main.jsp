<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="test01" value="This is test01" />
<c:set var="userName" value="${userName}"/>

<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resource/css/inc.css">

<title>${test01}</title>
</head>
<body>
<%@ include file="Fragment/inc/topBefore.jsp" %>
<h1>
MAIN
</h1>
<p>${test01}</p>
<c:if test="${userName ne null }">
	<p><c:out value="${userName}"/> WELCOME!!</p>
</c:if>
</body>
</html>