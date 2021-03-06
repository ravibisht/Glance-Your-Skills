<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="AdminDashboardNavigation.jsp" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>



  function printReport() {
	  var from_date = document.getElementById('from_date').value;
	  if ( from_date== null || from_date== '')
	  {
	      alert("From Date is Can't be Empty");
	      return false;
	  }
	  
	  var to_date = document.getElementById('to_date').value;
	  if ( to_date== null || to_date== '')
	  {
	      alert("To Date is Can't be Empty");
	      return false;
	  }
	  
      var reportType=document.getElementById("reporttype").value;	
      var fromDate=document.getElementById("from_date").value;
      var toDate=document.getElementById("to_date").value;
      var myWindow = window.open("/admin/dashboard/show/report?report_type="+reportType+"&from_date="
    		  +fromDate+"&to_date="+toDate, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=100,width=1200,height=620" );
  }
 </script>

</head>

<body>
  
   <div class="container custom-container-report mt-5 pl-5 ">
     <div class="card  shadow-lg">
          <div class="card-header  text-center">
             <h2>Show Reports</h2>
     	  </div>
                    <br>
                   <div class="${bootstrapclass} text-center "><h4>${errorMessage}</h4></div>
                   
				  <div class="offset-2 mt-5  font-weight-bold " style="font-size: 20px">
					 <form action="/admin/dashboard/show/report" method="post"  >
				           <div class="form-group row  ">
				              <label for="reporttype" class="control-label col-sm-2">Report type</label>
				           
				            <div class="col-sm-4">
				               <select class="form-control" id="reporttype" style="font-size: 20px" name="report_type">
				                        <option value="user_sign_up_report">User SignUp Report</option>
				                        <option value="feedback_report">Feedback Report</option>
				                 </select>        
				            </div>
				    </div>

				    <div class="form-group row">
				        <label for="from_date" class="control-label col-sm-2">From date</label>
				        <div class="col-sm-4">
				          <input type="date" class="form-control" id="from_date" name="from_date" required />
				        </div>
				    </div>
				    <div class="form-group row">
				        <label for="to_date" class="control-label col-sm-2">To date</label>
				        <div class="col-sm-4">
				         <input type="date" class="form-control" id="to_date" name="to_date" required/>
				        </div>
				    </div>
				    
				    <div class="form-group row">
				        <div class="offset-sm-2  mb-5">
				            <button type="button" class="btn btn-primary" onclick="printReport()">Search</button>
				        </div>
				    </div>
		</form>
      </div>
    </div>
  </div>
 


</body>
</html>