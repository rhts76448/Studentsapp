package com.students.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.students.bean.Profile_pic;
import com.students.core.Checker;
import com.students.dbconn.DataIn;

/**
 * Servlet implementation class UpdatePic
 */
@WebServlet("/UpdatePic")
@MultipartConfig(maxFileSize=16177215)
public class UpdatePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//String image=request.getParameter("pic");
		HttpSession session=request.getSession();
		String regd=(String)session.getAttribute("regd");
		InputStream is=null;
		Part filePart=request.getPart("pic");
		is=filePart.getInputStream();
		Profile_pic ob=new Profile_pic();
		ob.setRegd(regd);
		ob.setPic(is);
		DataIn.updatePic(ob);
		boolean c=Checker.regdChk((String) session.getAttribute("regd"));
		if(c)
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Profile.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/SProfile.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
