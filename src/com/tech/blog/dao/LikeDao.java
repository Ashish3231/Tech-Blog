package com.tech.blog.dao;

import java.sql.*;

public class LikeDao 
{
	Connection con;
	
	public LikeDao(Connection con) 
	{
		this.con = con;
	}
	
	public boolean insertLike(int pid, int uid)
	{
		boolean f = false;
		try
		{
			PreparedStatement p =this.con.prepareStatement("insert into good(pid, uid) values(?, ?)");
			
			//values set..
			p.setInt(1,  pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f= true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	
	public int countLikeOnPost(int pid)	
	{
		int count = 0;
		
		try
		{
			PreparedStatement p = this.con.prepareStatement("select count(*) from good where pid=?");
			p.setInt(1, pid);
			
			ResultSet set = p.executeQuery();
			
			if(set.next())
			{
				count = set.getInt("count(*)");	//value store in count(*) or 1 
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}

	
	public boolean isLikedByUser(int pid, int uid)		// check liked or not

	{
		boolean f = false;
		
		try
		{
			PreparedStatement p = this.con.prepareStatement("select * from good where pid=? and uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet set = p.executeQuery();
			
			if(set.next())
			{
				f = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	
	public boolean deleteLike(int pid, int uid)			// delete like 

	{
		boolean f = false;
		
		try
		{
			PreparedStatement p = this.con.prepareStatement("delete from good where pid=? and uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			
			f = true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
}
