package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;



/**
 * Servlet implementation class AddPostServlet
 */

@MultipartConfig

public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pCode = request.getParameter("pCode");
		String  pContent = request.getParameter("pContent");
		javax.servlet.http.Part part = request.getPart("pic");
		
//		gettimg curremtuser id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		
		out.println("your post titlt is"+ pTitle);
		out.println(part.getSubmittedFileName());
		
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		
		if(dao.savePost(p))
		{
			
			
			// request.getRealPath("/") = webcontent,  user.getProfile() = image name
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/")+ "blog_pic" + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			
			out.println("done");
		}
		else
		{
			out.println("error");
		}
		
	

		
	}

}
