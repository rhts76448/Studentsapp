package com.students.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class NewStudent
 */
@WebServlet("/NewStudent")
public class NewStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String mn=request.getParameter("spy");
		int m=Integer.parseInt(mn);
		List<Profile> data = new ArrayList<Profile>();
		for(int i=0;i<=m;i++)
		{
			Profile ob=new Profile();
			ob.setName(request.getParameter("name"+i));
			ob.setRegdno(request.getParameter("regdno"+i));
			ob.setBranch(request.getParameter("branch"+i));
			if(request.getParameter("lateral"+i)!=null)
							ob.setLateral(true);
			data.add(ob);
		}
		Profile[] sList = new Profile[data.size()];
		sList = data.toArray(sList);
		boolean f=DataIn.newStudents(sList);
		HttpSession session=request.getSession();
		if(f)
			session.setAttribute("flag", "Data saved...");
		else
		session.setAttribute("flag", "please try again...");
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/NewStudent.jsp");
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
