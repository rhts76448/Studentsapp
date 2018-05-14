/**
 * 
 */
package com.students.dbconn;

import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.students.bean.AttendenceBean;
import com.students.bean.FeedbackBean;
import com.students.bean.NoticeBean;
import com.students.bean.Profile;
import com.students.bean.Profile_pic;
import com.students.bean.ResultBean;
import com.students.core.Checker;/**
 * @author ACER
 *
 */
public class DataIn {
static Connection cn=null;

public static boolean chkUser(Profile ob)
{
	boolean b=false;
	try {

	cn=DbConnection.getConnection();
	PreparedStatement pp=cn.prepareStatement("select count(*) from log_in where regdno=? or email=?");
	pp.setString(1,ob.getRegdno());
	pp.setString(2, ob.getEmail());
	ResultSet rr=pp.executeQuery();
	//pp.close();
	if(rr.next())
	{
		if(rr.getInt(1)>0)
	{
			b=true;
	}
	}
	pp.close();
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
	return b;
}
public boolean registration(Profile ob,String ltr)//use for signup of a new student/faculty in db
{
	boolean flag=true;
	String name=ob.getName();
	String regdno=ob.getRegdno();
	String branch=ob.getBranch();
	String gender=ob.getGender();
	String email=ob.getEmail();
	String dob=ob.getDob();
	String pwd=ob.getPassword();
	String con=ob.getPhoneNo();
	int sem=0;
	String year=null;
	
	String regd=regdno.toUpperCase();
	boolean c=Checker.regdChk(regd);
	
	try
	{
		cn=DbConnection.getConnection();
	if(c)
	{
		CallableStatement cs=cn.prepareCall("{call newFaculty(?,?,?,?,?,?,?,?)}");
		cs.setString(1,regd);
		cs.setString(2,name);
		cs.setString(3,branch);
		cs.setString(4,dob);
		cs.setString(5,gender);
		cs.setString(6,email);
		cs.setString(7,con);
		cs.setString(8, pwd);
		flag=cs.execute();cs.close();
	}
	else
	{
		String ch=regd.substring(0, 2);
		int n=Integer.parseInt(ch);
		int p=2000+n;
		int q=p+4;
		if(ltr!=null)
		{
			--q;
		}
		String x=String.valueOf(p);
		String y=String.valueOf(q);
		year=x+"-"+y;
		int m=Calendar.getInstance().get(Calendar.MONTH);
		int yr=Calendar.getInstance().get(Calendar.YEAR);
		int r=yr-p;
		if(m<=6)
		{
			sem=(2*r);
		}
		else if(m>6)
		{
			sem=(2*r)+1;
		}
		if(ltr!=null)
		{
			sem=sem+2;
		}
		CallableStatement cs=cn.prepareCall("{call newStudent(?,?,?,?,?,?,?,?,?,?)}");
		cs.setString(1,regd);
		cs.setString(2,name);
		cs.setString(3,branch);
		cs.setString(4,dob);
		cs.setString(5,gender);
		cs.setString(6,email);
		cs.setString(7,con);
		cs.setInt(8, sem);
		cs.setString(9, year);
		cs.setString(10,pwd);
		flag=cs.execute();
		cs.close();
	}
	
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
	return flag;
	
}
public static String[] getBranch()//use to get all the branches present in the institute
{
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		ps = cn.prepareStatement("SELECT DISTINCT branch from subjects order by 1 asc");
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{data.add(rs.getString(1));	}
	ps.close();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	String[] branch = new String[data.size()];
	branch = data.toArray(branch);
	return branch;
}

public static String[] getSubject(String brch, int sm)//use to get subject for a specific branch and sem in the feedback page
{ 
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT DISTINCT subject from subjects where sem=? and branch=? order by 1 asc");
		
		ps.setInt(1, sm);
		ps.setString(2, brch);
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{data.add(rs.getString(1));	}
	ps.close();}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	String[] sub = new String[data.size()];
	sub = data.toArray(sub);
	
	
	return sub;
}
public static String[] getSubject(int sm)//overloaded method to get subject for a specific sem
{
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT DISTINCT subject from subjects where sem=? order by 1 asc");
		
		ps.setInt(1, sm);
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{data.add(rs.getString(1));	}
	ps.close();}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	String[] sub = new String[data.size()];
	sub = data.toArray(sub);
	
	
	return sub;
}
public static Profile[] getFaculty(int sem,String  branch)//use to get faculty details for feedback page
{
	List<Profile> data = new ArrayList<Profile>();
	
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT name,regdno from faculties where regdno=(select DISTINCT T_REGDNO from attendance where sem=? and branch=?)order by 1 asc");
		ps.setInt(1, sem);
		ps.setString(2, branch);
		
	ResultSet rs = ps.executeQuery();

	while(rs.next())
	{
		Profile ob=new Profile();
		ob.setName(rs.getString(1));
		ob.setRegdno(rs.getString(2));
		data.add(ob);
		}
	ps.close();}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	Profile[] sub = new Profile[data.size()];
	sub = data.toArray(sub);
			
	return sub;
}
public static boolean giveFeed(FeedbackBean ob)//use to store the feedback in db
{
	boolean flag=true;
	String sub=ob.getSubject();
	String sreg=ob.getSreg();
	String treg=ob.getTreg();
	String feed=ob.getFeed();
	String grd=ob.getGrade();
	int gr=Integer.parseInt(grd);
	cn=DbConnection.getConnection();
	try {
		CallableStatement cs=cn.prepareCall("{call new_feedback(?,?,?,?,?)}");
		cs.setString(1,treg);
		cs.setString(2,sub);
		cs.setString(3,sreg);
		cs.setInt(4,gr);
	
		cs.setString(5, feed);
		flag=cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	return flag;
}
public static Profile getFdetails(String regd)//use to get details of a faculty
{
	Profile ob=new Profile();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT DEPT,DOB,GENDER,EMAIL,CONTACT_NO,exp_yr,exp_mnth,qualification,name from faculties where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			ob.setBranch(rs.getString(1));
			ob.setDob(rs.getString(2));
			ob.setGender(rs.getString(3));
			ob.setEmail(rs.getString(4));
			ob.setPhoneNo(rs.getString(5));
			ob.setExp_y(rs.getString(6));
			ob.setExp_m(rs.getString(7));
			ob.setQualification(rs.getString(8));
			ob.setName(rs.getString(9));
			ob.setRegdno(regd);
		}
		ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	return ob;
}
public static Profile getSdetails(String regd)//use to get details of a student
{
	Profile ob=new Profile();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT NAME,BRANCH,DOB,GENDER,EMAIL,CONTACT_NO,SEM,YEAR,F_NAME,M_NAME,F_CON,M_CON,S_NAME,C_NAME,S_YEAR,C_YEAR,S_MARKS,C_MARKS,A_CON from students where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
		ob.setName(rs.getString(1));
		ob.setBranch(rs.getString(2));
		ob.setDob(rs.getString(3));
		ob.setGender(rs.getString(4));
		ob.setEmail(rs.getString(5));
		ob.setPhoneNo(rs.getString(6));
		ob.setSem(rs.getInt(7));
		ob.setBatch(rs.getString(8));
		ob.setFthName(rs.getString(9));
		ob.setMthName(rs.getString(10));
		ob.setfContact(rs.getString(11));
		ob.setmContact(rs.getString(12));
		ob.setsName(rs.getString(13));
		ob.setcName(rs.getString(14));
		ob.setsPass(rs.getString(15));
		ob.setcPass(rs.getString(16));
		ob.setsMarks(rs.getString(17));
		ob.setcMarks(rs.getString(18));
		ob.setAlCon(rs.getString(19));
		ob.setRegdno(regd);
		}
		ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	return ob;
}
public static Profile getAddress(String regd)//use to address of a specified member
{
	
	Profile ob=new Profile();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT regdno,address,city,district,state,pin from \"C##PROJECT\".\"ADDRESS\" where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		boolean b=rs.next();
		if(b)
		{
			
			ob.setAddress(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setDistrict(rs.getString(4));
			ob.setState(rs.getString(5));
			ob.setPin(rs.getString(6));
		}
		ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	return ob;
}
public static int getRatting(String reg,int p)//get the ratings of a faculty for specified grade
{
	int r = 0;
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT count(*) from feedback where t_regdno=? and grade=?");
		ps.setString(1, reg);
		ps.setInt(2, p);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			r=rs.getInt(1);
		}
		ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
}
	return r;}
public static int getRatting(String reg)//returns the total rating
{
	int r = 0;
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT count(*) from feedback where t_regdno=?");
		ps.setString(1, reg);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			r=rs.getInt(1);
		}
		ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	
}return r;}
public static Profile[] getStudent(String brch,String s)//returns students details to attendance page
{
	List<Profile> data = new ArrayList<Profile>();
	int sm=Integer.parseInt(s);
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT DISTINCT regdno,name from students where branch=? and sem=? order by 1 asc");//modify this students to student
		ps.setString(1, brch);
		ps.setInt(2, sm);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		Profile ob=new Profile();
		ob.setName(rs.getString(2));
		ob.setRegdno(rs.getString(1));
		ob.setBranch(brch);
		ob.setSem(sm);
		data.add(ob);
		}
	ps.close();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	Profile[] sub = new Profile[data.size()];
	sub = data.toArray(sub);
			
	return sub;
}
public static FeedbackBean[] getFeedback(String reg)//get the comments given in feedback of a faculty
{
	List<FeedbackBean> data = new ArrayList<FeedbackBean>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT subject,feedback from feedback where t_regdno=?");
		ps.setString(1, reg);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		FeedbackBean ob=new FeedbackBean();
		ob.setSubject((rs.getString(1)));
		ob.setFeed((rs.getString(2)));
		data.add(ob);
		}
	ps.close();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	FeedbackBean[] sub = new FeedbackBean[data.size()];
	sub = data.toArray(sub);
			
	return sub;
}
public static void setAttOTP(String otp,String sub,String branch,String sem,Date attdt,String time,String year,String regd)
{
	try
	{
		cn=DbConnection.getConnection();

		CallableStatement cs=cn.prepareCall("{call newattotp(?,?,?,?,?,?,?,?)}");	
		cs.setString(1, otp);
		cs.setString(2, sub);
		cs.setString(3, branch);
		cs.setString(4, sem);
		cs.setDate(5, attdt);
		cs.setString(6,time);
		cs.setString(7, year);
		cs.setString(8, regd);
		cs.execute();cs.close();
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
}
public static void giveAttendance(String otp,String regd)
{
	try
	{
		cn=DbConnection.getConnection();

		CallableStatement cs=cn.prepareCall("{call giveattendance(?,?)}");
		cs.setString(2, otp);
		cs.setString(1, regd);
		cs.execute();cs.close();
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
}
public static int chkAtt(String otp,String regd)
{
	int count=0;
	try {
		cn=DbConnection.getConnection();
		PreparedStatement ps = cn.prepareStatement("select count(*) from att_cntrl where s_regdno=? and otp=?");
		ps.setString(1, regd);
		ps.setString(2, otp);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		count=rs.getInt(1);
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return count;
}
public static int chkAttOTP(String reg)
{
	int count=0;
	try {
		cn=DbConnection.getConnection();
		PreparedStatement ps = cn.prepareStatement("select count(*) from att_otp where t_regdno=?");
		ps.setString(1, reg);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		count=rs.getInt(1);
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return count;
}
public static int chkOTP(String otp)
{
	int count=0;
	try {
		cn=DbConnection.getConnection();
		PreparedStatement ps = cn.prepareStatement("select count(*) from att_otp where otp=?");
		ps.setString(1, otp);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		count=rs.getInt(1);
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return count;
}
public static String[] getAttDt(String sem,String brch,String sub,String reg)
{
	
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	String yr=Checker.getYear();
	try {
		cn=DbConnection.getConnection();
		ps = cn.prepareStatement("select Distinct attnd_dt,time from attendance where branch=? and sem=? and subject=?  and pass_yr=? and t_regdno=? order by attnd_dt asc");
		ps.setString(2,sem);
		ps.setString(3,sub);
		ps.setString(5,reg);
		ps.setString(1,brch);
		ps.setString(4, yr);
	ResultSet rs = ps.executeQuery();
	//System.out.println(rs.next());
	while(rs.next())
	{
		data.add(rs.getString(1));
	}
	ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
		String[] date = new String[data.size()];
		date = data.toArray(date);
		return date;
}
public static String[] getAttDt(String sem,String brch,String sub)
{
	
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	String yr=Checker.getYear();
	try {
		cn=DbConnection.getConnection();
		ps = cn.prepareStatement("select Distinct attnd_dt,time from attendance where branch=? and sem=? and subject=?  and pass_yr=? order by attnd_dt desc");
		ps.setString(2,sem);
		ps.setString(3,sub);
		ps.setString(1,brch);
		ps.setString(4, yr);
	ResultSet rs = ps.executeQuery();
	//System.out.println(rs.next());
	while(rs.next())
	{
		data.add(rs.getString(1));
	}ps.close();}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
		String[] date = new String[data.size()];
		date = data.toArray(date);
		return date;
}
public static String[] getAttSem(String reg)
{
	
	List<String> data = new ArrayList<String>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		ps = cn.prepareStatement("select DISTINCT sem from attendance where s_regdno=? order by sem asc");
		ps.setString(1,reg);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{data.add(rs.getString(1));}
	ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
		String[] sem = new String[data.size()];
		sem = data.toArray(sem);
		return sem;
}
public static Profile[] getAttSt(String sem,String brch,String sub,String reg,String dt)//used to view student list in a attendance sheet
{
	
	List<Profile> data = new ArrayList<Profile>();
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		ps = cn.prepareStatement("select s.regdno,s.name from students s,attendance a where s.regdno=a.s_regdno and a.sem=? and a.subject=? and a.branch=? and a.attnd_dt=? order by s.regdno asc");
		ps.setString(1,sem);
		ps.setString(2,sub);
		//ps.setString(3,reg);
		ps.setString(3,brch);
		ps.setString(4, dt);
		//int sm=Integer.parseInt(sem);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{Profile ob=new Profile();
	ob.setName(rs.getString(2));
	ob.setRegdno(rs.getString(1));
	ob.setBranch(brch);
	data.add(ob);}
	ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	Profile[] stu = new Profile[data.size()];
	stu = data.toArray(stu);
	return stu;
}

public static void updateAddress(Profile ob)
{
	String addrs=ob.getAddress();
	String city=ob.getCity();
	String state=ob.getState();
	String district=ob.getDistrict();
	String pin=ob.getPin();
	String regd=ob.getRegdno();
	cn=DbConnection.getConnection();
	try {
		CallableStatement cs=cn.prepareCall("{call update_address(?,?,?,?,?,?)}");
		cs.setString(1,regd);
		cs.setString(2, addrs);
		cs.setString(3, city);
		cs.setString(4,district);
		cs.setString(5, state);
		cs.setString(6, pin);
	cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}

}
public static void updateBio(Profile ob)
{
	cn=DbConnection.getConnection();
	try {
		CallableStatement cs=cn.prepareCall("{call update_bio1(?,?,?,?,?,?,?,?,?,?,?)}");
		cs.setString(1,ob.getRegdno());
		cs.setString(2, ob.getName());
		cs.setString(3, ob.getGender());
		cs.setString(4,ob.getDob());
		cs.setString(5,ob.getEmail());
		cs.setString(6, ob.getPhoneNo());
		cs.setString(7, ob.getAlCon());
		cs.setString(8,ob.getFthName());
		cs.setString(9,ob.getfContact());
		cs.setString(10,ob.getMthName());
		cs.setString(11,ob.getmContact());
		cs.execute();cs.close();		
	 }
	catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
}
public static void updateEdu(Profile ob)
{
	cn=DbConnection.getConnection();
	try {
		CallableStatement cs=cn.prepareCall("{call update_edu(?,?,?,?,?,?,?)}");
		cs.setString(1,ob.getRegdno());
		cs.setString(2, ob.getsName());
		cs.setString(3, ob.getsMarks());
		cs.setString(4,ob.getsPass());
		cs.setString(5,ob.getcName());
		cs.setString(6, ob.getcMarks());
		cs.setString(7, ob.getcPass());
		cs.execute();cs.close();
	}
	catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
}
public static void updateMail(Profile ob)
{
	String regd=ob.getRegdno();
	String mail=ob.getEmail();
	CallableStatement cs=null;
	cn=DbConnection.getConnection();
	try {
		if(Checker.isAdmin(regd))
		{
			cs=cn.prepareCall("{call update_amail(?,?)}");
		}
		else {
		if(Checker.regdChk(regd))
		{
		cs=cn.prepareCall("{call update_fmail(?,?)}");
		}
		else
		{
		cs=cn.prepareCall("{call update_smail(?,?)}");
		}
		}
		cs.setString(1,regd);
		cs.setString(2, mail);
	cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}

}
public static void updateMob(Profile ob)
{
	String regd=ob.getRegdno();
	String mob=ob.getPhoneNo();
	CallableStatement cs=null;
	cn=DbConnection.getConnection();
	try {
		if(Checker.regdChk(regd))
		{
		cs=cn.prepareCall("{call update_fmob(?,?)}");
		}
		else
		{
		cs=cn.prepareCall("{call update_smob(?,?)}");
		}
		cs.setString(1,regd);
		cs.setString(2, mob);
	cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}

}
public static void updateExp(Profile ob)
{
	String regd=ob.getRegdno();
	String mob=ob.getExp_y();
	CallableStatement cs=null;
	cn=DbConnection.getConnection();
	try {
		cs=cn.prepareCall("{call update_exp(?,?,?)}");
		cs.setString(1,regd);
		cs.setString(2, mob);
		cs.setString(3, "6");
	cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}

}
public static void updateQua(Profile ob)
{
	String regd=ob.getRegdno();
	String mob=ob.getQualification();
	CallableStatement cs=null;
	cn=DbConnection.getConnection();
	try {
		
		cs=cn.prepareCall("{call update_qualification(?,?)}");
		cs.setString(1,regd);
		cs.setString(2, mob);
	cs.execute();cs.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
} 
public static String updatePassword(Profile ob)
{
	String msg = null;
	String regd=ob.getRegdno();
	String curr=ob.getPin();
	int r = 0;
	PreparedStatement ps;
	try {
		cn=DbConnection.getConnection();
		
		ps = cn.prepareStatement("SELECT count(*) from log_in where regdno=? and password=?");
		ps.setString(1, regd);
		ps.setString(2, curr);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			r=rs.getInt(1);
		}
	if(r==1)
	{
		CallableStatement cs=cn.prepareCall("{call updatepassword(?,?)}");
		cs.setString(1, regd);
		cs.setString(2, ob.getPassword());
		cs.execute();cs.close();
		msg="Password changed ";
	}
	else
	{
		msg="You have entered an wrong password";
	}ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	
}
	return msg;
}
public static void deactive(String regd)//used to de-active an account
{
	
		CallableStatement cs;
		try {
			if(Checker.regdChk(regd))
			{
			cs = cn.prepareCall("{call delete_fs(?)}");
			cs.setString(1, regd);
			}
			else
			{
				cs = cn.prepareCall("{call delete_ss(?)}");
				cs.setString(1, regd);
			}
			cs.execute();cs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
}
public static void addSubject(String branch,String sem,String[] sub)//use to add subjects
{
	try {
		Connection cn=DbConnection.getConnection();
		
		PreparedStatement ps = cn.prepareStatement("insert into subjects(branch,sem,subject) values(?,?,?)");
		for(int i=0;i<sub.length;i++)
		{
			ps.setString(1, branch);
			ps.setString(2, sem);
			ps.setString(3, sub[i]);
			ps.addBatch();
		}
		ps.executeBatch();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
}
public static void revSubject(String branch,String sem,String[] sub)//use to remove subjects
{
	try {
		Connection cn=DbConnection.getConnection();
		
		PreparedStatement ps = cn.prepareStatement("delete from subjects where branch=? and sem=? and subject=?");
		for(int i=0;i<sub.length;i++)
		{
			ps.setString(1, branch);
			ps.setString(2, sem);
			ps.setString(3, sub[i]);
			ps.addBatch();
		}
		ps.executeBatch();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
}
public static void addBranch(String branch)//use to add branch
{
	try {
		Connection cn=DbConnection.getConnection();
		
		PreparedStatement ps = cn.prepareStatement("insert into subjects(branch) values(?)");
		ps.setString(1, branch);
		ps.execute();
		ps.close();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
}
public static void revBranch(String[] branch)//use to remove branches
{
	try {
		Connection cn=DbConnection.getConnection();
		
		PreparedStatement ps = cn.prepareStatement("delete from subjects where branch=?");
		for(int i=0;i<branch.length;i++)
		{
			ps.setString(1, branch[i]);
			ps.addBatch();
		}
		ps.executeBatch();
		ps.close();
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
}
public static boolean newStudents(Profile[] ob)
{
	boolean flag=false;
	try {
		Connection cn=DbConnection.getConnection();
		cn.setAutoCommit(false);
		PreparedStatement ps = cn.prepareStatement("insert into student(regdno,name,branch,sem,pass_yr) values(?,?,?,?,?)");
		for(int i=0;i<ob.length;i++)
		{
			int sem = 0;
			ps.setString(1,ob[i].getRegdno());
			ps.setString(2, ob[i].getName());
			ps.setString(3, ob[i].getBranch());
			
			String ch=ob[i].getRegdno().substring(0, 2);
			int n=Integer.parseInt(ch);
			int p=2000+n;
			int q=p+4;
			if(ob[i].isLateral())
			{
				--q;
			}
			String y=String.valueOf(q);
			int m=Calendar.getInstance().get(Calendar.MONTH);
			int yr=Calendar.getInstance().get(Calendar.YEAR);
			int r=yr-p;
			if(m<=6)
			{
				sem=(2*r);
			}
			else if(m>6)
			{
				sem=(2*r)+1;
			}
			if(ob[i].isLateral())
			{
				System.out.println(ob[i].isLateral());
				sem=sem+2;
			}
			ps.setInt(4,sem);
			ps.setString(5, y);
			ps.addBatch();
		}
		int[] a= ps.executeBatch();
		for(int i=0;i<a.length;i++)
		{
			if(a[i]>=0)
				flag=true;
			else
			{
				flag=false;
				cn.rollback();
				break;
			}
		}
		CallableStatement cs=cn.prepareCall("{call stop_redudancy()}");
		cs.execute();cs.close();
		cn.commit();
		cn.setAutoCommit(true);
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	System.out.println(e);
	}
	
	return flag;
}
public static boolean updateResult(ResultBean[] ob)
{
	boolean flag=false;
	try
	{
		Connection cn=DbConnection.getConnection();
		cn.setAutoCommit(false);
		PreparedStatement ps = cn.prepareStatement("insert into result(regdno,sem,subject,marks,t_marks,open,sem_yr,branch) values(?,?,?,?,?,?,?,?)");
		for(int i=0;i<ob.length;i++)
		{
			ps.setString(1, ob[i].getRegdno());
			ps.setInt(2, ob[i].getSem());
			ps.setString(3, ob[i].getSubject());
			ps.setString(4, ob[i].getMark());
			ps.setString(5, ob[i].getT_mark());
			ps.setString(6, ob[i].getOpen());
			ps.setString(7, ob[i].getSem_yr());
			ps.setString(8, ob[i].getBranch());
			ps.addBatch();
		}
		int[] a= ps.executeBatch();
		for(int i=0;i<a.length;i++)
		{
			if(a[i]>=0)
				flag=true;
			else
			{
				flag=false;
				cn.rollback();
				break;
			}
		}
		CallableStatement cs=cn.prepareCall("{call stop_redudancy2()}");
		cs.execute();cs.close();
		cn.commit();
		cn.setAutoCommit(true);
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);
		}
	return flag;
}
public static AttendenceBean[] getAttendance(String regdno,String sem)//used to retrieve attendance in students profile page
{
	List<AttendenceBean> data = new ArrayList<AttendenceBean>();
	cn=DbConnection.getConnection();
	String branch=null;
	String yr=null;
try {
	PreparedStatement ps = cn.prepareStatement("select subject,count(attnd_dt) as attend from attendance c where sem=? and s_regdno=? group by subject order by subject asc");
	ps.setString(1, sem);
	ps.setString(2, regdno);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		if((branch==null) || (yr==null))
		{
			PreparedStatement ps1=cn.prepareStatement("select branch,pass_yr from attendance where s_regdno=?");
			ps1.setString(1, regdno);
			ResultSet rs1=ps1.executeQuery();
			if(rs1.next())
			{
				branch=rs1.getString(1);
				yr=rs1.getString(2);
			}
			ps1.close();
		}
		AttendenceBean ob=new AttendenceBean();
		ob.setSubject(rs.getString(1));
		ob.setAtt(rs.getString(2));
		PreparedStatement ps2=cn.prepareStatement("select count(*) from (select Distinct attnd_dt,time from attendance where branch=? and sem=? and subject=?  and pass_yr=? order by attnd_dt asc) ");
		ps2.setString(1, branch);
		ps2.setString(2, sem);
		ps2.setString(3, rs.getString(1));
		ps2.setString(4, yr);
		ResultSet rs2=ps2.executeQuery();
		if(rs2.next())
		{
			ob.setT_att(rs2.getString(1));
		}
		ps2.close();
		data.add(ob);
	}
	ps.close();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
	AttendenceBean[] att = new AttendenceBean[data.size()];
	att = data.toArray(att);
	return att;
}
public static String[] getUnPublishedResult(String branch)//get the un published result
{
	List<String> data = new ArrayList<String>();
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps = cn.prepareStatement("select Distinct sem_yr from result where open='c' and branch=? order by 1 asc");
		ps.setString(1, branch);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			data.add(rs.getString(1));
		}
		ps.close();}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);}
			String[] date = new String[data.size()];
			date = data.toArray(date);
			return date;
}
public static void publishResult(String branch,String sem_yr)//use to publish the unpublished result
{
	String open="o";
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps = cn.prepareStatement("update result set open=? where branch=? and sem_yr=?");
		ps.setString(1, open);
		ps.setString(2, branch);
		ps.setString(3, sem_yr);
		ps.executeUpdate();
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
		
}
public static ResultBean[] getSResult(String regdno)//returns individual results
{
	List<ResultBean> data = new ArrayList<ResultBean>();
	cn=DbConnection.getConnection();
	String open="o";
	try {
		PreparedStatement ps = cn.prepareStatement("select sem_yr,subject,marks,t_marks,sem from result where open=? and regdno=?  order by sem_yr desc");
		ps.setString(1, open);
		ps.setString(2, regdno);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			ResultBean ob=new ResultBean();
			ob.setSem_yr(rs.getString(1));
			ob.setSubject(rs.getString(2));
			ob.setMark(rs.getString(3));
			ob.setT_mark(rs.getString(4));
			ob.setSem(rs.getInt(5));
			data.add(ob);
		}ps.close();
		}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	ResultBean[] date = new ResultBean[data.size()];
	date = data.toArray(date);
	return date;
}
public static String[] getSemYr()
{
	List<String> data = new ArrayList<String>();
	cn=DbConnection.getConnection();
	String open="o";
	try {
		PreparedStatement ps = cn.prepareStatement("select Distinct sem_yr from result where open=? order by sem_yr desc");
		ps.setString(1, open);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			data.add(rs.getString(1));
		}
		ps.close();
		}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	String[] date = new String[data.size()];
	date = data.toArray(date);
	return date;
}
public static String[] getResultBranch(String semYr)//returns the branch whose result has been published
{
	List<String> data = new ArrayList<String>();
	String open="o";
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps = cn.prepareStatement("select Distinct branch from result where open=? and=sem_yr=? order by sem_yr desc");
		ps.setString(1, open);
		ps.setString(2, semYr);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			data.add(rs.getString(1));
		}
		ps.close();
		}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	String[] date = new String[data.size()];
	date = data.toArray(date);
	return date;
}
public static ResultBean[] getSemResult(String sem_yr)//returns result of a specific branch
{
	List<ResultBean> data = new ArrayList<ResultBean>();
	cn=DbConnection.getConnection();
	String open="o";
	try {
		PreparedStatement ps = cn.prepareStatement("select branch,regdno,sum(marks),sum(t_marks) from result where open=? and sem_yr=? group by branch,regdno order by regdno asc");
		ps.setString(1, open);
		ps.setString(2, sem_yr);
		//ps.setString(3, branch);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			ResultBean ob=new ResultBean();
			ob.setBranch(rs.getString(1));
			//System.out.println((rs.getString(1)));
			ob.setRegdno(rs.getString(2));
			ob.setMark(rs.getString(3));
			ob.setT_mark(rs.getString(4));
			data.add(ob);
		}
		ps.close();
		}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	ResultBean[] date = new ResultBean[data.size()];
	date = data.toArray(date);
	return date;
}
public static ResultBean[] getResult(String sem_yr)//returns result 
{
	List<ResultBean> data = new ArrayList<ResultBean>();
	cn=DbConnection.getConnection();
	String open="o";
	try {
		PreparedStatement ps = cn.prepareStatement("select regdno,subject,marks,t_marks from result where open=? and sem_yr=? order by regdno,subject asc");
		ps.setString(1, open);
		ps.setString(2, sem_yr);
		//ps.setString(3, branch);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			ResultBean ob=new ResultBean();
			ob.setRegdno(rs.getString(1));
			ob.setSubject(rs.getString(2));
			ob.setMark(rs.getString(3));
			ob.setT_mark(rs.getString(4));
			data.add(ob);
		}
		ps.close();
		}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	ResultBean[] date = new ResultBean[data.size()];
	date = data.toArray(date);
	return date;
}
public static boolean setNotice(NoticeBean ob) {
	boolean flag=true;
	cn=DbConnection.getConnection();
	try
	{
		PreparedStatement ps = cn.prepareStatement("insert into notification(iss_dt,heading,topic) values(?,?,?)");
		ps.setDate(1, ob.getIssDate());
		ps.setString(2, ob.getSubject());
		ps.setString(3, ob.getDetails());
		boolean b=ps.execute();
		flag=b;
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return flag;
}
public static NoticeBean[] getNotice()
{
	List<NoticeBean> data=new ArrayList<NoticeBean>();
	cn=DbConnection.getConnection();
	try
	{
		PreparedStatement ps=cn.prepareStatement("select iss_dt,heading,topic from notification");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			NoticeBean ob=new NoticeBean();
			ob.setDate(rs.getString(1));
			ob.setSubject(rs.getString(2));
			ob.setDetails(rs.getString(3));
			data.add(ob); 
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	NoticeBean[] date = new NoticeBean [data.size()];
	date = data.toArray(date);
	return date;
}
public static String[] getFcltyList()
{
	List<String> data=new ArrayList<String>();
	cn=DbConnection.getConnection();
	try
	{
		PreparedStatement ps=cn.prepareStatement("select name from faculties");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			data.add(rs.getString(1));
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	String[] ob=new String [data.size()];
	ob=data.toArray(ob);
	return ob;
}
public static Profile[] getFcltyList2()
{
	List<Profile> data=new ArrayList<Profile>();
	cn=DbConnection.getConnection();
	try
	{
		PreparedStatement ps=cn.prepareStatement("select name,regdno,dept from faculties order by dept asc");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Profile ob=new Profile();
			ob.setName(rs.getString(1));
			ob.setRegdno(rs.getString(2));
			ob.setBranch(rs.getString(3));
			data.add(ob);
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	Profile[] ob=new Profile [data.size()];
	ob=data.toArray(ob);
	return ob;
}
public static void updatePic(Profile_pic ob)
{
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps=cn.prepareStatement("update profile_pic set pic=? where regdno=?");
		ps.setBlob(1, ob.getPic());
		ps.setString(2, ob.getRegd());
		ps.executeUpdate();
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	}
public static byte[] retrivePic(String regd)
{
	cn=DbConnection.getConnection();
	Blob image=null;
	byte[] imb = null;
	try {
		PreparedStatement ps=cn.prepareStatement("select pic from profile_pic where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			if(rs.getBlob(1)!=null)
			{
			image=rs.getBlob(1);
			imb=image.getBytes(1,(int)image.length());
			}
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return imb;
	}
public static String getAdminMail()
{
	String email=null;
	String regd="Admin";
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps=cn.prepareStatement("select email from log_in where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			email=rs.getString(1);
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return email;
}
public static Profile setPwdOTP(String regd)
{
	Profile ob=new Profile();
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps=cn.prepareStatement("select email,regdno from log_in where regdno=?");
		ps.setString(1, regd);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			ob.setPassword(Checker.genarateAttOTP(regd));
			ob.setEmail(rs.getString(1));
			PreparedStatement	ps1=cn.prepareStatement("insert into pwd_otp(email,regdno,otp) values(?,?,?)");
			ps1.setString(1, rs.getString(1));
			ps1.setString(2, rs.getString(2));
			ps1.setString(3, ob.getPassword());
			ps1.executeUpdate();
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block 
		System.out.println(e);}
	return ob;
}
public static String changePassword(String otp,String pass)
{
	String msg=null;
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps=cn.prepareStatement("select regdno from pwd_otp where otp=?");
		ps.setString(1, otp);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			CallableStatement cs=cn.prepareCall("{call updatepassword(?,?)}");
			cs.setString(1, rs.getString(1));
			cs.setString(2, pass);
			cs.execute();cs.close();
			msg="Password changed ";
			ps=cn.prepareStatement("delete from pwd_otp where otp=?");
			ps.setString(1, otp);
			ps.execute();
			ps.close();
		}
		else
		{
			msg="Invalid/Expired OTP...";
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	return msg;
}
public static String[] getSem()
{
	List<String> data=new ArrayList<String>();
	cn=DbConnection.getConnection();
	try {
		PreparedStatement ps=cn.prepareStatement("select distinct sem from students order by sem asc");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			data.add(rs.getString(1));
		}
		ps.close();
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);}
	String[] ob=new String [data.size()];
	ob=data.toArray(ob);
	return ob;
	
}
public static void promotSem(int sem)
{
	 int s=sem;
	 int s2=sem;
	 int s3=sem;
	 try {
		 PreparedStatement ps=null;
		 if(sem>=6)
		 {
			 s=8;
			 s2=9;
			 s3=10;
			 ps=cn.prepareStatement("update students set sem=sem+1 where sem in(?,?,?,?)");
			 ps.setInt(2, s);
			 ps.setInt(3, s2);
			 ps.setInt(4, s3);
		 }
		 else
		 {
			 ps=cn.prepareStatement("update students set sem=sem+1 where sem=?"); 
		 }
		 ps.setInt(1, sem);
		 ps.executeUpdate();
		 ps.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e);
	}
}
}