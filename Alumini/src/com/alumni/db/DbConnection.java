package com.alumni.db;

import java.sql.Connection;


public class DbConnection {
	private static Connection connection;
	public static void setConnection(Connection connection) {
		DbConnection.connection = connection;
	}
	public static Connection getConnection()
	{
		return DbConnection.connection;
	}
}
