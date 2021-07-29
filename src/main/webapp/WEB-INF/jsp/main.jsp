<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/Taglib.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="test01" value="This is test01" />
<c:set var="userName" value="${userName}"/>

<head>
<meta charset="UTF-8">
<title>${test01}</title>
</head>
<body>
<%@ include file="Fragment/TopNav/topNav.jsp" %>
<h1>
MAIN
</h1>
<p>${test01}</p>
<c:if test="${userName ne null }">
	<p><c:out value="${userName}"/> WELCOME!!</p>
</c:if>
</body>
</html>