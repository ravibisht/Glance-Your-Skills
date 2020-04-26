<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

   .subtitle {
     font-size: 64px;
     font-weight: 700;
     color: #000;
   }

  .message{
    margin-top: 40px;
    font-size: 30px;
    font-weight: 700;
    color: #ff0000;
  }
  
  
 
 </style>




</head>
<body>

    <center>
    
      <img style="width:250px;" src="/images/error.svg"/>
      
      <h1 class="subtitle"> Unexpected Error : (</h1>
      <h2 class="message"> Something Went Worng </h2>
     
    
      <a class="button" href="/user/home" style="margin-top:70px;">Go to homepage</a>
    
     ${message}
     ${status}
     ${trace}
</center>

</body>
</html>