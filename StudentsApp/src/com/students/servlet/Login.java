package com.students.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.students.bean.Profile;
import com.students.core.Checker;
import com.students.dbconn.Security;

/**
 * Servlet implementation class Login
 */
@SuppressWarnings("serial")
@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		 RequestDispatcher dispatcher = null;
		try
		{
			 Profile  ob=new Profile();
			 HttpSession session=request.getSession();
	         ob.setEmail( request.getParameter("username"));
	         ob.setPassword(request.getParameter("password"));
	        
	         Profile ob1=Security.loginChk(ob);
	         String regd=ob1.getRegdno();
	         
	         if(regd!=null)
	         { 
	        	 if(Checker.isAdmin(regd))
	        	 {
	        		 session.setAttribute("user", "Admin");
	        		 session.setAttribute("regd", regd);
	        		 dispatcher = request.getRequestDispatcher("/jsp/Admin.jsp");
	        	 }
	        	 else if(Checker.regdChk(regd))
	        	 {
	        		 session.setAttribute("user",ob1.getName());
	        		 session.setAttribute("regd", regd);
	        		 dispatcher = request.getRequestDispatcher("/jsp/Faculty.jsp");
	        	 }
	        	 else
	        	 {
	        		 session.setAttribute("user",ob1.getName());
	        		 session.setAttribute("regd", regd);
	        		 dispatcher = request.getRequestDispatcher("/jsp/Students.jsp");
	        	 }
	         }
	           
	         else if(regd==null) 
	         {
	        	 out.println("<div style=\"background-color:\"blue;\"><br><br><font size=\"5\" color=\"#FF0000\" background-color=\"blue\">Invalid Username or Password</font></div>");
        		 dispatcher = request.getRequestDispatcher("/jsp/Signin.jsp");
        		
   	         }
		}
		catch(Exception e){System.out.println(e);}
		 dispatcher.include(request, response); 
	}

}
