<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
<%@ page import="com.tech.blog.helper.*"%>
 
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
	.banner-background{
		clip-path:polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
	}
	.container h3{
	
		font-size: 3rem;
	}
	.container p{
		font-size: 1.2rem;
	}
	
	
	
</style>
</head>
<body>

<!-- 	navbar -->
	<%@ include file="normal_navbar.jsp" %>
	
<!-- Banner	 -->
<div class="container-fluid p-0 m-0 banner-background ">
	<div class="jumbotron primary-background text-white">
		<div class="container">
			<h3 class="">Welcome to TechBlog</h3>
			<h3>Tech Blog</h3>
			<p>Welcome to technical blog, world of technology
			A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
			<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>		
			
			<button class="btn btn-outline-light btn-lg"><span class="fa fa-link fa-spin"></span>start !its free</button>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Login</a>
		
		</div>
	</div>
	
	
	
</div>


<!-- cards -->

<div class="container">
	
	<div class="row md-2">
		
		<div class="col-lg-4 col-12">
		
			
				  
				  	<div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white">Read more</a>
				    </div>
				 
				
			
		</div>
		<div class="col-lg-4 col-12">
		
			
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white">Read more</a>
				  </div>
				
			
		</div>
		<div class="col-lg-4 col-12">
		
			
				  <div class="card-body">
				    <h5 class="card-title text-center">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white text-center">Read more</a>
				  </div>
				
			
		</div>
	</div>
	
		<div class="row">
		
		<div class="col-lg-4 col-12">
		
			
				  <div class="card-body">
				    <h5 class="card-title text-center">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white text-center">Read more</a>
				  </div>
				
			
		</div>
		<div class="col-lg-4 col-12">
		
			
				  <div class="card-body">
				    <h5 class="card-title text-center">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white text-center">Read more</a>
				  </div>
				
			
		</div>
		<div class="col-lg-4 col-12">
		
			
				  <div class="card-body ">
				    <h5 class="card-title text-center">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-white text-center">Read more</a>
				  </div>
				
			
		</div>
	</div>
</div>

	
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