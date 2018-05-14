package com.alumni.core;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Random;

public class Util {
	
	public static String generateURL(String email)
	{
		String url=null;
		int n=email.indexOf("@");
		int m=email.lastIndexOf(".");
		String subURL=email.substring(0, n)+email.substring(n+1, m);
		String ip = null;
		  try {
			InetAddress inetAddress = InetAddress.getLocalHost();
			ip=inetAddress.getHostAddress();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		url="http://"+ip+":8086/Alumini/Register?q="+subURL;
		return url;
	}
	public static String generatePassword(String email)
	{
		String pwd=null;
		 Random ran=new Random();
		  int otp=ran.nextInt(99999);
		  int n=email.indexOf("@");
		  String subURL=email.substring(0, n);
		  pwd=subURL+otp;
		return pwd;
	}
}
