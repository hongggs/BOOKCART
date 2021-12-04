<%@ page contentType="text/html; charset=utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import="bookcart.MemberRegisterBean"%>
<jsp:useBean id="regMgr" class="bookcart.MemberRegisterMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./index.css">
<link rel="stylesheet" href="./signup.css">
<title>mypagef</title>
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
			 

<div class="mypage">
   <h1>마이페이지</h1>

	<div class="mypost">
	<%--내 review, 내 bookcart 넣는 큰 틀 --%>
	
	<h3><%=userId %>님의 마이페이지 </h3>
	
		<div style="border: 1px; float: right; width: 30%; padding:10px;">
		<%--내 book  --%>
		<h3>내가 작성한 책 보러가기 </h3>
		<button type="button" onclick="document.location.href='myBookList.jsp'">bookmarket</button>
		</div>
		
		<div style="border: 1px; float: right; width: 30%; padding:10px;">
    	<%--내 review --%>
    	<h3>내가 작성한 리뷰 보러가기 </h3>
    	<button type="button" onclick="document.location.href='myBookList.jsp'">내북리뷰jsp만들어서넣어야됨</button>
    	</div>
	
	</div>
    <div class="mybutton">
    <%--버튼2개(회원정보수정, 탈퇴하기) 넣는 큰 틀 --%>
   		<div style="border: 1px; float: right; width: 30%; padding:10px;">
   		<%--회원정보 수정 버튼 --%>
   		<button type="button" onclick="document.location.href='update_member.jsp'">회원정보 확인 및 수정</button> 
   		</div>
   		<div style="border: 1px; float: right; width: 30%; padding:10px;">
   		<%--탈퇴하기 버튼 --%>
   		<button type="button" >탈퇴하기</button> 
   		</div>
    </div>
    
    <%}%> 
 </div> 
</body>
</html>