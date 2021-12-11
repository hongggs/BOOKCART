<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="bookcart.MemberRegisterBean"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" href="./index.css">
 <link rel="stylesheet" href="./updatemember.css">

<title>Insert title here</title>
</head>
<body bgcolor="#F4F4EF">
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
    

	<% 
	  //회원정보를 bean에 저장.
	  MemberRegisterBean bean = regMgr.getRegister(userId);//회원정보 가져오기
	  String user_id = bean.getUser_id();
	  String password = bean.getPw();
      String name = bean.getName();
	  String email = bean.getEmail();
	  String area1 = bean.getArea1();
	  String area2 = bean.getArea2();
	  String phone = bean.getArea2();
	  session.setAttribute("bean", bean);//회원정보를 세션에 저장.
	  System.out.println("bean객체 끌고오기"+user_id+password+name);
	
	  //저장한 bean을 가져옴
	  MemberRegisterBean bean2 = (MemberRegisterBean)session.getAttribute("bean");
	  //String userId = bean.getUser_id(); //수정 권한 x
	   password = bean2.getPw(); //보통 웹사이트의 회원정보 수정페이지는 비밀번호 띄워주지X
	   name = bean2.getName(); //수정 권한 x
	   email=bean2.getEmail();
	   area1=bean2.getArea1();
	   area2=bean2.getArea2();
	   phone=bean2.getPhone();
	  
  %>
 <aside id="left">
        
   </aside>
 

 <section  id="main">
  <div class="updateMember">
   <h1>정보 수정</h1>
  <form name="updateMemberFrm" method="post" action="memberUpdate">
    <div class="update-Member-p">
        <label for="user-name" class="label-username">이름</label>
        <input name="name" value="<%=name%>" ><br/>

        <label for="loginid" class="labelid">아이디</label>
        <input type="text" name="user_id" disabled value="<%=userId%>" ><br/>

        <label for="loginpw" class="labelpw">비밀번호</label>
        <input type="password" name="pw" required><br/>

        <label for="pw-check" class="labelpw">비밀번호 확인</label>
        <input type="password" name="pw" required><br/>
        
        <label for="email" class="labelemail">이메일</label>
        <input type="email" name="email" value="<%=email%>"><br/>

        <label for="phone-number" class="label-phone-num">휴대폰번호</label>
        <input type="number" name="phone"value="<%=phone%>"><br/>

        <label for="address-1" class="label-address1">거주지 시</label>
        <input type="text" name="area1"value="<%=area1%>"><br/>

        <label for="address-2" class="label-address2">거주지 동</label>
        <input type="text" name="area2"value="<%=area2%>"><br/>
        <div>
	        <button type="submit">회원정보수정</button>
	        <button type="button" onClick="history.go(-1)">취소</button>  
    	</div>
    </div>

</form>
 </div> 
   <%}%> 
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