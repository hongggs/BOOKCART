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
<title>책 등록</title>
<link href="./style.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#F4F4EF">
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr class="bookpost-title">
		<td bgcolor="#517D73" height="30" align="center" class="bookpost-title">책 등록</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="bookBoardPost" enctype="multipart/form-data">
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
				<td><input name="title" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">저자</td>
				<td><input name="writer" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">출판사</td>
				<td><input name="publisher" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">보증금</td>
				<td><input name="money" size="40" maxlength="30" ></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">대여</td>
					<td>가능<input type="radio" name="isValid" value="valid" checked>
					불가능<input type="radio" name="isValid" value="invalid"></td>
			</tr>
			<tr>
				<td bgcolor="#ADCCC5">내용</td>
				<td><textarea name="content" rows="10" cols="50" maxlength="1000" style="height:200px;"></textarea></td>
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
					 <input type="submit" value="등록">
				</td>
				<td colspan="2">
					 <input type="button" value="책 목록" onClick="javascript:location.href='bookList.jsp'">
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
