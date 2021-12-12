<%@ page contentType="text/html; charset=utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import="bookcart.MemberRegisterBean"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" href="./index.css?ver=1">
 <link rel="stylesheet" href="./mypage.css?ver=1">
<title>mypage</title>

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
  <section id="mypage-main">
     
	 <div class="mypage">
      <div class="my">
      <div class="thumb-wrapper stagger-item">
        <a href="index.jsp"
          ><img class="thumb" src="images/logo.png"
        /></a>
        
      </div>

      <div class="text-area">
        <h3 class="greeting stagger-item"><%=userId %>님의 마이페이지 </h3>
      </div>
    </div>

    <ul class="list">
      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/bookcart.svg" />
          <div  style=" cursor: pointer;" onclick="location.href='myBookList.jsp';" class="name">내가 쓴 Bookcart 목록</div>
        </div>
      </li>
	    
      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/bookcart.svg" />
          <div  style=" cursor: pointer;" onclick="location.href='myLendBook.jsp';" class="name">내 대여 목록</div>
        </div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/review.svg" />
          <div style=" cursor: pointer;" onclick="location.href='myReview.jsp';"class="name">내가 쓴 review 목록</div>
        </div>
      </li>
      
      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/chat.svg" />
          <div style=" cursor: pointer;" onclick="location.href='myMessage.jsp';"class="name">쪽지함</div>
        </div>
      </li>
      
      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/member.svg" />
          <div style=" cursor: pointer;" onclick="location.href='update_member.jsp';"class="name">회원 정보 수정</div>
        </div>
      </li>

      <li class="item mouse-effect stagger-item">
        <div class="left">
          <img src="images/delete.svg" />
          <div style=" cursor: pointer;" onclick="location.href='deleteMember.jsp';"class="name">탈퇴</div>
        </div>
      </li>
      
    </ul>
  </div>
 
</section>

	
</body>
</html>