<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<title>å</title>
<link href="style.css" rel="stylesheet" type="text/css">

<%
	request.setCharacterEncoding("utf-8");
	String nowPage = request.getParameter("nowPage");
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	int lendbook_id = Integer.parseInt(request.getParameter("lendbook_id"));
	System.out.print(book_id+", "+lendbook_id);
	bMgr.returnBook(book_id, lendbook_id);
	String url = "myLendBook.jsp?nowPage=" + nowPage;
	response.sendRedirect(url);
%>
