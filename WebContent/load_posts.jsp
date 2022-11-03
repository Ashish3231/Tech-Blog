<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.entities.User" %>


<div class="row">
<%
	User uuu = (User) session.getAttribute("currentUser");

	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts=null;
	
	if(cid == 0)
	{
		
		
		posts = d.getAllPosts();
	}
	else
	{
		
		posts = d.getPostByCatId(cid);
	}
	if(posts.size() == 0)
	{
		out.println("<h3 class='display-3 text-center'>No posts in this category...</h3>");
		return;
	}
	for(Post p : posts)
	{
		
%>

<div class="col-md-6 mb-5">
	<div class="card ">
		<img class="card-img-top" src="blog_pic/<%= p.getpPic() %>" alt="Card image cap">
		<div class="card-body">
			<b><%= p.getpTitle() %></b>
			<p><%= p.getpContent() %></p>
			
		</div>
		<div class="card-footer">
				<%
				    		LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				    		
				    		
				 	%>
						
			<a href="#!" onclick="doLike(<%= p.getPid()%>, <%= uuu.getId() %>)" class="btn btn-outline-success btn-sm primary-background text-white"><i class="far fa-thumbs-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
						
			<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-success btn-sm primary-background text-white">Read More..</a>
			
			<a href="#!" class="btn btn-outline-success btn-sm primary-background text-white"><i class="fa fa-comment"></i><span></span></a>
			
		</div>
	</div>
</div>
	

<%		
		
	}
%>

</div>

