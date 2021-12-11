<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="pMgr" class="bookcart.PollMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	String[] itemnum = request.getParameterValues("itemnum");
	boolean flag = pMgr.updatePoll(num, itemnum);
	String msg = "투표가 등록되지 않습니다.";
	if (flag) {
		msg = "투표가 정상적으로 등록되었습니다.";
	}
%>
<script>
   alert("<%=msg%>");
   location.href="pickbook.jsp?num=<%=num%>";
</script>