<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- <%@include file="user/header.jsp" %> 
 --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <style>
 
 
 .text-wrapper {
    height: 100%;
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
 }
 
 .title {
  margin-top:50px;
    font-size: 6em;
    font-weight: 700;
    color: #EE4B5E;;
 }
 
 .subtitle {
    font-size: 40px;
    font-weight: 700;
    color: #1FA9D6;
 }

 .message{
  margin-top:30px;
  font-size: 40px;
  font-weight: 700;
    color: #000;
  }
 
 </style>
</head>
<body>


<div class="text-wrapper">
    <div class="title" data-content="404">
        404
    </div>

    <div class="subtitle">
        Oops, the page you're looking for doesn't exist.
    </div>
   
    <div class="message">
     
     ${errorMessage}
    </div>    



        <a class="button" href="/user/home" style="margin-top:70px;">Go to homepage</a>
  
    
</div>

</body>
</html>