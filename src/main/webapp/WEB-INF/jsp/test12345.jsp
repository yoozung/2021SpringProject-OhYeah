<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Fragment/TagLib/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자서비스</title>
</head>
<body>

<form method="post" id="smsForm">
	<ul>
		<li>보낼사람 : <input type="text" name="from"/></li>
		<li>내용 : <textarea name="text"></textarea> </li>
		<li><input type="button" onclick="phoneSendSms('phoneMessageSend')" value="전송"/></li>
	</ul>
</form>

</body>

<script>
function phoneSendSms(pageName) {
	alert('버튼이 클릭되었습니다');
	console.log("문자를 전송합니다.");
	$("#smsForm").attr("action", pageName + ".do");
	$("#smsForm").submit();
	console.log(action);
}
</script>
</html>