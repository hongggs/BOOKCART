<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="MMgr" class="bookcart.MessageMgr"/>
<jsp:useBean id="MBean" class="bookcart.MessageBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	String contents=request.getParameter("contents");
	MMgr.insertMsg(from,to,contents);
	System.out.print(from+", "+to+", "+contents);
%>
<script type="text/javascript">
	self.close()
</script>
