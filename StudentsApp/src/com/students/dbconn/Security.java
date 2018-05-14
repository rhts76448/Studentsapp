/**
 * 
 */
package com.students.dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.students.bean.Profile;

/**
 * @author ACER
 *
 */
public class Security {
	// TODO validation of user
	private static Connection cn=DbConnection.getConnection();
	public static Profile loginChk(Profile ob)
	{
		Profile ob1=null;
		ob1=new Profile();
		String email=ob.getEmail();
		String pwd=ob.getPassword();
		try 
		{
			PreparedStatement ps=cn.prepareStatement("select regdno,name from log_in where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
			{
				ob1.setRegdno(rs.getString(1));
				ob1.setName(rs.getString(2));
				
				
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ob1;
		
	}
}
