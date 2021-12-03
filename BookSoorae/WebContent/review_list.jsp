<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="bookcart.ReviewBoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="bookcart.ReviewBoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
	  
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
	Vector<ReviewBoardBean> vlist = null;
	//�˻� ó��
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
	//���� ���� ������ ������ ���
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	//������,�� ���
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //��ü��������
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //����� ���
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //��ü�����
%>
<html>
<head>
<title>REVIEW Board</title>
<link href="review_list.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
		document.listFrm.action = "review_list.jsp";
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
		document.readFrm.num.value=num;
		document.readFrm.action="review_read.jsp";
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
<body bgcolor="#FFFFCC">
<div class="top-line"></div>
<div class="header">
	<i class="fas fa-book"></i>
	<h1>BookSoorae</h1>
	<div class="header-btns">
		<button type="button" class="signup-button">Sign-up</button>
		<button type="button" class="login-button">Login</button>
	</div>
</div>
<div class="search-area">
	<form name="searchFrm"  method="get" action="review_list.jsp">
		<select name="keyField" size="1" >
    				<option value="user_id"> �� ��</option>
    				<option value="subject"> �� ��</option>
    				<option value="content"> �� ��</option>
   		</select>
		<input type="text" name="keyWord"  class="search-input" placeholder="�˻�� �Է��ϼ���">
		<input type="button"  value="Search" onClick="javascript:check()">
		<input type="hidden" name="nowPage" value="1">
	</form>
</div>
<div align="center">
	<br/>
	<h2>REVIEW BOARD</h2>
	<br/>
	<table align="center" width="600">
		<%if(!keyWord.equals("")){ %>
			<tr>
				<td><%=keyWord%>�� �˻������ ������ �����ϴ�.</td>
			</tr>
		<%}%>
			<tr>
				<td>Total : <%=totalRecord%>Articles(<font color="red">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
			</tr>
	</table>
	<table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
				  if (vlist.isEmpty()) {
					out.println("��ϵ� �Խù��� �����ϴ�.");
				  } else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>�� ȣ</td>
						<td>�� ��</td>
						<td>�� ��</td>
						<td>�� ¥</td>
						<td>��ȸ��</td>
					</tr>
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							ReviewBoardBean bean = vlist.get(i);
							int num = bean.getRv_id();
							String name = bean.getUser_id();
							String subject = bean.getSubject();
							String regdate = bean.getWr_date();
							int depth = bean.getDepth();
							int count = bean.getHit();
					%>
					<tr>
						<td align="center">
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<td>
						<%
							  if(depth>0){
								for(int j=0;j<depth;j++){
									out.println("&nbsp;&nbsp;");
									}
								}
						%>
						  <a href="javascript:read('<%=num%>')"><%=subject%></a>
						</td>
						<td align="center"><%=name%></td>
						<td align="center"><%=regdate%></td>
						<td align="center"><%=count%></td>
						</tr>
					<%}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
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
				<td align="right">
					<a href="review_post.jsp">[�۾���]</a> 
					<a href="javascript:list()">[ó������]</a>
				</td>
			</tr>
		</table>
	<hr width="600"/>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="num"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>
</body>
</html>