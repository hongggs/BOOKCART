<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bookcart.MessageBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="MMgr" class="bookcart.MessageMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	Vector<MessageBean> vlist = null;
	String my_id=(String)request.getParameter("my_id");
	String from_id=(String)request.getParameter("from_id");
	System.out.print(my_id+", "+from_id);
%>
<script type="text/javascript">
	function sendMessage(contents){
		var pop_title = "message" ;
        
        window.open("", pop_title,'width=600, height=300') ;
        
        document.msgFrm.contents.value=contents
         
        var frmData = document.msgFrm ;
        frmData.target = pop_title ;
        frmData.action = "message_read.jsp" ;
         
        frmData.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- 외부 스타일시트 적용 -->
<link rel="stylesheet" href="./message.css">
<link rel="stylesheet" href="./index.css?ver=1">
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
			<hr align="center" width="100%" size="4" noshade />
          </header>
     
	<%
		vlist = MMgr.getMessageList(my_id,from_id);
		if (vlist.isEmpty()) {
				out.println("받은 쪽지가 없습니다.");
		} 
		else {
	%>
		<table align = "center" width="100%" cellpadding="3" cellspacing="3">
			<tr align="center" bgcolor="#517D73" height="120" class="table-head">
				<td>내용</td>
				<td>보낸 사람</td>
				<td>받는 사람</td>
				<td>시간</td>
			</tr>
			<%
				for (int i = 0;i<vlist.size(); i++) {
					MessageBean bean=vlist.get(i);
					String from=bean.getFrom();
					String to=bean.getTo();
					String wr_date=bean.getWr_date();
					String contents=bean.getContents();
			%>	
			<tr>
				<td align="center"  class="text_overflow">
					<a href="javascript:sendMessage('<%=contents%>')">
						<%=contents%></a>
				</td>
				<td align="center"><%=from%></td>
				<td align="center"><%=to%></td>
				<td align="center"><%=wr_date%></td>
			</tr>
			<% }%>
		</table>
		</main>
 	 </div>
	<%}%>
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
	


<form name="msgFrm" method="post" action="message.jsp">
<input type="hidden" name="from" value="<%=my_id%>">
<input type="hidden" name="to" value="<%=from_id%>">
<input type="hidden" name="contents">
</form>
</body>
</html>