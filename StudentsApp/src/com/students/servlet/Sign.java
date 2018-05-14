package com.students.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.students.bean.Profile;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class Sign
 */

@SuppressWarnings("serial")
@WebServlet("/Sign")
public class Sign extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		boolean flag=true;
		boolean b=false;
		Profile ob=new Profile();
		ob.setName(request.getParameter("name"));
		ob.setRegdno(request.getParameter("regd")); 
		ob.setBranch(request.getParameter("branch"));
		ob.setEmail(request.getParameter("mail"));
		ob.setGender(request.getParameter("gender"));
		ob.setDob(request.getParameter("dob"));
		ob.setPassword(request.getParameter("password2"));
		ob.setPhoneNo(request.getParameter("phone_number"));
		String ltr=request.getParameter("lateral");
		b=DataIn.chkUser(ob);
		if(b)
		{
			out.println("<div style=\"background-color:\"blue;\"><br><br><font size=\"5\" color=\"#FF0000\" background-color=\"blue\">User already exits...</font></div>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Signup.jsp");
			 dispatcher.include(request, response);
		}
		else {
		flag=new DataIn().registration(ob,ltr);
		
		if(flag)
		{
			 out.println("<div style=\"background-color:\"blue;\"><br><br><font size=\"5\" color=\"#FF0000\" background-color=\"blue\">Sorry!Try Again...</font></div>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Signup.jsp");
			 dispatcher.include(request, response);
		}
		else
		{
			out.println("<div style=\"background-color:\"blue;\"><br><br><font size=\"5\" color=\"#00FF00\" background-color=\"blue\">Congratulation! you hava successfully signuped..</font></div>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Signin.jsp");
			 dispatcher.include(request, response); 
		}
	}}
}
