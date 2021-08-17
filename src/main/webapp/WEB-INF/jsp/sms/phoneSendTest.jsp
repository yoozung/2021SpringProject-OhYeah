<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <li>내용 : <textarea name="text"></textarea></li>
      <li><input type="button" onclick="sendSMS('phoneSendTest')" value="전송하기" /></li>
    </ul>
  </form>
</body>

<script>
function sendSMS(pageName)
{
	console.log("문자를 전송합니다.");
	$("#smsForm").attr("action, pageName+ ".jsp");
	$("#smsForm").submit();
}
</script>
</html>