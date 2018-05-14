package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.students.dbconn.DataIn;

/**
 * Servlet implementation class MngSubject
 */
@WebServlet("/MngSubject")
public class MngSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MngSubject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String btn=request.getParameter("sbjct");
		String sem=request.getParameter("semester");
		String branch=request.getParameter("branch");
		if(btn.equals("Remove"))
		{
			String[] sub=request.getParameterValues("sub");
			DataIn.revSubject(branch, sem, sub);
		}
		else if(btn.equals("Add"))
		{
			String[] sub=request.getParameterValues("subject");
			DataIn.addSubject(branch, sem, sub);
		}
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/MngSubjects.jsp");
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
