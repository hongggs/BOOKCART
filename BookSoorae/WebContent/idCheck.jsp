<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="bookcart.MemberRegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String user_id = request.getParameter("user_id");
	boolean result = mMgr.checkId(user_id);
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center">
		<br/><b><%=user_id%></b>
		<%
			if (result) {
				out.println("는 이미 존재하는 ID입니다.<p/>");
			} else {
				out.println("는 사용 가능합니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>