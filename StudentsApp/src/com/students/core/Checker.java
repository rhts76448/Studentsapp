/**
 * 
 */
package com.students.core;

import java.util.Calendar;
import java.util.Random;

/**
 * @author ACER
 *
 */
public class Checker {

	public static boolean regdChk(String reg)
	{
		char c=reg.charAt(0);
		if(c=='T')
			return true;
		else
			return false;
	}
	public static boolean isAdmin(String reg)
	{
		
		if(reg.equals("Admin"))
		{
			return true;
		}
		else
			return false;
	}
	public static String fName(String name)
	{
		String fnm=null;
		String []nm=name.split(" ");
		fnm=nm[0];
		
		return fnm;
	}
   public static String semEncode(String sem)
   {
	   String ss=null;
	   switch(sem)
	   {
	   case "1":
		   ss="1st";
		   break;
	   case "2":
		   ss="2nd";
		   break;
	   case "3":
		   ss="3rd";
		   break;
	   case "4":
		   ss="4th";
		   break;
	   case "5":
		   ss="5th";
		   break;
	   case "6":
		   ss="6th";
		   break;
	   case "7":
		   ss="7th";
		   break;
	   case "8":
		   ss="8th";
		   break;
	   }
	   return ss;
   }
   public static String semEncode(int sem)
   {
	   String ss=null;
	   switch(sem)
	   {
	   case 1:
		   ss="1st";
		   break;
	   case 2:
		   ss="2nd";
		   break;
	   case 3:
		   ss="3rd";
		   break;
	   case 4:
		   ss="4th";
		   break;
	   case 5:
		   ss="5th";
		   break;
	   case 6:
		   ss="6th";
		   break;
	   case 7:
		   ss="7th";
		   break;
	   case 8:
		   ss="8th";
		   break;
	   }
	   return ss;
   }
   public static String semDecode(String sem)
   {
	   String ss=null;
	   switch(sem)
	   {
	   case "1st Semester":
		   ss="1";
		   break;
	   case "2nd Semester":
		   ss="2";
		   break;
	   case "3rd Semester":
		   ss="3";
		   break;
	   case "4th Semester":
		   ss="4";
		   break;
	   case "5th Semester":
		   ss="5";
		   break;
	   case "6th Semester":
		   ss="6";
		   break;
	   case "7th Semester":
		   ss="7";
		   break;
	   case "8th Semester":
		   ss="8";
		   break;
	   }
	   return ss;
   }
   public static String getYear()
   {
	   String year=null;
	   int m=Calendar.getInstance().get(Calendar.MONTH);
		int yr=Calendar.getInstance().get(Calendar.YEAR);
		int y;
		if(m<=6)
		{
			y=yr-1;
			year=y+"-"+yr;
		}
		else if(m>6)
		{
			y=yr+1;
			year=yr+"-"+y;
		}
	   return year;
   }
   public static boolean notEquals(String s1,String s2)
   {
	   if(s1.equals(s2))
		   return false;
	   else 
		   return true;
   }
   public static String genarateAttOTP(String regd)
   {
	   String otp=null;
	   //System.out.println(regd);
	   String r=regd.substring(regd.length()-2);
	   Random ran=new Random();
	   int int1=1+ran.nextInt(8);
	   int int2=1+ran.nextInt(8);
	   int int3=1+ran.nextInt(8);
	   int int4=1+ran.nextInt(8);
	   int int5=1+ran.nextInt(8);
	   int int6=1+ran.nextInt(8);
	   otp=int1+int2+int3+r+int4+int5+int6;
	   //System.out.println(otp);
	   return otp;
   }
}
