<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="bookcart.MemberRegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String user_id = request.getParameter("user_id");
	boolean result = mMgr.checkId(user_id);
%>
<html>
<head>
<title>ID �ߺ�üũ</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center">
		<br/><b><%=user_id%></b>
		<%
			if (result) {
				out.println("�� �̹� �����ϴ� ID�Դϴ�.<p/>");
			} else {
				out.println("�� ��� �����մϴ�.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">�ݱ�</a>
	</div>
</body>
</html>