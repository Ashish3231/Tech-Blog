package com.tech.blog.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;


/**
 * Servlet implementation class LikeServlet
 */

public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
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
		
		try(PrintWriter out = response.getWriter())
		{
			boolean f = false;
			doGet(request, response);
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
			
			if(!ldao.isLikedByUser(pid, uid))
			{
				String operation = request.getParameter("operation");
				
				    if(operation.equals("like"))
					{
					    f = ldao.insertLike(pid, uid);
						out.println(f);
					}
			}
			else
			{
				ldao.deleteLike(pid, uid);
				out.println(f);
			}
			
		
		

		}
	}

}
