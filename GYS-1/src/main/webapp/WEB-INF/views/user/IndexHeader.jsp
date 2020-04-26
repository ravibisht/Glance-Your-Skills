<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     --%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title }</title>


     <!-- <link rel="stylesheet" href="/css/style.css"/>
     <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css"/>
     <script src="/jquery/jquery.min.js"></script>
     <script src="/css/bootstrap/js/bootstrap.min.js"></script>
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> -->


</head>
<body>

	<!-- HEADER  -->
	<header class="header-area z-index">
		<!-- NAV BAR -->
		<nav class="navbar navbar-expand-lg navbar-light sticky-top">
			<div class="container-fluid">

				<a class="navbar-brand logo_h" href="/index"><img
					src="img/logo.png" alt=""> <span>Glance Your Skill</span> </a>


				 <!-- SEARCH FOR USERNAME -->
				<!-- <div class="search">
					<form action="/action_page.php">
						<input type="text" class="custom-input" placeholder="type Username here">
						   <span class="search-icon"> 
						      <i class="fa fa-search fa-2x" aria-hidden="true"></i>
						</span>
					</form>
				</div> -->
			<!--	END OF THE SERACH FOR USERNAME -->


				<ul class="nav navbar-nav  ml-auto pr-5">
					<!-- <li class="nav-item active">
					    <a class="nav-link active"href="index.html">Home</a>
					</li>
					
					<li class="nav-item">
					    <a class="nav-link" href="about-us.html">Projects</a>
					</li>
					 -->
					<li class="nav-item">
					     <a class="nav-link" href="/signup">SignUP</a>
					</li>
					
					<li class="nav-item">
					   <a class="nav-link" href="/login">Login</a>
					</li>
					
					<li class="nav-item">
					    <a class="nav-link" href="/aboutus">About us</a>
					</li>
					
					<li class="nav-item">
					    <a class="nav-link" href="/feedback">Feedback</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- END OF THE NAV BAR  -->
	</header>
	<!-- END OF TEH HEADER -->



</body>
</html>