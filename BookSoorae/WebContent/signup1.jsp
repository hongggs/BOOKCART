<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Sign-up Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
	<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css">
    <link rel="stylesheet" href="./signup.css">
</head>

<body>
	<% 
		String userId = null;
		if(session.getAttribute("idKey")!=null){
			userId=(String)session.getAttribute("idKey");
		}
		if(userId==null){ //로그인 되지 않은 경우
	%>
	<header>
        <h1>
            <img src="./images/logo.png" alt="shop" width="50" height="50">
            <a href="index.jsp">BookSooRae</a>
			
        </h1>
       
             <ul>
            <a class="button" href="#">MY PAGE</a>
            <a class="button" href="signup1.jsp">SIGN-UP</a>
            <a class="button" href="login_main.jsp">LOGIN</a>
            </ul>
        
    </header>
    <%}
		else{//로그인 된 경우
	%>
	<header>
        <h1>
            <img src="./images/logo.png" alt="shop" width="50" height="50">
            <a href="index.jsp">BookSooRae</a>
			
        </h1>
       
             <ul>
            <a class="button" href="#">MY PAGE</a>
            <a class="button" href="logout.jsp">LOGOUT</a>
            </ul>
        
    </header>
    <%} %>
    
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="bookList.jsp">market</a></li>
            <li><a onclick="location.href='review_list.jsp'"">Review</a></li>
            <li><a href="search.jsp">search</a></li>
    
        </ul>
    </nav>
    <aside id="left">
        
    </aside>
    <section id="main">
     <div class="signup">
    <h1>회원가입</h1>
    <form method="post" action="sign_up.jsp">
    <div class="sign-up-p">
        <label for="user-name" class="label-username">이름</label>
        <input name="name"><br/>

        <label for="loginid" class="labelid">아이디</label>
        <input name="user_id"><br/>

        <label for="loginpw" class="labelpw">비밀번호</label>
        <input type="password" name="pw"><br/>

        <label for="pw-check" class="labelpw">비밀번호 확인</label>
        <input type="password" name="pw"><br/>
        
        <label for="email" class="labelemail">이메일</label>
        <input type="email" name="email"><br/>

        <label for="phone-number" class="label-phone-num">휴대폰번호</label>
        <input type="number" name="phone"><br/>

        <label for="address-1" class="label-address1">거주지 시</label>
        <input type="text" name="area1"><br/>

        <label for="address-2" class="label-address2">거주지 동</label>
        <input type="text" name="area2"><br/>
    </div>
    <div>
        <button type="submit">회원가입</button>
        <button type="button" onclick="document.location.href='index.jsp'">메인페이지</button>  
    </div>
    </form>
     </div>
        
    </section>
    <aside id="right">
        
 
    </aside>
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
	

</body>
</html>