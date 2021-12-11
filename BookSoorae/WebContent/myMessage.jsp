<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bookcart.MessageBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="MMgr" class="bookcart.MessageMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	Vector<String> vlist = null;
	String id=(String)session.getAttribute("idKey");
	String keyWord = "";
	//검색 처리
		if (request.getParameter("keyWord") != null) {
			keyWord = request.getParameter("keyWord");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Messages</title>
<!-- 외부 스타일시트 적용 -->
<link rel="stylesheet" href="./message.css">
<link rel="stylesheet" href="./index.css?ver=1">
<script type="text/javascript">
	function readMsg(id){
		document.myFrm.from_id.value=id;
		console.log("read");
		console.log(document.myFrm.from_id.value);
		console.log(document.myFrm.my_id.value);
		document.myFrm.action="myMessageRead.jsp";
		document.myFrm.submit();
	}
	
</script>
</head>
<body>
	<% 
		String userId = null;
		if(session.getAttribute("idKey")!=null){
			userId=(String)session.getAttribute("idKey");
		}
		if(userId==null){ //로그인 되지 않은 경우
	%>
	<script>
    alert("로그인 후 접근가능합니다.");
	location.href="index.jsp";
	</script>
	
	<%}
		else{//로그인 된 경우
			%>
			 
	<div class="top-line"></div>
	<div class="header">
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSoore</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./logout.jsp'" class="login-button">Logout</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage.jsp'" class="mypage-button">MyPage</button>  
		</div>
	</div>
	<nav class="nav">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a onclick="location.href='review_list.jsp'">Review</a></li>
            <li><a href="pickbook.jsp">PickBook</a></li>
            <li><a href="./mypage.jsp">Mypage</a></li>
    
        </ul>
    </nav>
     <%} %>

	
	<div id="container">
    <main>
        <header>
            <h2>받은 쪽지함</h2>
            <form name="searchFrm"  method="get" action="myMessage.jsp">
				<input type="text" name="keyWord" placeholder="검색어를 입력하세요" >
			</form>
            
         
          </header>
          
          <%if(!keyWord.equals("")){  
			 vlist = MMgr.getFromIdSearch(id,keyWord);
			}
			else {   
			vlist = MMgr.getFromId(id);
          }%>
          
          <% 
			if (vlist.isEmpty()) {
				System.out.println("받은 쪽지가 없습니다.");
			} 
			else {
	     %>

          <ul>
          <%
				for (int i = 0;i<vlist.size(); i++) {
					String from_id=vlist.get(i);
			%>	
            <li type="button" onclick="readMsg('<%=from_id%>');">
              <img src="./images/face.svg" alt="">
              <div>
         
               	<h2><%=from_id%></h2>
                
              </div>
              
            </li>
             <%} %>
          </ul>

    </main>
  </div>
  <%} %>
  <footer>
        <div class="container">
            <a class="footerButton" href="https://www.nl.go.kr/" >
                <img class="btn-img" src="./images/national4.jpg" width="141" height="40">
            </a>

            <a class="footerButton" href="https://childlib.sen.go.kr/" >
                <img class="btn-img" src="./images/child.png">
            </a>
            
            <a class="footerButton" href="https://www.sblib.seoul.kr" >
                <img class="btn-img" src="./images/sungbuk.png">
            </a>
            
            <a class="footerButton" href="https://nslib.sen.go.kr" >
                <img class="btn-img" src="./images/namsan.png">
            </a>
          
            <a class="footerButton" href="https://www.nanet.go.kr/main.do" >
                <img class="btn-img" src="./images/nationalAssembly.png">
            </a>

        </div>
        <div class="container">
            Copyright© 성신여자대학교 웹정보프로그래밍_북수레
        </div>
      
    </footer>
  
	
	
	<form name="myFrm" method="post" action="myMessageRead.jsp">
		<input type="hidden" name="from_id"> 
		<input type="hidden" name="my_id" value="<%=id%>"> 
	</form>

</body>
</html>