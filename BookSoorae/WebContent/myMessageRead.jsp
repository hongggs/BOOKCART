<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bookcart.MessageBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="MMgr" class="bookcart.MessageMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	Vector<MessageBean> vlist = null;
	String my_id=(String)request.getParameter("my_id");
	String from_id=(String)request.getParameter("from_id");
	System.out.print(my_id+", "+from_id);
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
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="#F4F4EF">
	<%
		vlist = MMgr.getMessageList(my_id,from_id);
		if (vlist.isEmpty()) {
				out.println("받은 쪽지가 없습니다.");
		} 
		else {
	%>
	<table width="100%" cellpadding="2" cellspacing="0">
			<tr align="center" bgcolor="#C5E2E1" height="120%">
				<td>내용</td>
				<td>보낸 사람</td>
				<td>받는 사람</td>
				<td>시간</td>
			</tr>
			<%
				for (int i = 0;i<vlist.size(); i++) {
					MessageBean bean=vlist.get(i);
					String from=bean.getFrom();
					String to=bean.getTo();
					String wr_date=bean.getWr_date();
					String contents=bean.getContents();
			%>	
			<tr>
				<td align="center">
					<a href="javascript:sendMessage()">
						<%=contents%> </a>
				</td>
				<td align="center"><%=from%></td>
				<td align="center"><%=to%></td>
				<td align="center"><%=wr_date%></td>
			</tr>
			<% }%>
	</table>
<%}%>
<form name="msgFrm" method="post" action="message.jsp">
<input type="hidden" name="from" value="<%=my_id%>">
<input type="hidden" name="to" value="<%=from_id%>">
</form>
</body>
</html>