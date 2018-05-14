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
 * Servlet implementation class updateBio1
 */
@WebServlet("/UpdateBio1")
public class updateBio1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateBio1() {
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
		Profile ob=new Profile();
		ob.setRegdno((String) session.getAttribute("regd"));
		ob.setName(request.getParameter("bio_name"));
		ob.setGender(request.getParameter("bio_gender"));
		ob.setDob(request.getParameter("bio_dob"));
		ob.setEmail(request.getParameter("bio_email"));
		ob.setPhoneNo(request.getParameter("bio_con"));
		ob.setAlCon(request.getParameter("bio_acon"));
		ob.setFthName(request.getParameter("bio_fname"));
		ob.setfContact(request.getParameter("bio_fcon"));
		ob.setMthName(request.getParameter("bio_mname"));
		ob.setmContact(request.getParameter("bio_mcon"));
		DataIn.updateBio(ob);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/SProfile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
