<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*, bookcart.*"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>
<%
		request.setCharacterEncoding("utf-8");

		String user_id=request.getParameter("user_id");
		String pw=request.getParameter("pw"); 
		String name = request.getParameter("name");
		String email=request.getParameter("email");
		String area1=request.getParameter("area1");
		String area2=request.getParameter("area2");
		String phone=request.getParameter("phone");
		regMgr.setRegister(user_id,pw,name,email,area1,area2,phone);
%>

<script>
    alert("회원가입을 축하합니다!");
	location.href="login_main.jsp";
</script>
