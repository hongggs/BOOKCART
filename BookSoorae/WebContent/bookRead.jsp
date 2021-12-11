<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="bookcart.BookBoardBean"%>
<jsp:useBean id="bMgr" class="bookcart.BookBoardMgr" />
<%
	  request.setCharacterEncoding("utf-8");
	  int book_id = Integer.parseInt(request.getParameter("book_id"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  String id = (String)session.getAttribute("idKey");  
	  bMgr.upCount(book_id);//조회수 증가
	  BookBoardBean bean = bMgr.getBoard(book_id);//게시물 가져오기
	  String user_id = bean.getUser_id();
	  String title = bean.getTitle();
	  String writer = bean.getWriter();
      String publisher = bean.getPublisher();
      int money = bean.getMoney();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String isValid = bean.getIsValid();
	  int hit = bean.getHit();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<script type="text/javascript">
	function sendMessage(){
		var pop_title = "message" ;
        
        window.open("", pop_title,'width=600, height=300') ;
         
        var frmData = document.msgFrm ;
        frmData.target = pop_title ;
        frmData.action = "message.jsp" ;
         
        frmData.submit() ;

		//document.msgFrm.submit();
		//window.open("message.jsp","message",'width=600, height=300')

	}
</script>
<html>
<head>
<title>책 목록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="./review.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#F4F4EF" class="review-read">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#517D73" height="25" align="center" class="table-head">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
   <tr>
 	 <td align="center" bgcolor="#ADCCC5" width="10%"> 이 름 </td>
     <td><%=user_id%></td>
   </tr>
 <tr> 
	<td align="center" bgcolor="#ADCCC5" width="10%"> 책 제목 </td>
     <td><%=title%></td> 
     <td align="center" bgcolor="#ADCCC5" width="10%"> 저자 </td>
     <td><%=writer%></td>
 </tr>
 <tr> 
 	<td align="center" bgcolor="#ADCCC5" width="10%">출판사</td>
     <td><%=publisher%></td> 
     <td align="center" bgcolor="#ADCCC5" width="10%"> 보증금  </td>
     <td><%=money%></td> 
    
 </tr>
 <tr> 
     <td align="center" bgcolor="#ADCCC5" width="15%">첨부파일</td>
     <td>
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
	 </td>
	 <td align="center" bgcolor="#ADCCC5" width="15%"> 대여 </td>
     <td ><%=isValid%></td>
 </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     	조회수  <%=hit%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 <% if(id!=null && id.equals(user_id)){ 
 %>
 <a href="javascript:list()" >책 목록</a>  
 <a href="bookUpdate.jsp?nowPage=<%=nowPage%>&book_id=<%=book_id%>" >수 정</a> 
 <a href="bookDelete.jsp?nowPage=<%=nowPage%>&book_id=<%=book_id%>">삭 제</a> <br/>
  </td>
  <%} else{%> 
  <a href="javascript:list()" >책 목록</a>
  <% if(id!=null && isValid.equals("Y")){ %>
  <a href="lendBook.jsp?nowPage=<%=nowPage%>&book_id=<%=book_id%>" action="myLendBook" enctype="multipart/form-data">대여하기</a><%} }%>
 </tr>
</table>
<input type="button" value="쪽지 보내기" onclick="sendMessage();"/>
<form name="msgFrm" method="post" action="message.jsp">
<input type="hidden" name="from" value="<%=id%>">
<input type="hidden" name="to" value="<%=user_id%>">
</form>
<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="bookList.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>