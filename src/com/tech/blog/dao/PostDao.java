package com.tech.blog.dao;

import java.util.ArrayList;


import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import java.sql.Statement;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;

public class PostDao 
{
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories()

	{
		ArrayList<Category> list = new ArrayList<>();
		
		try 
		{
			String q = "select * from categories";
			
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);
			
			while(set.next())
			{
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				
				Category c = new Category(cid, name, description);
				list.add(c);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}

	
	public boolean savePost(Post p)


	{
		boolean f= false;
		
		try
		{
			String q = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			
			f=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	//get all posts 
	public List<Post> getAllPosts()
	{
		
		
		//fetch all post
		List<Post> list = new ArrayList<Post>();
		
		try
		{
			PreparedStatement p = this.con.prepareStatement("select * from posts pid desc");
			
			ResultSet set = p.executeQuery();
			
			while(set.next())
			{
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				java.sql.Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				
				Post post  = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(post);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	
	//get all post by cat id
	public List<Post> getPostByCatId(int catId)
	{
		// fetch all post by cat id
		List<Post> list = new ArrayList<Post>();
		
		try
		{
			PreparedStatement p = this.con.prepareStatement("select * from posts where catId=?");
			
			p.setInt(1, catId);
			
			ResultSet set = p.executeQuery();
			
			while(set.next())
			{
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				java.sql.Timestamp date = set.getTimestamp("pDate");
				
				int userId = set.getInt("userId");
				
				Post post  = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
				list.add(post);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Post getPostByPid(int postid)
	{
		Post post = null;
		
		try
		{
			
			PreparedStatement p = this.con.prepareStatement("select * from posts where pid=?");
			p.setInt(1, postid);
			
			ResultSet set = p.executeQuery();
			
			if(set.next())
			{
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				int catId = set.getInt("catId");
				java.sql.Timestamp date = set.getTimestamp("pDate");
				
				int userId = set.getInt("userId");
				
				post  = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return post;
	}

	

}
