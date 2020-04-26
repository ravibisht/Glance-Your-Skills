<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@include file="header.jsp"  %>   
 
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>



	<!-- SIGN-UP FORM SECTION  -->
	<section>
		<!-- <div class="container  mt-5  "> add this class if you want your form not too wide -->

		<!-- SIGN-UP FORM CONTAINER -->
		<div class="signup-form-container shadow-lg">

			<div class="row">
				<div class="col-12 text-center text-uppercase mb-3">
					<h2>Sign Up</h2>
				</div>
			</div>

			<!-- SIGN-UP FORM -->
			<form action="/signup" method="post">

				<div class="form-row">
					<div class="form-group col-6 ">
						<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"></i> <input
							type="text" class="form-control" placeholder="First Name"
							name="firstname" id="f_name" value="${user.getFirstname()}" required>
							<span id="f_name_error"></span>
							
					</div>

					<div class="form-group col-6 ">
						<input type="text" class="form-control lastname_formater" placeholder="Last Name"
							name="lastname" id="l_name"  value="${user.getLastname()}" required>
					      <span id="l_name_error"></span>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-12">
						<i class="fa fa-user fa-2x" aria-hidden="true"></i> 
						<input type="text" class="form-control" placeholder="Username"
							name="username"  id="u_name" value="${user.getUsername()}" required>
							<span id="u_name_error"></span>
					
					<span style="color:red">${Uerror}</span>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-12">
						<i class="fa fa-lock fa-2x" aria-hidden="true"></i> 
						<input type="password" class="form-control" placeholder="Password"
							name="password" id="password" required>
						<span id="password_error"></span>	
					</div>
				</div>

				 <div class="form-row">
					<div class="form-group col-12">
						<i class="fa fa-envelope fa-2x" aria-hidden="true"></i> 
						<input type="email" class="form-control" placeholder="Email"
							name="email" id="email_id" value="${user.getEmail()}" required>
							<span id="email_error"></span>
					</div>
					<span style="color:red">${emailerror}</span>
				</div> 

				<div class="form-row">
					<div class="form-group col-12">
						<i class="fa fa-phone fa-2x" aria-hidden="true"></i> 
						<input type="text" class="form-control" placeholder="Mobile no"
							name="mobileNo" id="mobile_no" value="${user.getMobileNo()}" min="10" required>
						<span id="mobile_no_error"></span>
					</div>
				</div>

				<button type="submit" id="sign_up_button" class="btn btn-primary btn-group-lg button ">Sign
					Up</button>
				
			</form>
			<!-- END OF THE SIGN-UP FORM -->
		
		   <p class="text-right  text-info">
					<a href="/login">Already have account?</a>
				</p>
		   	
			
		</div>
		<!--END OF THE SIGN-UP FORM CONTAINER  -->
	</section>
	<!-- END OF THE SIGN-UP FORM SECTION -->
	

<%@include file="Footer.jsp" %>

</body>
</html>