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
import com.students.bean.ResultBean;
import com.students.core.Checker;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class UpdateMarks
 */
@WebServlet("/UpdateMarks")
public class UpdateMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMarks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String mn=request.getParameter("no");
		int m=Integer.parseInt(mn);
		List<ResultBean> data = new ArrayList<ResultBean>();
		HttpSession session=request.getSession();
		Profile[] ob=(Profile[])session.getAttribute("students");
		String subject=(String)session.getAttribute("subject");
		int sem=ob[0].getSem();
		String sm=Checker.semEncode(sem);
		String internal=request.getParameter("internal");
		String yr=Checker.getYear();
		String sem_yr=sm+" Semester_"+internal+" "+yr;
		String mark=request.getParameter("mark");
		String branch=ob[0].getBranch();
		for(int i=0;i<m;i++)
		{
			ResultBean ob1=new ResultBean();
			ob1.setBranch(branch);
			ob1.setSem(sem);
			ob1.setMark(request.getParameter("mark"+i));
			ob1.setRegdno(request.getParameter("regdno"+i));
			ob1.setSubject(subject);
			ob1.setT_mark(mark);
			ob1.setOpen("c");
			ob1.setSem_yr(sem_yr);
			data.add(ob1);
		}
		ResultBean[] sList = new ResultBean[data.size()];
		sList = data.toArray(sList);
		boolean b=DataIn.updateResult(sList);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsp/PublishResult.jsp");
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
