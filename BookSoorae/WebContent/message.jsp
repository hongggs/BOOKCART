<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
%>
<script type="text/javascript">
	function sendMessage(){
		 if (document.msgFrm.contents.value == "") {
			   alert("내용을 입력하세요.");
			   document.msgFrm.contents.focus();
			   return;
			     }
		 else{
				document.msgFrm.action = "messageProc.jsp";
				document.msgFrm.submit();
				}
		
	}
	function closeWindow(){
		self.opener=self;
		window.close();
	}
	function check() {
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
	 
	<h4 align ="center">쪽지보내기</h4>
	<hr align="center" width="100%" size="4" noshade />
	<ul>
	<li float:left><h5>내용: </h5></li>
	<textarea rows="15" cols="55" name="contents"></textarea>
	</ul>
	
	<input type="hidden" name="from" value="<%=from%>">
	<input type="hidden" name="to" value="<%=to%>">
</form>
<input type="button" value="보내기" onclick="sendMessage();"/>
<input type="button" value="취소" onClick="closeWindow();"/>

</body>
</html>