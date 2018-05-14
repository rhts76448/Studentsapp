package com.students.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminController" })
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		if(name.equals("vhjbdhjvbdhjbvhjsdgfysbmncbdukvhsjkdbkjsdhkcshskjcbsdjhdcgjkcnzb"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/Admin.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("dvhdfhjvbdfhjhsuidhcjksdnbcsdvcuyh4hbjbd7scjbjcb93 b cjbsd5kbvjbsjkvbjkv"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/AProfile.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vhjhsvchjsdsvcxhv hykiuddib hcb6j78idcn3n4ucb84fjnfduigr9eer uihf9834hfbff"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/PromotSem.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vhjhsvchjsdsvcxhv hykiuddib hcb6j78idcn38nffkn59nnn558n999ibdfdnmmkersdjnu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/AdminAttendanceView.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjshcusbcjsdghjb38uyn348yfyd4848ursdjnu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/FacultyList.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjsd4848uvvini580bmikbmbbdfdnmmkersdjnu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/StudentsList.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("dvhdfhjvbdfhjhsuidhcjksdnbcsdvcuyhsdfvbhf   hdbvdfdbvvjkdfbviudfvbnvjkbvjbsjkvbjkv"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/NewStudent.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vjkxbvhjx bxccvbjkxnkchjkhdcjasuiuvbcvczhbcjkzxbcjkc bjkbjkvbchjzcbzjkchzk"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/NewFaculty.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("fbsuncnkanfffddddfnnndcccnhd  idvnnnnskkkkkkkkkkkkkvvknkvnvknmx mvxvv dddd"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/MngBranch.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("hbsdhbvycgbjhsbkkkkbcmmuhhdhksiinis  cjbjccbuhbfjhbjfffssdhchusdhcsdbcjdcs"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/MngSubjects.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("vhjhsvchjsdsvcxhv hykiuddib hcjhjshcjshcusbcjsdghjusdghcjbsjsjcgsddufgsddu"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/PublishNotice.jsp");
			rd.forward(request, response);
		}
		else if(name.equals("yesult fbsddfbsddfsdydgbvbhvbvuyxbkbksddbfisdhfhuisdbvbhjvbhjbvhjbvhjdbdvb"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/PublishResult.jsp");
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
