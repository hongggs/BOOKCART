<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="bookcart.ReviewBoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="bookcart.ReviewBoardMgr" />
<%	
	  request.setCharacterEncoding("utf-8");
	  
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
	Vector<ReviewBoardBean> vlist = null;
	//검색 처리
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
		System.out.print("keyWord:"+keyWord);
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
	//현재 내가 접근한 페이지 계산
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	//페이지,블럭 계산
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
<html>
<head>
<title>REVIEW Board</title>
<meta charset="utf-8">
<link href="review_list.css?ver=1" rel="stylesheet" type="text/css">
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
	   alert("검색어를 입력하세요.");
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
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSoore</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./login_main.jsp'" class="login-button">Login</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage.jsp'" class="mypage-button">MyPage</button>  
		</div>
</div>
	<nav class="nav">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a onclick="location.href='review_list.jsp'">Review</a></li>
            <li><a href="mypage.jsp">Mypage</a></li>
    
        </ul>
    </nav>
<div class="search-area">
	<form name="searchFrm"  method="get" action="review_list.jsp">
		<div class="search-row">
			<select name="keyField" size="1"class="select-btn">
	    				<option value="user_id"> 이 름</option>
	    				<option value="subject"> 제 목</option>
	    				<option value="content"> 내 용</option>
	   		</select>
			<input type="text" name="keyWord"  class="search-input" placeholder="검색어를 입력하세요">
			<input type="button" class="search-btn" value="Search" onClick="javascript:check()">
		</div>
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
				<td><%=keyWord%>의 검색결과는 다음과 같습니다.</td>
			</tr>
		<%}%>
			<tr>
				<td>Total : <%=totalRecord%>Articles(<font color="black">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
			</tr>
	</table>
	<table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
				  if (vlist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#C5E2E1" height="120%">
						<td>번 호</td>
						<td>제 목</td>
						<td>이 름</td>
						<td>날 짜</td>
						<td>조회수</td>
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
				<td align="right">
					<a href="review_post.jsp">[글쓰기]</a> 
					<a href="javascript:list()">[처음으로]</a>
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