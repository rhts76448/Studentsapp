package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.students.bean.FeedbackBean;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class Feedback
 */
@SuppressWarnings("serial")
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		FeedbackBean ob=new FeedbackBean();
		
		String sre=(String) session.getAttribute("regd");
		ob.setSreg(sre);
		ob.setSubject(request.getParameter("sub"));
		ob.setTreg(request.getParameter("faculty"));
		ob.setFeed(request.getParameter("comment"));
		ob.setGrade(request.getParameter("grade"));
		boolean flag=DataIn.giveFeed(ob);
		if(flag)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/FeedbackHub.jsp?flag=Feedback Submited!...");
			rd.forward(request, response);
		}
		else
		{
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/FeedbackHub.jsp?flag=please! try again...");
		rd.forward(request, response);
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
