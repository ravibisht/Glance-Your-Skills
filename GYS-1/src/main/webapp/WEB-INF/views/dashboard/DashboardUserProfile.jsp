<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="AdminDashboardNavigation.jsp" %>

<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

     <section >

    <div class="container " style="margin-left: 158px;">
      <div class="row">
        <div class="col-6 mx-auto d-block " style="height:575px;">
           <div class="card  shadow p-4 mb-4 bg-grey rounded" style="height:551px;"> 
         
                 <img src="/Users/blog_3.png" 
                       class="mx-auto d-block rounded-circle   mt-3" style="border-width: 6px" width="200" height="200"> 
                 <div class="card-body">
                     <h3 class="card-title text-center">@${userProfile.getUsername()}</h3>
                         <div class="card-text"> 
                             <h5 class="text-center font-weight-bold"> ${userProfile.getBio()}</h5>
                                 <div class="row pt-2">
                                      <div class="col-4 font-weight-bold ">
                                          <p> Name </p>
                                          <p> Email </p>
                                          <p> Mobile </p>
                                          <p> Profession </p>
                                      </div>
                                       <div class="col">
                                         <p class="text-capitalize"> ${userProfile.getFirstname() }  ${userProfile.getLastname()}</p>
                                         <p> ${userProfile.getEmail()} </p>
                                         <p> ${userProfile.getMobileNo()} </p>
                                         <p class="text-capitalize"> ${userProfile.getProfession()} </p>
                                </div>
                               </div>
                              </div>
                             </div>
                            </div>
                           </div>
                          </div>
                         </div>
 </section>
  

  <section>
  
     <div class="container mt-5" style="margin-left: 158px;">

             <div class="main_title text-center mb-5" >
                    <h2 class="text-uppercase">${userProfile.getFirstname()}'s All  PROJECTS</h2>
                    <p>Who are in extremely love with eco friendly system </p>
                </div>
     
<%--      <c:forEach step="1" begin="1" varStatus="counter" end="${ userProfile.getProjects().size()+2/3}">
 --%>     
             <div class="row">
               <c:forEach  var="userProject"   items="${userProfile.getProjects()}">
                    <div class="col-4 ">
                        <div class="p_item ">    
                           <div class="img_item ">    
                              
                                  <a href="/admin/dashboard/show/project/${userProject.getId() }" class="btn btn-link"> 
                                  <c:set var="projectImages" value="${userProject.getImage()}"/>
                                  
                                  <c:set var="images" value="${fn:split(projectImages,',') }"/>
                                  
                                     <img src="/ProjectAssets/Images/${images[0]}"  
                                      class=" img-fluid "  style="overflow: hidden">
                                  </a>
                            </div>
                            <div class="short_desc">
                                 <h4 class="text-capitalize">${userProject.getProjectName()}</h4>
                             </div>
                          </div>
                     </div>   
                  </c:forEach>
<%--                </c:forEach> 
 --%>             </div>
 
  </div>
  </section>


</body>
</html>