<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="AdminDashboardNavigation.jsp" %>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
  
 <div class="container custom-container">
  <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col col-xs-6">
            <h3 class="panel-title text-center">Feedbacks</h3>
          </div>
        </div>
      </div>

      <div class="card-body">
        <table class="table table-hover">
          <thead>
            <tr>
             <th>Id</th>
             <th>User id</th>
             <th>Full Name</th>
             <th>Mobile no</th>
             <th>Email</th>
             <th>Message</th>
             <th >Actions</th>
            </tr>
           </thead>
           
           <tbody> 
              <c:forEach  var="feedback" items="${feedbackByPage.getContent()}">
                <tr>
                    <td>${feedback.getId()}</td>
                  <td>  
                    <c:if test="${feedback.getUserId() eq 0}">
                         not available
                   </c:if>
                     <c:if test="${feedback.getUserId() ne 0}">
                     ${feedback.getUserId() }
                </c:if>
                </td>
                    <td>${feedback.getFullname()}</td>
                    <td>${feedback.getMobileNo()}</td>
                    <td>${feedback.getEmail()}</td>
                    <td>${feedback.getMessage()}</td>
                    <td style="width:140px;">
                      <c:set var="totalElement" value="${feedbackByPage.getNumberOfElements()}" />
                      <a class="btn btn-danger custom-btn-link" href="/admin/dashboard/del/feedback/${currentPage}/${feedback.getId()}/?total=${totalElement}" 
                                                onclick="return confirm('Are you really want to delete')"  >
                         <i class="fa fa-trash" aria-hidden="true"></i></a>
                    </td>
                   </tr>
                  </c:forEach>   
                 </tbody>
                </table>
                        <hr>

            <c:set var="disabled" value="disabled"/>
          <ul class="pagination  justify-content-center">
              <c:set var="currentPage"  value="${currentPage}"/>
                  <li class="page-item <c:if test="${currentPage eq 0}">
				                        <c:out value="${disabled}"></c:out>
                                     </c:if>" >
                           
               <a class="page-link" href="/admin/dashboard/show/feedback/page?page=${page}" aria-label="Previous">
                    <span aria-hidden="true">Previous</span>
               </a>
             </li> 
            
             <c:set var="totalPages" value="${feedbackByPage.getTotalPages()}"/>
           <c:forEach var="page" begin="0" step="1" end="${totalPages}">
              <c:if test="${ page le totalPages-1}">
                  <li class="page-item <c:if test="${page==currentPage}">
                                        <c:set var="active" value="active"></c:set>
				                        <c:out value="${active}"></c:out>
                                   </c:if>">
              
				<a class="page-link" href="/admin/dashboard/show/feedback/page?page=${page}">${page+1}</a>
              </li>
            </c:if>
           </c:forEach>
           
           <li class="page-item <c:if test="${currentPage == totalPages-1}">
				                        <c:out value="${disabled}"></c:out>
                                   </c:if>" >
           
               <a class="page-link" href="/admin/dashboard/show/feedback/page?page=${page+1}" aria-label="Next">
                    <span aria-hidden="true">Next</span>
                   </a>
            </li>    
          </ul>

       
        </div>
       </div>
      </div>
     </body>
    </html>