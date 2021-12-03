<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<title>책</title>
<link href="style.css" rel="stylesheet" type="text/css">

<% 

	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int book_id = Integer.parseInt(request.getParameter("book_id"));
		
	bMgr.deleteBoard(book_id);
	String url = "bookList.jsp?nowPage=" + nowPage;
	response.sendRedirect(url);
%>
