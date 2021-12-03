<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="bookcart.BookBoardBean"%>
<% 
	  int book_id = Integer.parseInt(request.getParameter("book_id"));
	  String nowPage = request.getParameter("nowPage");
	  BookBoardBean bean = (BookBoardBean)session.getAttribute("bean");
	  String id = (String)session.getAttribute("idKey"); 
	  String user_id = bean.getUser_id();
	  String title = bean.getTitle();
	  String writer = bean.getWriter(); 
	  String publisher= bean.getPublisher();
	  int money= bean.getMoney();
	  String isValid = bean.getIsValid();
	  String content = bean.getContent(); 
	  String filename = bean.getFilename();
	  int filesize= bean.getFilesize();
%>
<html>
<head>
<title>책 목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
  </tr>
</table>
<form name="updateForm" method="post" action="bookBoardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
     <tr>
     <td width="15%">작성자</td>
     <td><%=user_id %></td>
    <tr>
     <td>책 제목</td>
     <td>
	  <input name="title" value="<%=title%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>저자</td>
     <td>
	  <input name="writer" size="50" value="<%=writer%>" maxlength="50">
	 </td>
	</tr>
	<tr>
     <td>출판사</td>
     <td>
	  <input name="publisher" size="50" value="<%=publisher%>" maxlength="50">
	 </td>
	</tr>
	<tr>
     <td>보증금</td>
     <td>
	  <input name="money" size="50" value="<%=money%>" maxlength="50">
	 </td>
	</tr>
	<tr>
		<td>대여</td>
			<td>가능<input type="radio" name="isValid" value="valid" checked>
			불가능<input type="radio" name="isValid" value="invalid"></td>
	</tr>
    <tr>
     <td>내용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
	 <tr>
     	<td>사진 첨부</td> 
     	<td><input type="file" name="filename" size="50" maxlength="50"></td>
     </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="submit" value="수정완료"></td><td>
      <input type="button" value="뒤로가기" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="book_id" value="<%=book_id%>">
</form> 
</div>
</body>
</html>
