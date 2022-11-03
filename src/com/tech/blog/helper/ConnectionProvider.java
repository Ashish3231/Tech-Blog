
package com.tech.blog.helper;

import java.sql.*;


public class ConnectionProvider 
{
	public static Connection con;
	
	public static Connection getConnection()
	{
		
		try
		{
			if(con == null)
			{
				System.out.println("enter................");
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("claspath................");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
				System.out.println("connection................");
			}
			
				
				
			
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("class not found exception................");
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return con;
	}

}