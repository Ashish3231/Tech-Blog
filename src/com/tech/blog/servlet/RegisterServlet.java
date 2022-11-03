package com.tech.blog.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
//import com.tech.blog.dao.*;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

//import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		PrintWriter out = response.getWriter();
		
		String check = request.getParameter("check");
		if(check == null)
		{
			out.println("box not checked");
		}
		else
		{
			//baki k data nikal lo term and condition mann li gyi h
			String name = request.getParameter("user_name");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("user_gender");
			String email = request.getParameter("user_email");
			String about = request.getParameter("about");
			
			
			//create user object and set  int that object
			
			User user = new User(name, email, password, gender, about);
			
			
		  //create UserDao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user))
			{
				out.println("done");
				out.println(request.getParameter("user_name"));
				out.println(request.getParameter("user_password"));
				out.println(request.getParameter("user_gender"));
				out.println(request.getParameter("user_email"));
				
			}
			else
			{
				out.println("thodi si GALTI HO RHI H");
			}
		}
		
		
	}

}
