<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        
         <div class="container ">
          <div class="contact-form  ">
            <div class="contact-image">
                <img src="images/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form  action="/feedback" method="post">
                <h3>Drop Us a Feedback</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="fullname" class="form-control" placeholder="Your Name *" required />
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="Your Email *" required/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="mobileNo" class="form-control" placeholder="Your Phone Number *" required />
                        </div>
                        <div class="form-group">
                            <input type="submit" name="btnSubmit" class="btn btn-primary ml-2 mt-2" value="Send Message" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea name="message" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;" required></textarea>
                        </div>
                    </div>
                </div>
            </form>
      </div>
      </div>
     

 <%@include file="Footer.jsp" %>     
</body>
</html>