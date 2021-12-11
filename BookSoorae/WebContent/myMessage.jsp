<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bookcart.MessageBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="MMgr" class="bookcart.MessageMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	Vector<String> vlist = null;
	String id=(String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Messages</title>
<script type="text/javascript">
	function readMsg(id){
		document.myFrm.from_id.value=id;
		console.log("read");
		console.log(document.myFrm.from_id.value);
		console.log(document.myFrm.my_id.value);
		document.myFrm.action="myMessageRead.jsp";
		document.myFrm.submit();
	}
</script>
</head>
<body bgcolor="#F4F4EF">
	<%
		vlist = MMgr.getFromId(id);
		if (vlist.isEmpty()) {
				out.println("받은 쪽지가 없습니다.");
		} 
		else {
	%>
	<table width="100%" cellpadding="2" cellspacing="0">
			<tr align="center" bgcolor="#C5E2E1" height="120%">
				<td>보낸사람</td>
			</tr>
			<%
				for (int i = 0;i<vlist.size(); i++) {
					String from_id=vlist.get(i);
			%>	
			<tr>
				<td align="center">
					<%=from_id%>
					<input type="button" value="쪽지확인" onclick="readMsg('<%=from_id%>');"/>
				</td>
			</tr>
			<% }%>
	</table>
	<form name="myFrm" method="post" action="myMessageRead.jsp">
		<input type="hidden" name="from_id"> 
		<input type="hidden" name="my_id" value="<%=id%>"> 
	</form>
<%}%>
</body>
</html>