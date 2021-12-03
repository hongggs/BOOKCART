package bookcart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); //서블릿에서 alert띄우기

		MemberRegisterMgr aMgr= new MemberRegisterMgr();
		MemberUpdateMgr bMgr = new MemberUpdateMgr();
		MemberRegisterBean bean = (MemberRegisterBean)session.getAttribute("bean");
		
		MemberRegisterBean upBean = new MemberRegisterBean();
		upBean.setUser_id(session.getAttribute("idKey").toString());
		upBean.setName(request.getParameter("name"));
		upBean.setPw(request.getParameter("pw"));
		upBean.setEmail(request.getParameter("email"));
		upBean.setArea2(request.getParameter("area2"));
		upBean.setArea1(request.getParameter("area1"));
		upBean.setPhone(request.getParameter("phone"));
		String str=aMgr.login(session.getAttribute("idKey").toString(),request.getParameter("pw"));
		if(str.equals("error")){ //입력한 비밀번호가 같지 않은 경우
			out.println("<script language='javascript'>");
			out.println("alert('비밀번호가 틀립니다.');");  
			out.println("</script>");
	
			
	  }
		else {//회원정보수정
			bMgr.updateMember(upBean);
			out.println("<script language='javascript'>");
			out.println("alert('회원정보 수정이 완료되었습니다.');");        
			out.println("</script>");
			String url = "index.jsp";
			response.sendRedirect(url);
		}
		
		
		
		
	}
}
