package com.alumni.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.alumni.bean.Profile;

public class CRUD {
	static Connection cn=null;
	static PreparedStatement ps=null;
	static CallableStatement cs=null;
	static ResultSet rs=null;
	
	public static int verifyEmail(String email)
	{
		int c=0;
		try
		{
			cn=DbConnection.getConnection();
			ps=cn.prepareStatement("select count(*) from alumni where email=?");
			ps.setString(1, email);
			rs=ps.executeQuery();
			if(rs.next())
			{
				c=rs.getInt(1);
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return c;
	}
	public static int setVerificationURL(String email,String url)
	{
		int b=0;
		try
		{
			cn=DbConnection.getConnection();
			ps=cn.prepareStatement("insert into email_verify(email,url) values(?,?)");
			ps.setString(1, email);
			ps.setString(2, url);
			b=ps.executeUpdate();
			ps.close();
			
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return b;
	}
	public static String verifyURL(String url)
	{
		String email=null;
		try
		{
			cn=DbConnection.getConnection();
			ps=cn.prepareStatement("select email from email_verify where url=?");
			ps.setString(1, url);
			rs=ps.executeQuery();
			if(rs.next())
			{
				email=rs.getString(1);
			}
			ps.close();
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return email;
	}
	public static boolean setAlumni(Profile ob)
	{
		boolean b=false;
		
		try {
			cn=DbConnection.getConnection();
			ps=cn.prepareStatement("insert into alumni(name,gender,dob,address,city,district,state,pin,contact_no,email,password,batch,stream,regd_no,qualification,occupation,off_address,off_city,off_district,off_state,off_pin) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,ob.getName());
			ps.setString(2, ob.getGender());
			ps.setString(3, ob.getDob());
			ps.setString(4, ob.getAddress());
			ps.setString(5, ob.getCity());
			ps.setString(6, ob.getDistrict());
			ps.setString(7, ob.getState());
			ps.setString(8, ob.getPIN());
			ps.setString(9, ob.getMob());
			ps.setString(10, ob.geteMail());
			ps.setString(11, ob.getPassword());
			ps.setString(12, ob.getBatch());
			ps.setString(13, ob.getBranch());
			ps.setString(14, ob.getRegdno());
			ps.setString(15, ob.getQualification());
			ps.setString(16, ob.getOccuptation());
			ps.setString(17, ob.getOffAddress());
			ps.setString(18, ob.getOffCity());
			ps.setString(19, ob.getOffDistrict());
			ps.setString(20, ob.getOffState());
			ps.setString(21, ob.getOffPIN());
			int n=ps.executeUpdate();
			ps.close();
			if(n>0)
			{
				b=true;
				ps=cn.prepareStatement("delete from email_verify where email=?");
				ps.setString(1, ob.geteMail());
				ps.executeUpdate();
				ps.close();
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		
		return b;
	}
}