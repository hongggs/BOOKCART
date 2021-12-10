<%@ page contentType="text/html; charset=utf-8" %>
 <%@ page import="bookcart.BookBoardBean"%>
<% 
	  int book_id = Integer.parseInt(request.getParameter("book_id"));
	  String nowPage = request.getParameter("nowPage");
	  BookBoardBean bean = (BookBoardBean)session.getAttribute("bean");
	  String id = (String)session.getAttribute("idKey"); 
	  String user_id = bean.getUser_id();
		if(!id.equals(user_id)){
%>
<script>
alert("수정권한이 없습니다.")
</script>
<% 	}
			
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
<link href="./style.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#F4F4EF">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#517D73" height="30" align="center" class="bookpost-title">수정하기</td>
  </tr>
</table>
<form name="updateForm" method="post" action="bookBoardUpdate">
<table width="600" cellpadding="3" align="center">
	<tr class="bookpost-table">
		<td align=center>
		<table align="center">
    <tr>
				<td bgcolor="#ADCCC5">작성자</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">책 제목</td>
				<td><input name="title" value="<%=title%>"size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">저자</td>
				<td><input name="writer" value="<%=writer%>" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">출판사</td>
				<td><input name="publisher" value="<%=publisher%>" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">보증금</td>
				<td><input name="money" value="<%=money%>" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">대여</td>
					<td>가능<input type="radio" name="isValid" value="valid" checked>
					불가능<input type="radio" name="isValid" value="invalid"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">내용</td>
				<td><textarea name="content" rows="10" cols="50" maxlength="1000" style="height:200px;"><%=content%></textarea></td>
			</tr>
			<tr>
			 <tr>
     			<td bgcolor="#ADCCC5">사진 첨부</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
			<tr>
				<td colspan="2"><hr/></td>
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
