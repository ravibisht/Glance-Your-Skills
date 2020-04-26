<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

<style>

.font-decorater{
   
    font-size:20px;
    font-weight:bold;
  }

</style>

<script>

</script>

</head>
<body>
      <!-- BACK TO  NAVIGATION CONTAINER -->
      <%@include file="Navigator.jsp" %>
     <!-- END OF THE BACK TO  NAVIGATION CONTAINER -->
     
     
     <div class="col-md-4 offset-md-3 m-auto pt-5">
                    
        <div class="card shadow mt-3" style="width:500px;" >
                 <div class="mt-4">
                     <h1 class="mb-0 font-weight-bold text-center text-uppercase">Change Password</h1>
                 </div>
                    <div class="card-body">
                      <div class="${bootstrapclass}">  ${errorMessage}</div>
                    
                        <form class="form" action="/reset" method="post" autocomplete="off">
                            <div class="form-group">
                                <label for="reset_password" class="font-decorater">New Password</label>
                                <input type="password" class="form-control" id="reset_password" name="password" required>
                                 <span class="form-text small text-muted">
                                    The password must be 6-20 characters, and must <em>not</em> contain spaces.
                                </span>
                                <span id="reset_password_error"></span>
                             </div>
                                
                        <div class="form-group">
                             <label for="reset_password_verify" class="font-decorater">Confirm Password</label>
                             <input type="password" class="form-control" id="reset_password_verify" required>
                                <span class="form-text small text-muted">
                                     To confirm, type the new password again.
                                </span>
                                <span id="reset_password_verify_error"></span>
                         </div>
                       
                           <div class="form-group">
                                <input type="hidden" name="reset_token" value="${resetToken}">
                                <button type="submit" id="reset_pass_button" class="btn btn-primary btn-lg btn-block">Save</button>
                          </div>
                            
                    </form>
            </div>
 
    </div>
</div>


<%@include file="Footer.jsp" %>
</body>
</html>