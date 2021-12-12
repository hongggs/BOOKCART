<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="bookcart.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="bookcart.PollMgr" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
	<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css?ver=1">
</head>
<div class="top-line"></div>
<body>
	<% 
		String userId = null;
		if(session.getAttribute("idKey")!=null){
			userId=(String)session.getAttribute("idKey");
		}
		if(userId==null){ //로그인 되지 않은 경우
	%>
	<div class="header">
		<div class="header-left">
			<img src="./images/logo.png" alt="shop" width="50" height="50">
			<a href="./index.jsp">BookSooRe</a>
		</div>
		
		<div class="header-btns">
			<button onclick="location.href='./login_main.jsp'" class="login-button">Login</button>
            <button onclick="location.href='./signup1.jsp'" class="signup-button">Sign-Up</button>
            <button onclick="location.href='./mypage.jsp'" class="mypage-button">MyPage</button> 
		</div>
	</div>
    <%}
		else{//로그인 된 경우
	%>
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
    <%} %>
    
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bookList.jsp">Market</a></li>
            <li><a onclick="location.href='review_list.jsp'">Review</a></li>
			<li><a href="pickbook.jsp">PICKBOOK</a></li>   
            <li><a href="mypage.jsp">Mypage</a></li>        
    
        </ul>
    </nav>
	<div align="center">
		<br/>
		<h2> 책을 골라주세요 </h2>
		<br>
		<hr class="line" width="600"/>
		<h3 class="semi-title-1"> 최근에 올라온 설문  </h3>
		<!--폴 리스트 폼 자리-->
		<jsp:include page="pollBookForm.jsp" />
		<hr width="600" class="line" />
		<b class="semi-title">↓ 설문리스트 ↓</b>
		<!--폴 리스트 테이블 자리-->
		<table>
			<tr>
				<td>
					<table width="500" border="0" bgcolor="#C5E2E1">
						<tr>
							<td align="center"><b>번호</b></td>
							<td><b>제목</b></td>
							<td><b>시작일~종료일</b></td>
						</tr>
						<%
							  Vector<PollListBean> vlist = pMgr.getAllList();

							  int count = vlist.size();
							  for (int i = 0; i < vlist.size(); i++) {
								PollListBean plBean = vlist.get(i);
								int num = plBean.getNum();
								String question = plBean.getQuestion();
								String sdate = plBean.getSdate();
								String edate = plBean.getEdate();

								out.println("	<tr><td align='center'>" + count + "</td>");
								out.println("<td><a href='pickbook.jsp?num=" + num + "'>"
										+ question + "</a></td>");
								out.println("<td>" + sdate +" ~ "+ edate + "</td></tr>");
								count = count - 1;
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="pollBookInsert.jsp">설문 작성하기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>