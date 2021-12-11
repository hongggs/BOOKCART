<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
%>
<script type="text/javascript">
	function sendMessage(){
		document.msgFrm.action = "messageProc.jsp";
		document.msgFrm.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>쪽지</title>
</head>
<body bgcolor="#F4F4EF">
<form name="msgFrm" method="post" action="messageProc.jsp">
	<textarea rows="10" cols="60" name="contents"></textarea>
	<input type="hidden" name="from" value="<%=from%>">
	<input type="hidden" name="to" value="<%=to%>">
</form>
<input type="button" value="보내기" onclick="sendMessage();"/>

</body>
</html>