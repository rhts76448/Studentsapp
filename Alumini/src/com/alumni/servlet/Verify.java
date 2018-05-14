package com.alumni.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alumni.core.Util;
import com.alumni.db.CRUD;

/**
 * Servlet implementation class Verify
 */
@WebServlet("/Verify")
public class Verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String email=request.getParameter("email");
		String url=Util.generateURL(email);
		int x=email.indexOf("@");
		int y=email.lastIndexOf(".");
		String subURL=email.substring(0, x)+email.substring(x+1, y);
		String msg=null;
		HttpSession session2=request.getSession();
		int p=CRUD.verifyEmail(email);
		if(p<1)
		{
		int n=CRUD.setVerificationURL(email, subURL);
		if(n==1)
		{
			msg="Check your mail to complete the registration process..";
			 String msg1="Your link is "+url+" to register into REC Online Alumni. Remember link is valid only for 30 minutes";
			 String sub="verifiaction link from REC Online Alumni";
		      final String user="studentsapp76448@gmail.com";
				final String pass="Password@76448";
		    	  
		        Properties props = new Properties();                                 
		        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		        props.put("mail.smtp.user", user); 
		        props.put("mail.smtp.password", pass);
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.port", "587");
		        props.put("mail.smtp.starttls.enable", "true");
		       
		        try
		          {
		         // MimeMessage message = new MimeMessage(session);
		          Session session = Session.getInstance(props,null);
				  MimeMessage message = new MimeMessage(session);
		          message.setFrom(new InternetAddress(user));
		          message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
		          message.setSubject(sub);
		          message.setText(msg1);
		          Transport transport = session.getTransport("smtp");
		          transport.connect("smtp.gmail.com", user, pass);
		          transport.sendMessage(message, message.getAllRecipients());

		        //  Transport.send(message);
		          }
		          catch(Exception e)
		          {
		    	   e.printStackTrace();
		          }
		}
		else
		{
			msg="please! try again later..";
		}
		}
		else
		{
			msg="This email id already exits..";
		}
		session2.setAttribute("msg", msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
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
