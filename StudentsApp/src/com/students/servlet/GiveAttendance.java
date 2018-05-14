package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.students.dbconn.DataIn;

/**
 * Servlet implementation class GiveAttendance
 */
@WebServlet("/GiveAttendance")
public class GiveAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiveAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String otp=request.getParameter("otp");
		String msg=null;
		HttpSession session=request.getSession();
		String regd=(String)session.getAttribute("regd");
		int c=DataIn.chkAtt(otp, regd);
		if(c>0) {
			msg="you have already used this code...";
		}
		else {
			int p=DataIn.chkOTP(otp);
			if(p>0) {
		DataIn.giveAttendance(otp, regd);
		msg="done...";}
			else
			{
				msg="wrong code or code has been expired....";
			}
		}
			
		session.setAttribute("flag", msg);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/GiveAttendance.jsp");
		requestDispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
