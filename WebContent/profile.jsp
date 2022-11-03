<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.entities.Message" %>


<%
	User user =(User)session.getAttribute("currentUser");
	if(user == null)
	{
		response.sendRedirect("login_page.jsp");
	}
	


%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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

</style>
</head>
<body>
<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  //for new version HTTP 1.1
		response.setHeader("Pragma", "no-cache");	// for older version HTTP 1.2      help print message after profile update
		response.setHeader("Expires","0");  //for Proxies
	
%>
			<nav class="navbar navbar-expand-lg navbar-dark primary-background">
				  <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span>Tech Blog</a>
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav mr-auto">
				      <li class="nav-item active">
				        <a class="nav-link" href="#"><span class="far fa-bell"></span>Learncode with me <span class="sr-only">(current)</span></a>
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

			<%
				Message m = (Message) session.getAttribute("msg");
				if(m != null)
				{
			%>
			<div class="alert <%= m.getCssClass() %>" role="alert">
			
				<%= m.getContent() %>
			</div>
			
			<%		
					session.removeAttribute("msg");
					
				}
			
			
			%>
			
<!--   main body of the page -->

		<main>
			<div class="container">
				<div class="row mt-4">
					<!--first col -->
					<div class="col-md-4"> 
<!-- 						catogories -->
						<div class="list-group">
						  <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action primary-background text-white">
						   All Posts
						  </a>
						  
		       			  <!-- categories -->
		       			  
		       			  <%
		       			  	PostDao d = new PostDao(ConnectionProvider.getConnection());
		       			    ArrayList<Category> list1 = d.getAllCategories();
		       			  
		       			    for(Category cc : list1)
		       			    {
		       			  
		       			   %>
 		       			  <!-- this means reference of link your are click -->
		       			   	<a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
		       			   <% 	
		       			    	
		       			    }
		       			  
		       			   %>
						  
						  
						  
						  
						</div>
											
					
					</div>
					
				 	<!--  second col -->
					<div class="col-md-8" >
<!-- 						posts -->
						<div class="container text-center" id="loader" >
							<i class="fa fa-star fa-3x fa-spin"></i>
							<h3 class="mt-2">loading...</h3>
						</div>
						
						<div class="container-fluid" id="post-container">
						
						</div>
						
					
					</div>
					
				
				</div>
			
			</div>
		
		</main>



<!-- end of main body of the page -->

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
		       	
		       		<form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
		       			
		       			<div class="form-group">
		       				<select class="form-control" name="cid"> <!-- cid which is used in AddServlet page -->
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

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="js/myjs.js"></script>
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
			
			console.log("you have clicked on post submit")
			
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
				//console.log(data);
				$("#loader").hide();
				
				$("#post-container").html(data);
				$("#post-container").show();
				
				$(temp).addClass('primary-background text-white ');	
			}
		})	
	}
	
	
	$(document).ready(function (e){
		
		
		getPosts(0)
		
		
	})

</script>

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
		type: "POST",   // deafult type get hota hai
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


	
</body>
</html>