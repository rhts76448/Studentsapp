package com.students.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.students.dbconn.DbConnection;

/**
 * Servlet implementation class AttendanceAction
 */
@SuppressWarnings("serial")
@WebServlet("/AttendanceAction")
public class AttendanceAction extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	HttpSession session=request.getSession();
	
	Profile[] ob=(Profile[]) session.getAttribute("students");
	String attdt=request.getParameter("attdt");
	if(attdt==null)
	{
	 String[] stu =request.getParameterValues("check");
		Date date = new Date();
		java.sql.Date dt= new java.sql.Date(date.getTime());
		@SuppressWarnings("deprecation")
		int tm=(date.getHours());
		String t=String.valueOf(tm);
		try {
			Connection cn=DbConnection.getConnection();
			cn.setAutoCommit(false);
			String yr=Checker.getYear();
			PreparedStatement ps = cn.prepareStatement("insert into attendance(s_regdno,sem,subject,t_regdno,attnd_dt,branch,time,pass_yr) values(?,?,?,?,?,?,?,?)");
			for(int i=0;i<stu.length;i++)
			{
				ps.setString(1, stu[i]);
				ps.setInt(2,ob[0].getSem());
				ps.setString(3, (String) session.getAttribute("sub"));
				ps.setString(4,(String) session.getAttribute("regd"));
				ps.setDate(5, dt);
				ps.setString(6, ob[0].getBranch());
				ps.setString(7, t);
				ps.setString(8, yr);
				ps.addBatch(); 
			}
			ps.executeBatch();
			cn.commit();
			cn.setAutoCommit(true);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/AttendanceSheet.jsp");
	        requestDispatcher.forward(request,response);
		}
		catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	else
	{
		String sub=(String) session.getAttribute("sub");
		String reg=(String) session.getAttribute("regd");
		String sem=(String) session.getAttribute("sem");
		session.removeAttribute("sem");
		String brch=(String) session.getAttribute("brch");
		session.removeAttribute("brch");
		String view="view";  
		Profile[] ob1=DataIn.getAttSt(sem,brch, sub,reg, attdt);
		if(Checker.isAdmin(reg)) {
			session.setAttribute("sview", ob1);
			session.setAttribute("view", view);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/AdminAttendanceView.jsp");
	        requestDispatcher.forward(request,response);
		}
		else {
		session.setAttribute("sview", ob1);
		session.setAttribute("view", view);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/AttendanceSheet1.jsp");
        requestDispatcher.forward(request,response);
		}
	}
session.removeAttribute("students");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
