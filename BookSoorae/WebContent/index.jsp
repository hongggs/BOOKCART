<%@ page contentType="text/html; charset=utf-8" %>

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
			<a href="./index.jsp">BookSoorae</a>
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
            <li><a href="mypage.jsp">Mypage</a></li>
    
        </ul>
    </nav>
    <section id="main">
        <!-- <div class="img-wrapper"> -->
        	<img src="https://i.pinimg.com/564x/ea/82/9c/ea829cd86dd1e01211c3dc099a2255e6.jpg" class="main-img">
        <!-- </div> -->
        <div class="main-right">
	        <h1>About BookSooRe  -  북수레를 소개합니다</h1>
	        <p>북수레는 책장 한켠에서 잠자고 있는 책들을 주변의 이웃들과 공유, 빌려볼 수 있도록 하는 플랫폼입니다.<br/>
	        사놓았던 책들, 한번 읽고 방치하기에는 너무 아깝지 않나요? 주변 지역의 사람들과 당신의 책을 나눠 읽어요!<br/>
	        도서관이나 서점까지 갈 필요 없이 간단하게 대여 신청을 해서 근처 이웃에게 빌려 읽어 보아요.<br/>
	        북수레를 통해 사람들과 독서의 가치를 나눌 수 있도록 도와드릴게요. 
	        </p>
	        
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
	

</body>
</html>