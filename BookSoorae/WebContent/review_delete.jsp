<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="bookcart.ReviewBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.ReviewBoardMgr" />
<%
	request.setCharacterEncoding("utf-8");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if(!bMgr.check(num,session.getAttribute("idKey").toString())){
%>
	<script>
	alert("권한이 없습니다");
	location.href = "review_list.jsp";
	</script>	
<% 	}
	else{
	ReviewBoardBean bean = (ReviewBoardBean) session.getAttribute("bean");
	bMgr.deleteBoard(num);
	String url = "review_list.jsp?nowPage=" + nowPage;
	response.sendRedirect(url);
	}
%>
