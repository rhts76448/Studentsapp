package com.students.servlet;

import java.io.IOException;
import java.util.Date;
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
 * Servlet implementation class Attendence
 */
@SuppressWarnings("serial")
@WebServlet("/Attendence")
public class Attendence extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		String brch=request.getParameter("branch");
		String sub=request.getParameter("subject");
		String sem=request.getParameter("semester");
		String dec=request.getParameter("click");
		session.setAttribute("dec", dec);
		session.setAttribute("sub", sub);
		session.setAttribute("brch",brch);
		session.setAttribute("sem", sem);
		RequestDispatcher requestDispatcher=null;
		if(dec.equals("take"))
		{
		Profile[] ob=DataIn.getStudent(brch, sem);
		session.setAttribute("students", ob);
       
        requestDispatcher=request.getRequestDispatcher("/jsp/AttendanceSheet1.jsp");
		}
		else if(dec.equals("generate OTC"))
		{
			String reg=(String) session.getAttribute("regd");
			int i=DataIn.chkAttOTP(reg);
			String otp=null;
			if(i>0)
			{
				otp="your 5 minutes is not over yet...";
			}
			else
			{
			 otp =Checker.genarateAttOTP(reg);
			Date date = new Date();
			java.sql.Date dt= new java.sql.Date(date.getTime());
			@SuppressWarnings("deprecation")
			int h=(date.getHours());
			@SuppressWarnings("deprecation")
			int m=(date.getMinutes());
			int tm=h*60+m;
			String t=String.valueOf(tm);
			String yr=Checker.getYear();
			DataIn.setAttOTP(otp, sub, brch, sem, dt, t, yr, reg);
			}
			session.setAttribute("otp", otp);
		requestDispatcher=request.getRequestDispatcher("/jsp/AttendanceSheet1.jsp");
		}
		else if(dec.equals("view"))
		{
			String reg=(String) session.getAttribute("regd");
			if(Checker.isAdmin(reg))
			{
				String[] ob=DataIn.getAttDt(sem,brch,sub);
				session.setAttribute("attdt", ob);
				session.setAttribute("nice", "nice");
				requestDispatcher=request.getRequestDispatcher("/jsp/AdminAttendanceView.jsp");
			}
			else {
			String[] ob=DataIn.getAttDt(sem,brch,sub,reg);
			session.setAttribute("attdt", ob);
			requestDispatcher=request.getRequestDispatcher("/jsp/AttendanceSheet1.jsp");
			}
		}
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
