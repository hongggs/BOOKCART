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
		PrintWriter out = response.getWriter(); //�������� alert����

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
		if(str.equals("error")){ //�Է��� ��й�ȣ�� ���� ���� ���
			out.println("<script language='javascript'>");
			out.println("alert('��й�ȣ�� Ʋ���ϴ�.');");  
			out.println("</script>");
	
			
	  }
		else {//ȸ����������
			bMgr.updateMember(upBean);
			out.println("<script language='javascript'>");
			out.println("alert('ȸ������ ������ �Ϸ�Ǿ����ϴ�.');");        
			out.println("</script>");
			String url = "index.jsp";
			response.sendRedirect(url);
		}
		
		
		
		
	}
}
