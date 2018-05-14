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
import com.students.core.Checker;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class SearchBox
 */
@WebServlet("/SearchBox")
public class SearchBox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBox() {
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
		String user=(String)session.getAttribute("user");
		String regd=(String)session.getAttribute("regd");
		RequestDispatcher rd=null;
		int y=0;
		int j=0;
		String x=request.getParameter("q");
		String q=x.trim();
		String s=q.toLowerCase();
		int p=2;
		if(user.toLowerCase().equals(s))
		{
			rd=request.getRequestDispatcher("/jsp/Profile.jsp");
		}
		else {
			if(Checker.isAdmin(user))
			{
				if(q.length()==10)
				{
					char c[]=q.toCharArray();
				
					for(int i=0;i<c.length;i++)
					{
						if(Character.isDigit(c[i]))
						{
						p=0;
						}
						else
						{
						p=1;
						break;
						}
					}
				}
			}
			else if(Checker.regdChk(regd))
			{
				if(q.length()==10)
				{
					char c[]=q.toCharArray();
				
					for(int i=0;i<c.length;i++)
					{
						if(Character.isDigit(c[i]))
						{
						p=0;
						}
						else
						{
						p=1;
						break;
						}
					}
				}
			}
		
		Profile list[]=DataIn.getFcltyList2();
		if(p==0) {
			session.setAttribute("q", q);
			rd=request.getRequestDispatcher("/jsp/ProfileView.jsp");
			}
		else {
		for(int i=0;i<list.length;i++) {
		if(s.equals(list[i].getName().toLowerCase()))
		{
			y=0;
			j=i;
			break;
		}
		else {
			y=1;
		}
		}
		if(y==1)
		{
			session.setAttribute("flagq", "No data found");
		}
		else
		{
			session.setAttribute("prgd", list[j].getRegdno());
		}
		rd=request.getRequestDispatcher("/jsp/ProfileView2.jsp");
		}}
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
