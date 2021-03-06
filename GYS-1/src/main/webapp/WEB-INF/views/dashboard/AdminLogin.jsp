<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

<link href="/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

  <style type="text/css" >
  body {
    font: 400 15px sans-serif;
    line-height: 1.8;
    color: #818181;
  }

.login-form {
    width: 340px;
    margin: 50px auto;
    margin-top: 12%;
  }
  
   .login-form form {
        margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
        }
     .login-form h2 {
        margin: 0 0 15px;
       }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
        }

   .login-form h2{
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    }
  </style>
  
</head>
<body>

    <div class="login-form ">
                   
           <form action="/admin/login" method="post">
            <h2 class="text-center">Admin Log in</h2>       
            <br>
            <div class="${bootstrapclass}">${message}</div>
            <div class="${bootstrapclass_error}">${loginerror}</div>
         <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" required="required" name="username" value="${username}">
        </div>

        <div class="form-group">
          <input type="password" class="form-control" placeholder="Password" required="required" name="password">
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-block">Log in</button>
        </div>
      </form>
  </div>
</body>
</html>