<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="com.tech.blog.entities.Message"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
<!-- navbar -->
<%@include file="normal_navbar.jsp" %>

	<main class="d-flex align-items-center" style="height: 100vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span><br>
							<p>Login Here</p>
						</div>
						
						<%
							Message m = (Message)session.getAttribute("msg");
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
						
						
						<div class="card-body">
						   <form action="LoginServlet" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							
							<div class="container text-center">
								  <button type="submit" class="btn primary-background text-white">Submit</button>
							</div>
							
							</form>
						</div>
					</div>
					
				</div>
			
			</div>
			
		</div>
		
	</main>



<!-- 	JAvascript -->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js"></script>
</body>
</html>