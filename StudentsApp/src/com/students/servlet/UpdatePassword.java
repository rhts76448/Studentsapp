package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.students.bean.Profile;
import com.students.core.Checker;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		Profile ob=new Profile();
		ob.setRegdno((String) session.getAttribute("regd"));
		ob.setPassword(request.getParameter("password2"));
		ob.setPin(request.getParameter("current"));
		String s=DataIn.updatePassword(ob);
		session.setAttribute("msg",s);		
		boolean p=Checker.isAdmin((String) session.getAttribute("regd"));
		if(p)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/AProfile.jsp");
			rd.forward(request, response);
		}
		else {
		boolean c=Checker.regdChk((String) session.getAttribute("regd"));
		if(c)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Profile.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SProfile.jsp");
			rd.forward(request, response);
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
