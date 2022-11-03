package com.tech.blog.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter out = response.getWriter();
		
		//login
		// fetch data from database
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u == null)
		{
			//error
			Message msg = new Message("invalid Details ! try with another", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			
			response.sendRedirect("login_page.jsp");
			
		}
		else
		{
			//login successful
			
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			
			
		}
		
		
	}

}
