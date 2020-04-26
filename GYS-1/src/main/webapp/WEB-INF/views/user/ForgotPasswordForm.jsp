<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="header.jsp" %>    
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<
</head>
<body>

     <!-- BACK TO  NAVIGATION CONTAINER -->
       <%@include file="Navigator.jsp" %>
    <!-- END OF THE BACK TO  NAVIGATION CONTAINER -->

  <div class="form-gap"  >
     <div class="container">
	    <div class="row">
		
          <div class="col-md-4 offset-4 py-5">
             <div class="card shadow ">
                <div class="card-body text-center">
                 
                    <h3><i class="fa fa-lock fa-4x"></i></h3>
                     <h2 class="text-center">Forgot Password?</h2>
                      <p>You can reset your password here.</p>
                       <p class="${bootstrapclass} ">${successMessage}
                       ${errorMessage}
                       </p>
                       
    
                            <form  role="form"  action="/forgot" method="post" >
                                  <div class="input-group mb-3 pt-4 ">
                                      <div class="input-group-prepend">
                                           <span class="input-group-text">
                                              <i class="fa fa-envelope" aria-hidden="true"></i>
                                            </span>
                                        </div>
                                           <input type="email" name="email" placeholder="email address"
                                             class="form-control" required>
                                   </div>
                                      <button type="submit" class="btn btn-primary btn-block mt-4 mb-3">Reset Password</button>
                            </form>
                       </div>
                   </div>
                </div>
              </div>
            </div>
	     </div>
      

<%@include file="Footer.jsp" %>  
    
</body>
</html>