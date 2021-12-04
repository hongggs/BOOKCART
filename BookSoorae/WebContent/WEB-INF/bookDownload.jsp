<%@page contentType="application; charset=utf-8"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>