package com.alumni.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alumni.bean.Profile;
import com.alumni.core.Util;
import com.alumni.db.CRUD;

/**
 * Servlet implementation class Register1
 */
@WebServlet("/Register1")
public class Register1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath())
		HttpSession session=request.getSession();
		Profile ob=new Profile();
		String msg=null;
		ob.setName(request.getParameter("name"));
		ob.setGender(request.getParameter("gender"));
		ob.setDob(request.getParameter("dob"));
		ob.setAddress(request.getParameter("address"));
		ob.setCity(request.getParameter("city"));
		ob.setDistrict(request.getParameter("district"));
		ob.setState(request.getParameter("state"));
		ob.setPIN(request.getParameter("pin"));
		String c1=request.getParameter("con1");
		String c2=request.getParameter("con2");
		ob.setMob("+"+c1+c2);   
		ob.seteMail((String)session.getAttribute("uemail"));
		ob.setBatch(request.getParameter("batch"));
		ob.setBranch("Computer Science & Engineering");
		ob.setRegdno(request.getParameter("regdno"));
		ob.setQualification(request.getParameter("qualification"));
		ob.setOccuptation(request.getParameter("occupation"));
		ob.setOffAddress(request.getParameter("offaddress"));
		ob.setOffCity(request.getParameter("offcity"));
		ob.setOffDistrict(request.getParameter("offdistrict"));
		ob.setOffState(request.getParameter("offstate"));
		ob.setOffPIN(request.getParameter("offpin"));
		ob.setPassword(Util.generatePassword((String)session.getAttribute("uemail")));
		boolean b=CRUD.setAlumni(ob);
		if(b)
		{
			msg="Check your mail to get the login Password..";
			String msg1="Your login password is "+ob.getPassword()+". we request you to change the password after first login...";
			 String sub="REC Online Alumni";
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
		          Session session1 = Session.getInstance(props,null);
				  MimeMessage message = new MimeMessage(session1);
		          message.setFrom(new InternetAddress(user));
		          message.addRecipient(Message.RecipientType.TO,new InternetAddress(ob.geteMail()));
		          message.setSubject(sub);
		          message.setText(msg1);
		          Transport transport = session1.getTransport("smtp");
		          transport.connect("smtp.gmail.com", user, pass);
		          transport.sendMessage(message, message.getAllRecipients());

		        //  Transport.send(message);
		          }
		          catch(Exception e)
		          {
		    	   e.printStackTrace();
		          }
		}
		session.removeAttribute("uemail");
		session.setAttribute("msg", msg);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/jsp/Login.jsp");
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
