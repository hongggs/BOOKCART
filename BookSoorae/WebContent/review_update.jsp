<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="bookcart.ReviewBoardBean"%>
 <%
 		String id = (String)session.getAttribute("idKey");  
 		if(id!=null){
 		} 
		else{%>
<script>
alert("로그인이 필요한 서비스입니다");
location.href = "login_main.jsp";
</script>
		<%} 
 	
 		ReviewBoardBean bean = (ReviewBoardBean)session.getAttribute("bean");
 		if(!bean.getUser_id().equals(id)){%>
<script>
alert("권한이 없습니다");
location.href = "review_list.jsp";
</script>			
<% }
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String name = bean.getUser_id(); 
	  String content = bean.getContent(); 
	  String writer=bean.getWriter();
	  String publisher=bean.getPublisher();
%>
<html>
<head>
<title>JSP Board</title>
<link href="./review.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#F4F4EF">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#517D73"  height="21" align="center" class="update-head">수정하기</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
	<tr>
     <td width="20%">제 목</td>
     <td width="80%">
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=name%></td>
	</tr>
	<tr>
     <td>작 가</td>
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
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>