package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
@SuppressWarnings("serial")
@WebServlet("/Controller")
public class Controller extends HttpServlet {
		@SuppressWarnings("unused")
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		if(name.equals("qdhfjbfkshfbffjkoiowkxjmksjowxxkjijxknijidjhnjcjncfghfhgfghfgvbhicnjdhidhhd"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Students.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("qdhfjbfkshfbffjkonfjbnm ckvjfoivvfxlkvejdnjvn9rkjijxknijidjhnjcjncicnjdhidhhd"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Faculty.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("qdhfjbfkshfbffjkoiowkxjmksjowxxkjijxknijidjhnjcjncicnjdhidhhd"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Profile.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("qdhfjbfkshfbffjkoiowkxjmksjohjccbsdhjvbdjbvhb vmxchjnjdhidhhd"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SProfile.jsp");
			rd.forward(request, response);
		}

		else if(name.equals("qdhfjbfkshfbffjkoiowkxjmksjowxxkjijxknijidjhnjcjncicnjdhidhhdsjhbbkjuicxb"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SNotice.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("qdhfjbfkshfbffjkoiowkxjmksff4jowxxkjijxk6fbjhnjcjncicnjdhidhhdsjhbbkjuicxb"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Fnotice.jsp");
			rd.forward(request, response);
		}

		else if(name.equals("wsxc edfvbrtghjmukl,pokjnbverfghjiuygfdfghjjdfvghvgdyf"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Results.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hgvhhgjgjgskbjkcucsljosjcbjkccguikbcmjgiuasbcmbcjgck45gd563vbk"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/GiveAttendance.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hgvhhgjgjgskbjkcucsljosjcbjkccguikbcmjgiuasbcmbcjgckbkcjshock"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/FeedbackHub.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("qazwsdcvedfgbnghjm,ujhkjnhbgdcgfghbjnkjhvdfghkjlkkdjvdfvjndfvkvbdfjkvbvjkbvkdfkbdfjkvbkvvdfk"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/AttendanceSheet.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hbdugunjjsdnkni73bhbhsdf7bch83 zbbcbjcbncsdbnjbjsdsbncj cj4njsbcjsdbcjsdc"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SResult.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hbdugunjjsdnkni73bhbtctydcbjcwwfdbdiic225bncsdbnjbjsdsbncj cj4njsbcjsdbcjsdc"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/FResult.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hbdugunjjsdnkghvvhdbvjdfbnuhskm4hkdfbvdfvdfvvvdfb cj4njsbcjsdbcjsdc"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SemResults.jsp");
			rd.forward(request, response);
		}

		else if(name.equals("hgvhcdhhvcscbj, cuhioclksncvhjcjknclcclcnlj;askdl;jd;jklncknklchiocn.mczklcjpoc.m cvhjccc zk"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/LogOut.jsp");
			rd.forward(request, response);
		}
	}

}
