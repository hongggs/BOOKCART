<%@ page contentType="text/html; charset=EUC-KR" %>
 <%@ page import="bookcart.ReviewBoardBean"%>
<% 
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  ReviewBoardBean bean = (ReviewBoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getUser_id(); 
	  String content = bean.getContent(); 
	  String writer=bean.getWriter();
	  String publisher=bean.getPublisher();
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("������ ���� �н����带 �Է��ϼ���.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FF9018"  height="21" align="center">�����ϱ�</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
	<tr>
     <td width="20%">�� ��</td>
     <td width="80%">
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
	</tr>
	<tr>
		<td>���̵�</td>
		<td><input name="user_id" size="50" value="<%=name%>" maxlength="30"></td>
	</tr>
	<tr>
     <td>�� ��</td>
     <td>
	  <input name="writer" size="50" value="<%=writer%>" maxlength="50">
	 </td>
	</tr>
	<tr>
     <td>���ǻ�</td>
     <td>
	  <input name="publisher" size="50" value="<%=publisher%>" maxlength="50">
	 </td>
	</tr>
    <tr>
     <td>�� ��</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>��� ��ȣ</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="�����Ϸ�" onClick="check()">
      <input type="reset" value="�ٽü���"> 
      <input type="button" value="�ڷ�" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>