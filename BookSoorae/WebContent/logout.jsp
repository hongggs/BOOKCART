<%@ page contentType="text/html; charset=utf-8" %>
<%	session.invalidate(); %>
<script>
    alert("로그아웃 되었습니다.");
	location.href="login_main.jsp";
</script>