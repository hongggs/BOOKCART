<%@page contentType="text/html; charset=EUC-KR" %>
<%@page import="bookcart.BookBoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
      int totalRecord=0; //��ü���ڵ��
	  int numPerPage=10; // �������� ���ڵ� �� 
	  int pagePerBlock=15; //���� �������� 
	  
	  int totalPage=0; //��ü ������ ��
	  int totalBlock=0;  //��ü ���� 

	  int nowPage=1; // ����������
	  int nowBlock=1;  //�����
	  
	  int start=0; //����� select ���۹�ȣ
	  int end=10; //���۹�ȣ�� ���� ������ select ����
	  
	  int listSize=0; //���� �о�� �Խù��� ��

	String keyWord = "", keyField = "";
	Vector<BookBoardBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //��ü��������
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //����� ���
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //��ü�����
%>
<html>
<head>
<title>�� å ���</title>
<link href="bookList.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
		document.listFrm.action = "myBookList.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		console.log("num:"+ num)
		document.readFrm.book_id.value = num;//�̰� �̸��� �߸���
		document.readFrm.action="bookRead.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	   if (document.searchFrm.keyWord.value == "") {
	   alert("�˻�� �Է��ϼ���.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
	 }

</script>
</head>
<body>
	<div class="top-line"></div>
	<div class="header">
		<div class="header-left">
			<div class="book-icon"><i class="fas fa-book fa-2x"></i></div>
			<h1>BookSoorae</h1>
		</div>
		
		<div class="header-btns">
			<button type="button" class="signup-button">Sign-up</button>
			<button type="button" class="login-button">Login</button>
		</div>
	</div>
	<div class="write-btn">
		<button type="button">�� �ۼ��Ϸ� ����
			<i class="fas fa-pencil-alt"></i>
		</button>
	</div>
	<div align="center">
	<br/>
	<h2>�� å ���</h2>
	<br/>
	<form name="searchFrm"  method="get" action="myBookList.jsp" >
	<table width="600" cellpadding="2" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="idKey"> �ۼ��� </option> 
    				<option value="title"> å ���� </option>
    				<option value="writer"> ���� </option>
    				<option value="content"> ���� </option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
	</form>
	<table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
				  if (vlist.isEmpty()) {
			%>
			
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<th>��ȣ</th>
						<th>å ����</th>
						<th>����</th>
						<th>������</th>
						<th>�뿩����</th>
						<th>�ۼ���</th>
					</tr>
				  </table>
			<% 
			out.println("��ϵ� å�� �����ϴ�.");} 
				  else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<th>��ȣ</th>
						<th>å ����</th>
						<th>����</th>
						<th>������</th>
						<th>�뿩����</th>
						<th>�ۼ���</th>
					</tr>
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							BookBoardBean bean = vlist.get(i);
							int book_id = bean.getBook_id();
							String user_id = bean.getUser_id();
							String title = bean.getTitle();
							String writer = bean.getWriter();
							int money = bean.getMoney();
							String isValid = bean.getIsValid();
							  
					%>
					<% if(id!=null && id.equals(user_id)){ %>
					<tr>
						<td align="center">
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<td>
						  <a href="javascript:read('<%=book_id%>')"><%=title%></a>
						</td>
						<td align="center"><%=writer%></td>
						<td align="center"><%=money%>��</td>
						<td align="center"><%=isValid%></td>
						<td align="center"><%=user_id%></td>
					</tr>
					<% if(user_id==null){out.println("��ϵ� å�� �����ϴ�.");} %>
					<%}else{} %>
					<%}//for%>
				</table> <%
 			}//if
 		%>
 		</td>
		<tr>
			<td colspan="2"><br /><br /></td>
		</tr>
		<tr>
			<td>
			<!-- ����¡ �� �� ó�� Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //�ϴ� ������ ���۹�ȣ
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //�ϴ� ������ ����ȣ
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					[<%=pageStart %>] 
     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
    					<%}//for%>&nbsp; 
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 				<!-- ����¡ �� �� ó�� End-->
			</td>
		</tr>
	</table>
	<hr width="600"/>
	<table width="600" cellpadding="4" cellspacing="0">
 		<tr>
			<td align="center" valign="bottom">
				<a href="bookPost.jsp">å ���</a> 
			</td>
 		</tr>
	</table>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="book_id"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>
</body>
</html>
