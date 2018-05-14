package com.students.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.students.bean.NoticeBean;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class NoticeBoard
 */
@WebServlet("/NoticeBoard")
public class NoticeBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String subject=request.getParameter("subject");
		NoticeBean ob=new NoticeBean();
		ob.setSubject(subject);
		String details=request.getParameter("details");
		ob.setDetails(details);
		Date date = new Date();
		java.sql.Date dt= new java.sql.Date(date.getTime());
		ob.setIssDate(dt);
		boolean b=DataIn.setNotice(ob);
		String msg=null;
		if(b)
		{
			msg="Something went wrong plz try again...";
		}
		else
		{
			msg="Notice has been published...";
		}
		HttpSession session=request.getSession();
		session.setAttribute("flag", msg);
		javax.servlet.RequestDispatcher dispatcher=request.getRequestDispatcher("/jsp/PublishNotice.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
