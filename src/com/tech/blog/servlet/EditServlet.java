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
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;




/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
//@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		// TODO Auto-generated method stub
	
		
		
		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		javax.servlet.http.Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();
		
//		get the userfrom the session
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("currentUser");
		
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile = user.getProfile();
		user.setProfile(imageName);
		
		//update database
		
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		
		boolean ans = userdao.updateUser(user);
		if(ans)
		{
			
			
			// request.getRealPath("/") = webcontent,  user.getProfile() = image name
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/")+ "pics" + File.separator + user.getProfile();
			
			@SuppressWarnings("deprecation")
			String pathOldFile = request.getRealPath("/")+ "pics" + File.separator + oldFile;
			
			if(!oldFile.equals("default.png"))
			{
				Helper.deleteFile(pathOldFile);	    //delete old file
			}
			
			if(Helper.saveFile(part.getInputStream(), path))	//add new file
			{
				out.println("updated to db");
				
				Message msg = new Message("profile updated...", "success", "alert-success");
			
				session.setAttribute("msg", msg);	//message not working
				
			}
		
			else
			{
				out.println(" not updated to db");

				Message msg = new Message("profile not updated...", "error", "alert-danger");
				
				session.setAttribute("msg", msg);	//message not working
				
			}
		
		}
		else
		{
			Message msg = new Message("profile not updated...", "error", "alert-danger");
			
			session.setAttribute("msg", msg);	//message not working
		}
		
		response.sendRedirect("profile.jsp");
	}

}
