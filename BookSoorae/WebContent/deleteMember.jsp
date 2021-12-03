<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="bookcart.MemberRegisterBean"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login-Page</title>
<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css">
    <link rel="stylesheet" href="login.css">
    <!--로그인 css 연결-->
    
    <% 
		String userId = null;
		if(session.getAttribute("idKey")!=null){
			userId=(String)session.getAttribute("idKey");
		}
	%>
	
<% 
MemberRegisterBean bean = regMgr.getRegister(userId);//회원정보 가져오기
String user_id = bean.getUser_id(); 
	if (request.getParameter("pw") != null) {
		String inPass = request.getParameter("pw");
		String pw = bean.getPw();
		if (inPass.equals(pw)) {
			regMgr.deleteMember(user_id);			
			%>
			
<script type="text/javascript">
	alert("이용해주셔서 감사합니다.");
	<%	session.invalidate(); %>
	location.href="index.jsp";
</script>			

			<%
		} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delMember.pw.value == "") {
			alert("비밀번호를 입력하세요.");
			document.delMember.pw.focus();
			return false;
		}
		document.delMember.submit();
	}
</script>
</head>

<body>

<header>
        <h1>
            <img src="./images/logo.png" alt="shop" width="50" height="50">
            <a href="index.jsp">BookSooRae</a>
			
        </h1>
       
             <ul>
            <a class="button" href="#">MY PAGE</a>
            <a class="button" href="signup1.jsp">SIGN-UP</a>
            <a class="button" href="logout.jsp">LOGOUT</a>
            </ul>
        
    </header>

    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a href="review_list.jsp">Review</a></li>
            <li><a href="search.jsp">search</a></li>
    
        </ul>
    </nav>
<section id="main">
<div class="loginbox">
    

<h1>회원탈퇴</h1>

<form name=delMember method=post action="deleteMember.jsp">

<label for="loginpw" class="labelpw">패스워드</label>

<input type="password" name="pw">


<div class="btnwrap">

<input type="button" value="탈퇴하기" onClick="check()"> 
<input type="button" value="뒤로" onClick="history.go(-1)">


</div>

</form>

​

</div>
 </section>
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
​
	<%}%>
</body>

</html>