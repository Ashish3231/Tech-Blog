 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
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
	
	<main class="d-flex align-items-center" style="height:110vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="row"> <!-- card change with row for newlook -->
						<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-plus fa fa-3x"></span><br>
							Register here
						
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="POST">
								  <div class="form-group">
								    <label for="user_name">User name</label>
								    <input name="user_name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="user name">
								    
								  </div>
								  
									
								  <div class="form-group">
								    <label for="exampleInputEmail1">Email address</label>
								    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
								    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								  </div>
								  
								  
								  <div class="form-group">
								    <label for="exampleInputPassword1">Password</label>
								    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  
								  
								  <div class="form-group">
								    <label for="gender">Gender:</label>
								    <br>
								    <input type="radio" id="gender" name="gender"  value="male" >Male
								    <input type="radio" id="gender" name="gender" value="female" >Female
								  </div>
									
								 <div class="form-group">
								  	<textarea name="about" rows="3" class="form-control" placeholder="write something about your self"></textarea>
								  
								  </div>
									
								  <div class="form-check ">
								    <input name="check" type="checkbox" class="form-check-input primary-background" id="exampleCheck1">
								    <label class="form-check-label" for="exampleCheck1">Agree terms and Conditions</label>
								  </div>
								  <br>
								  <div id="loader" class="container text-center " style="display: none;">
								  	
								  	<span class="fa fa-registered  fa-4x fa-spin "></span>
								  	<h4>please waiting....</h4>
								  	
								  </div>
								  
								 
								  
								  
								  <button id="submit-btn" type="submit" class="btn btn-primary primary-background text-white">Submit</button>
							</form>
														
					    </div>
					    
					
					</div>
				
				
				</div>
			</div>	
		</div>
	</main>


	
<!-- 	Javascript -->

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>
	$(document).ready(function(){
		
		console.log("loaded.............")
		
		$('#reg-form').on('submit', function (event){
			
			event.preventDefault();  //stop to going RegisterServlet
			
			let form = new FormData(this);   // save all form information into form variable
			
			$('#loader').show();
			$('#submit-btn').hide();
			//send to Register Servlet
			$.ajax({
				
				url:"RegisterServlet",
				type:"POST",
				data: form,
				success: function (data, textStatus, jqXHR){
					console.log(data)
				$('#loader').hide();
					$('#submit-btn').show();
				if(data.trim() === 'done')
				{
					
					swal("Register Successully...")
					.then((value) => {
					  window.location="login_page.jsp";
					});
				}
				else
				{
					
					swal(data);
				}
					
					
				},
				error: function (jqXHR, textStatus, errorThrown){
					$('#loader').hide();
					$('#submit-btn').show();
					swal("Something went wrong....");
								
				},
				processData: false, 
				contentType: false
				
			});
			
		})
	})
	
	
</script>







</body>
</html>