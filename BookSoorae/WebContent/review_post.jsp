<%@ page contentType="text/html; charset=utf-8" %>
<%
 		String id = (String)session.getAttribute("idKey");  
 		if(id!=null){
 		} 
		else{%>
<script>
alert("로그인이 필요한 서비스입니다");
location.href = "login_main.jsp";
</script>
		<%} %>
<html>
<head>
<title>JSP Board</title>
<link href="./review.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#F4F4EF">
<div align="center" class="review-post">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="#517D73" height="25" align="center" class="reviewpost-head">글쓰기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="boardPost">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%" bgcolor="#ADCCC5">제 목</td>
				<td width="90%">
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">아이디</td>
				<td>
				<%=id %></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">작 가</td>
				<td>
				<input name="writer" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">출판사</td>
				<td>
				<input name="publisher" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='review_list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>