package com.students.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.students.bean.Profile;
import com.students.dbconn.DataIn;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 // Recipient's email ID needs to be mentioned.
	      String regd = request.getParameter("regdno");
	      String sub="OTP to change password";
	      String mssge=null;
	     Profile op=DataIn.setPwdOTP(regd);
	     if(op.getPassword()==null)
	     {
	    	 mssge="Wrong Registration no...";
	     }
	     else {
	      String msg="Your OTP is "+op.getPassword()+" to change your password. Remember OTP is valid only for 30 minutes";
	      final String user="studentsapp76448@gmail.com";
			final String pass="Password@76448";
	    	Boolean b=true;  
	        Properties props = new Properties();                                 
	        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        props.put("mail.smtp.user", user); 
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "587");
	        props.put("mail.smtp.starttls.enable", "true");
	      /*  Session session = Session.getInstance(props,new javax.mail.Authenticator()
	        {
	  	    protected PasswordAuthentication getPasswordAuthentication() 
	  	    {
	  		return new PasswordAuthentication(user,pass);
	  	    }
	        });
	    
	          try
	          {
	          MimeMessage message = new MimeMessage(session);
	          message.setFrom(new InternetAddress(user));
	          message.addRecipient(Message.RecipientType.TO,new InternetAddress(op.getEmail()));
	          message.setSubject(sub);
	          message.setText(msg);
	          Transport.send(message);
	          }
	          catch(Exception e)
	          {
	    	   b=false;
	    	   e.printStackTrace();
	          }	*/
	        Session session = Session.getInstance(props,null);
	        MimeMessage message = new MimeMessage(session);
	        try
	          {
	         // MimeMessage message = new MimeMessage(session);
	          message.setFrom(new InternetAddress(user));
	          message.addRecipient(Message.RecipientType.TO,new InternetAddress(op.getEmail()));
	          message.setSubject(sub);
	          message.setText(msg);
	          Transport transport = session.getTransport("smtp");
	          transport.connect("smtp.gmail.com", user, pass);
	          transport.sendMessage(message, message.getAllRecipients());

	        //  Transport.send(message);
	          }
	          catch(Exception e)
	          {
	    	   b=false;
	    	   e.printStackTrace();
	          }
	          mssge="OTP has been send";
	     }
	     HttpSession session=request.getSession();
	     session.setAttribute("frgtFlag", mssge);
	     RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Forgot.jsp");
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
