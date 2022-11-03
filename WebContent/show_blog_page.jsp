<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Post" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>


<%
	User user =(User)session.getAttribute("currentUser");
	if(user == null)
	{
		response.sendRedirect("login_page.jsp");
	}
	


%>
	
<%

	int postid = Integer.parseInt(request.getParameter("post_id"));
	
	PostDao post = new PostDao(ConnectionProvider.getConnection());
	Post value = post.getPostByPid(postid);
	
	if(value == null)
	{
		out.println("error");
	}
	
%>






<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= value.getpTitle() %></title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="css/all.css">

<style>

	body{
	
		background:url(img/background.jpg);
		background-size:cover;
		background-attachment:fixed;
	}
	
	.post-title{
		
		font-weight:100;
		font-size:30px;
	}
	
	.post-content{
		
		font-weight:100;
		font-size:20px;
	}
	
	.post-user-info{
	
		font-weight:100;
	
	}
	.post-date{
		
		font-style:italic;
		
	}
	

</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v8.0" nonce="mrJbz9g7"></script>

</head>
<body>

			<nav class="navbar navbar-expand-lg navbar-dark primary-background">
				  <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span>Tech Blog</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav mr-auto">
				      <li class="nav-item active">
				        <a class="nav-link" href="profile.jsp"><span class="far fa-bell"></span>Learncode with me <span class="sr-only">(current)</span></a>
				      </li>
				      
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          <span class="fa fa-ellipsis-v"></span>Categories
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="#">Action</a>
				          <a class="dropdown-item" href="#">Another action</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">Something else here</a>
				        </div>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#"><span class="fa fa-address-book"></span>Contact</a>
				      </li>
				     
				     <li class="nav-item">
				        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-save"></span>Do Post</a>
				      </li>
				     
				    </ul>
				    
				    <ul class="navbar-nav mr-right">
				    
				    		<li class="nav-item">
				        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
				            </li>
				            
				             <li class="nav-item">
				        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
				     		 </li>
				    </ul>
				  </div>
			</nav>
			
<!-- 			end of nav-bar -->
			



<!-- main content of the body -->
			
			<div class="container mt-4">
				<div class="card col-md-8 offset-md-2 " >
				  
				  <div class="card-body">
				   	
				   	<div class="post-title">
				   		<div class="card-header primary-background text-white text-center">
				   		
				   			 <%= value.getpTitle() %>
				   	
				     	</div>
				    </div>
				 
				    
				    <img class="card-img-top my-2 " src="blog_pic/<%= value.getpPic() %>"  alt="Card image cap" style="max-width: 670px;">
				    
				    <div class="row">
				    	<div class="col-md-8 ">
				    	
				    		<%
				    			UserDao ud = new UserDao(ConnectionProvider.getConnection());
				    		%>
				    	
				    		<p class="post-user-info"><a href="#"><u><%= ud.getUserByUserId(value.getUserId()).getName()%></u></a> has posted </p>
				    	
				    	</div >
				    		
				    	<div class="col-md-4">
				    		<p class="post-date"> <%= DateFormat.getDateInstance().format(value.getpDate()) %></p>
				    	</div>
				    </div>
				    
				   <div class="post-content">
				   	 <p class="card-text"><%= value.getpContent() %></p>
				   </div>
				   
				     
				    
				    <div class="post-code">
				    	<pre><%= value.getpCode() %></pre>
				    </div>
				    
				   
				    <br>
				    <br>
				    <div class="card-footer">
				    
				    	<%
				    		LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				    		
				    		
				    	%>
						
						<a href="#!" onclick="doLike(<%= value.getPid()%>, <%= user.getId() %>)" class="btn btn-outline-success btn-sm primary-background text-white"><i class="far fa-thumbs-up"></i><span class="like-counter"><%=ld.countLikeOnPost(value.getPid()) %></span></a>
						
						<a href="#!" class="btn btn-outline-success btn-sm primary-background text-white"><i class="fa fa-comment"></i><span>20</span></a>
						
					</div>
						<div class="card-footer">
							
							<div class="fb-comments" data-href="http://localhost:8082/TechBlog/show_blog_page.jsp?post_id=<%= value.getPid() %>" data-numposts="5" data-width=""></div>
						</div>
					
				  </div>
				</div>
	
			</div>

<!--end of  main content of the body -->



<!-- profile modal -->

		
		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	<div class="container text-center">
		       			 <img src="pics/<%= user.getProfile() %>" style="max-width:150px; border-radius:50%; ">
		       			 <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
		       	
<!-- 		       			details -->
						
						<div id="profile-details">
							<table class="table">
							  
							  <tbody>
							    <tr>
							      <th scope="row">ID :</th>
							      <td><%= user.getId()%></td>
							      
							    </tr>
							    <tr>
							      <th scope="row">Email :</th>
							      <td><%= user.getEmail() %></td>
							      
							    </tr>
							    <tr>
							      <th scope="row">Gender :</th>
							      <td><%= user.getGender()%></td>
							     
							    </tr>
							    
							     <tr>
							      <th scope="row">Status :</th>
							      <td><%= user.getAbout()%></td>
							     
							    </tr>
							    
							     <tr>
							      <th scope="row">Registered on :</th>
							      <td><%= user.getDateTime().toString()%></td>
							     
							    </tr>
							  </tbody>
							</table>
						</div>
						
<!--					profile edit -->
						
						<div id="profile-edit" style="display: none;">
							
							<h4 class="mt-2"> please edit carefully</h4>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								
								<table class="table">
									
									<tr>
										<th>ID: </th>
										<td><%= user.getId()%></td>
									</tr>
									
									<tr>
										<th>Email: </th>
										<td><input class="form-control" type="email" name="user_email" value="<%=user.getEmail() %>" ></td>
									</tr>
									
									<tr>
										<th>Name: </th>
										<td><input class="form-control" type="text" name="user_name" value="<%=user.getName() %>" ></td>
									</tr>
									
									<tr>
										<th>Password:</th>
										<td><input class="form-control" type="password" name="user_password" value="<%=user.getPassword() %>" ></td>
									</tr>
									
									<tr>
										<th>Gender: </th>
										<td><%= user.getGender().toUpperCase() %></td>
									</tr>
									
									<tr>
										<th>About: </th>
										<td><textarea rows="3" class="form-control" name="user_about"  > <%=user.getAbout() %></textarea></td>
									</tr>
									
									<tr>
										<th>Edit pic: </th>
										<td><input class="form-control" type="file" name="image"  > </input></td>
									</tr>
								</table>
								
									<div>
										<button type="submit" class="btn btn-outline-success">save</button>
										
									</div>
							
							</form>
						</div>
		       	
		       	</div>
		       	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button id="edit-profile-button" type="button" class="btn btn-primary primary-background text-white">Edit</button>
		      </div>
		    </div>
		  </div>
		</div>

<!-- end of profile model -->
			
<!-- add post modal -->

		
		
		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">provide post details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       	
		       		<form id="add-post-form" action="AddPostServlet" method="post">
		       			
		       			<div class="form-group">
		       				<select class="form-control" name="cid">
			       				<option selected disabled>---select category---</option>
			       				
			       				<%
			       					PostDao postd = new PostDao(ConnectionProvider.getConnection());
			       					ArrayList<Category> list = postd.getAllCategories();
			       					for(Category c : list){
			       				
			       				%>
			       				
			       				<option value="<%= c.getCid() %>"><%= c.getName() %></option>
			       				<%
			       					}
			       				%>
		       			
		       				</select>
		       			
		       			</div>
		       			
		       			<div class="form-group">
		       				<input name="pTitle" type="text" placeholder="enter post Title" class="form-control"/>
		       			</div>
						
						<div class="form-group">
							<textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content"></textarea>
						</div>
						
						<div class="form-group">
							<textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						
						<div class="form-control">
							<lable>Upload image</lable><br>
							<input type="file" name="pic" />
						</div>
						
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button> 
						</div>
		       		
		       		</form>
		       	
		       	
		      </div>
		      
		    </div>
		  </div>
		</div>

<!-- end post modal -->

<!-- 	JAvascript -->
<script src="js/myjs.js"></script>

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>

function doLike(pid, uid)
{
	console.log(pid +","+ uid)

	const d = {
		uid:uid,
		pid: pid, 
		operation: 'like'
	}
	
	$.ajax({
		
		url: "LikeServlet",
		type: "POST",
		data: d,
		success: function (data, textStatus, jqXHR)
		{
			console.log(data);
			if(data.trim() == 'Served at: /TechBlogtrue')
			{
				let c = $(".like-counter").html();
				c++;
				$(".like-counter").html(c);
			}
			else
			{
				let c = $(".like-counter").html();
				c--;
				$(".like-counter").html(c);
			}
		},
		error: function (jqXHR, textStatus, errorThrown)
		{
			console.log(data);
		}
	})
}
</script>


<script>
	
	$(document).ready(function(){
		
		let editStatus = false;
		
		$('#edit-profile-button').click(function(){
			
			if(editStatus == false)
			{
				$('#profile-details').hide()
				
				$('#profile-edit').show()
				$(this).text("Back")
				editStatus = true;
			}
			else
			{
				$('#profile-details').show()
				
				$('#profile-edit').hide()
				$(this).text("Edit")
				editStatus = false;
			}
			
		})
	});
	
</script>

<!-- now add post js -->

<script>
	$(document).ready(function(){
		
		$("#add-post-form").on("submit", function(event){
			
			//this code is called when fom is submitted
			event.preventDefault();  // stop synchrons behavior
			
			console.log("you have clicked on submit")
			
			let form = new FormData(this);
			
			//now equest to server
			$.ajax({
				url: "AddPostServlet",
				type: "POST",
				data: form,
				success: function(data, textStatus, jqXHR){
					//success
					console.log(data);
					if(data.trim() == 'Served at: /TechBlogdone')
					{
						swal("Good job!", "saved Successfully", "success");
					}
					else
					{
						swal("Error", "Something went Wrong!", "error");
					}
					
				},
				error: function(jqXHR, textStatus, errorThrown){
					//error..
					
						swal("Error", "Something went Wrong!", "error");
					
					
				},
				processData: false,
				contentType: false
			
			})
			
			
		})
	})
	

</script>

<!-- loasding post using ajax -->

<script>

	function getPosts(catId, temp)
	{
		$("#loader").show();
		$("#post-container").hide();
		
		$(".c-link").removeClass('primary-background text-white');  //remove active class 
		
		$.ajax({
			url: "load_posts.jsp",
			data: {cid: catId},
			success: function (data, textStatus, jqXHR)
			{
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data);
				
				$(temp).addClass('primary-background text-white ');
				
				
			}
		})
		
	}
	
	
	$(document).ready(function (e){
		
		
		getPosts(0)
		
		
	})

</script>



</body>


</html>