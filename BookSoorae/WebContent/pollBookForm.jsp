<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="bookcart.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="bookcart.PollMgr" />
<head>
<title>PICK BOOK</title>
<meta charset="utf-8">
<link href="review_list.css?ver=1" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<%
	  int num = 0;

	  if(!(request.getParameter("num")==null || request.getParameter("num").equals(""))){
		 num = Integer.parseInt(request.getParameter("num"));
	  }
	
	  PollListBean plBean = pMgr.getList(num);
	  Vector<String> vlist = pMgr.getItem(num);

	  String question = plBean.getQuestion();
	  int type = plBean.getType();
	  int active = plBean.getActive();
%>
<form method="post" action="pollBookFormProc.jsp">
<table border="1" width="300">
	<tr>
		<td colspan="2">Q : <%=question%></td>
	</tr>
	<tr>
		<td colspan="2">
			<%
				for(int i=0; i<vlist.size(); i++){
					String itemList = vlist.get(i);
					if(type==1){
						out.println("<input type=checkbox name='itemnum' value='"+i+"'>");
					}else{
						out.println("<input type=radio name='itemnum' value='"+i+"'>");
					}
					out.println(itemList+"<br>");
				}//for end
			%>
		</td>
	</tr>
	<tr>
		<td>
			<%
				if(active==1){
						out.println("<input type='submit' value='��ǥ'>");
					}else{
						out.println("��ǥ");
					}
			%>
		</td>
		<td>
		<input type="button" value="���" 
		onclick="javascript:window.open('pollBookView.jsp?num=<%=num%>',
		               'PollBookView','width=500, height=350')">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
</form>