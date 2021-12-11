<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	String contents=request.getParameter("contents");
%>
<script type="text/javascript">
	function sendMessage(){
			var pop_title = "message" ;
        
        	window.open("", pop_title,'width=600, height=300') ;
         
       		 var frmData = document.msgFrm ;
        	frmData.target = pop_title ;
        	frmData.action = "message.jsp" ;
         
        	frmData.submit();
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
	 
	<h4 align ="center"><%=from%>로부터 도착한 쪽지</h4>
	<hr align="center" width="100%" size="4" noshade />
	<ul>
	<li float:left><h5>내용: </h5></li>
	<h5> <%=contents%></h5>
	</ul>
	
	<input type="hidden" name="from" value="<%=from%>">
	<input type="hidden" name="to" value="<%=to%>">
</form>
<input type="button" value="답장" onclick="sendMessage();"/>
<input type="button" value="취소" onClick="closeWindow();"/>

</body>
</html>