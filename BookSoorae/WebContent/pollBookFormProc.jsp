<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="pMgr" class="bookcart.PollMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	String[] itemnum = request.getParameterValues("itemnum");
	boolean flag = pMgr.updatePoll(num, itemnum);
	String msg = "��ǥ�� ��ϵ��� �ʽ��ϴ�.";
	if (flag) {
		msg = "��ǥ�� ���������� ��ϵǾ����ϴ�.";
	}
%>
<script>
   alert("<%=msg%>");
   location.href="pickbook.jsp?num=<%=num%>";
</script>