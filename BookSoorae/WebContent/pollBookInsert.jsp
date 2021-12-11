<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>PICK BOOK</title>
<meta charset="utf-8">
<link href="review_list.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div class="top-line"></div>

<% 
		String userId = null;
		if(session.getAttribute("idKey")!=null){
			userId=(String)session.getAttribute("idKey");
		}
		if(userId==null){ //�α��� ���� ���� ���
	%>
	<div class="header">
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSoore</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./login_main.jsp'" class="login-button">Login</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage.jsp'" class="mypage-button">MyPage</button>  
		</div>
	</div>
<%}
		else{//�α��� �� ���
	%>
	<div class="header">
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSoore</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./logout.jsp'" class="login-button">Logout</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage.jsp'" class="mypage-button">MyPage</button>  
		</div>
	</div>
	   <%} %>

	<nav class="nav">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a onclick="location.href='review_list.jsp'">Review</a></li>
            <li><a href="mypage.jsp">Mypage</a></li>
    
        </ul>
    </nav>
	<div align="center">
		<br />
		<h2>��ǥ���α׷�</h2>
		<hr width="600" />
		<b>�����ۼ�</b>
		<hr width="600" />
		<form method="post" action="pollBookInsertProc.jsp">
			<table border="1" width="500">
				<tr>
					<td><b>����</b></td>
					<td colspan="2"><input name="question" size="30"></td>
				</tr>
				<tr>
					<td rowspan="10"><b>�׸�</b></td>
					<%
						for (int i = 1; i <= 4; i++) {
							out.println("<td>" + (i * 2 - 1)
									+ ": <input name='item'></td>");
							out.println("<td>" + (i * 2)
									+ ": <input name='item'></td>");
							out.println("</tr>");
							if (i == 9) {
								out.println("");
							} else {
								out.println("<tr>");
							}
						}//for end
					%>
				<tr>
					<td>������</td>
					<td colspan="2"><select name="sdateY">
							<option value="2021">2021
							<option value="2022">2022
							<option value="2023">2023
							<option value="2024">2024
							<option value="2025">2025
							
					</select>�� <select name="sdateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="sdateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan=2><select name="edateY">
							<option value="2021">2021
							<option value="2022">2022
							<option value="2023">2023
							<option value="2024">2024
							<option value="2025">2025
					</select>�� <select name="edateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="edateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������ǥ</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<input type="submit" value="�ۼ��ϱ�"> 
						<input type="reset" value="�ٽþ���"> 
						<input type="button" value="����Ʈ" onClick="javascript:location.href='pickbook.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>