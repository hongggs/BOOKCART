<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int book_id = Integer.parseInt(request.getParameter("book_id"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  String id = (String)session.getAttribute("idKey");  
	  bMgr.upCount(book_id);//조회수 증가
	  BookBoardBean bean = bMgr.getBoard(book_id);//게시물 가져오기
	  String user_id = bean.getUser_id();
	  String title = bean.getTitle();
	  String writer = bean.getWriter();
      String publisher = bean.getPublisher();
      int money = bean.getMoney();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String isValid = bean.getIsValid();
	  int hit = bean.getHit();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>책 목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
   <tr>
    <td align="center" bgcolor="#DDDDDD" width="15%"> 작성자 </td>
 	<td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=user_id%></td>
   </tr>
 <tr> 
 	<td align="center" bgcolor="#DDDDDD" width="15%"> 책 제목 </td>
 	<td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=title%></td>
 	<td align="center" bgcolor="#DDDDDD" width="15%"> 저자 </td>
 	<td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=writer%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD" width="15%"> 출판사 </td>
    <td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=publisher%></td>
    <td align="center" bgcolor="#DDDDDD" width="15%"> 보증금 </td>
    <td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=money%>원</td>
 </tr>
 <tr> 
     <td align="center" bgcolor="#DDDDDD" width="15%">첨부파일</td>
     <td bgcolor="#FFFFE8">&nbsp;
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	 </td>
	 <td align="center" bgcolor="#DDDDDD" width="15%"> 대여 </td>
     <td bgcolor="#FFFFE8">&nbsp;&nbsp;<%=isValid%></td>
 </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     	조회수  <%=hit%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 <% if(id!=null && id.equals(user_id)){ 
 %>
 <a href="javascript:list()" >책 목록</a> 
 <a href="bookUpdate.jsp?nowPage=<%=nowPage%>&book_id=<%=book_id%>" >수 정</a> 
 <a href="bookDelete.jsp?nowPage=<%=nowPage%>&book_id=<%=book_id%>">삭 제</a> <br/>
  </td>
  <%} else{%>  <a href="javascript:list()" >책 목록</a> <% }%>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="bookList.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>
