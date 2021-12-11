<%@page contentType="text/html; charset=utf-8" %>
<%@page import="bookcart.BookBoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%	
	  request.setCharacterEncoding("utf-8");
	  String id = (String)session.getAttribute("idKey");
	  
      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  int pagePerBlock=15; //블럭당 페이지수 
	  
	  int totalPage=0; //전체 페이지 수
	  int totalBlock=0;  //전체 블럭수 

	  int nowPage=1; // 현재페이지
	  int nowBlock=1;  //현재블럭
	  
	  int start=0; //디비의 select 시작번호
	  int end=10; //시작번호로 부터 가져올 select 갯수
	  
	  int listSize=0; //현재 읽어온 게시물의 수

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
	 
	totalRecord = bMgr.getLendCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
<html>
<head>
<title>내 대여 목록</title>
<link href="./bookList.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
		document.listFrm.action = "myLendBook.jsp";
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
	
</script>
</head>
<body>
	<div class="top-line"></div>
	<div class="header">
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSoore</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./logout.jsp'" class="login-button">Logout</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage-button'" class="mypage-button">MyPage</button>  
		</div>
	</div>
	<nav class="nav">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bookList.jsp">Market</a></li>
            <li><a onclick="location.href='review_list.jsp'">Review</a></li>
            <li><a href="mypage.jsp">Mypage</a></li>
    
        </ul>
    </nav>
	<div class="write-btn">
		<a href="./bookPost.jsp">내 책도 등록하러 가기</a>
		<div class="pencil-icon"><i class="fas fa-pencil-alt"></i></div>
	</div>
	<div align="center">
	<br/>
	<h2>내 대여 목록</h2>
	<br/>
	<table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getLendList(keyField, keyWord, start, end);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
				  if (vlist.isEmpty()) {
			%>
			
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#C5E2E1" height="120%">
						<th>번호</th>
						<th>책 제목</th>
						<th>저자</th>
						<th>보증금</th>
						<th>작성자</th>
						<th>반납하기</th>
					</tr>
				  </table>
			<% 
			out.println("대여한 책이 없습니다.");} 
				  else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#C5E2E1" height="120%">
						<th>번호</th>
						<th>책 제목</th>
						<th>저자</th>
						<th>보증금</th>
						<th>작성자</th>
						<th>반납하기</th>
					</tr>
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							BookBoardBean bean = vlist.get(i);
							int book_id = bean.getBook_id();
							int lendbook_id = bean.getLendbook_id();
							String user_id = bean.getUser_id();
							String title = bean.getTitle();
							String writer = bean.getWriter();
							int money = bean.getMoney();
							String isValid = bean.getIsValid();
					%>
					<tr>
						<td align="center"><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
						<td align="center"><%=title%></td>
						<td align="center"><%=writer%></td>
						<td align="center"><%=money%>원</td>
						<td align="center"><%=user_id%></td>
						<form name="listFrm" method="post" action="returnBook.jsp">
						<td align="center"><input type="submit" value="반납하기"></td>
						</form>
					</tr>
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
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //하단 페이지 끝번호
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
 				<!-- 페이징 및 블럭 처리 End-->
			</td>
		</tr>
	</table>
	<hr width="600"/>
	<!-- <table width="600" cellpadding="4" cellspacing="0">
 		<tr>
			<td align="center" valign="bottom">
				<a href="bookPost.jsp">책 등록</a> 
			</td>
 		</tr>
	</table> -->
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="lendbook_id"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>
</body>
</html>
