<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
	<!-- 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="./index.css">
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
         <h1>search-웹사이트 북수레 검색 페이지 입니다.</h1>
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