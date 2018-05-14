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
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class getStudents
 */
@WebServlet("/getStudents")
public class getStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getStudents() {
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
		session.setAttribute("subject", request.getParameter("subject"));
		String branch=request.getParameter("branch");
		String sem=request.getParameter("semester");
		Profile[] ob=DataIn.getStudent(branch, sem);
		session.setAttribute("students", ob);
		String nice=(String)session.getAttribute("nice");
		session.removeAttribute("nice");
		RequestDispatcher requestDispatcher=null;
		if(nice==null) {
		requestDispatcher=request.getRequestDispatcher("/jsp/UpdateMarks.jsp");
		}
		else
		{
		requestDispatcher=request.getRequestDispatcher("/jsp/StudentsList.jsp");
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
