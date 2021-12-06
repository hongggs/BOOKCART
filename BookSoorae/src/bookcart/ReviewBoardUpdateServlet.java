package bookcart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/boardUpdate")
public class ReviewBoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		ReviewBoardMgr bMgr = new ReviewBoardMgr();
		ReviewBoardBean bean = (ReviewBoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		ReviewBoardBean upBean = new ReviewBoardBean();
		upBean.setRv_id(Integer.parseInt(request.getParameter("num")));
		upBean.setUser_id(session.getAttribute("idKey").toString());
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setWriter(request.getParameter("writer"));
		upBean.setPublisher(request.getParameter("publisher"));
		bMgr.updateBoard(upBean);
		String url = "review_read.jsp?nowPage=" + nowPage + "&num=" + upBean.getRv_id();
		response.sendRedirect(url);
		
	}
}