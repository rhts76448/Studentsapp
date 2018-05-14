package com.alumni.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Controller" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String q=request.getParameter("q");
		RequestDispatcher dispatcher=null;
		if(q.equals("qlotypoqrttvybnjdcnidcnncidncidncvsdvvhbncnncisdcncisdcnisdisdssccvvjnunh"))
		{
			dispatcher=request.getRequestDispatcher("/index.jsp");
		}
		else if(q.equals("qoptryuionhdfhbnsnooshjuiossdnc674y7wbsdhcyjhb chjsdisniomoocbuyffsdsv g gvgj"))
		{
			dispatcher=request.getRequestDispatcher("/jsp/Login.jsp");
		}
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
