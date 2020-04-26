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
       <!-- BACK TO  NAVIGATION CONTAINER -->
          <%@include file="Navigator.jsp" %>
    <!-- END OF THE BACK TO  NAVIGATION CONTAINER -->

	<!-- MAIN CONTAINER -->
	<div class="container">

		<!-- PROJECT UPLOAD CONTAINER -->
		<div class="project-upload-container shadow-lg bg-white">
			<div class="title mb-3 mt-3 pb-3">
				<h1 class="text-center text-uppercase">Upload Project</h1>
			</div>

			<!-- PROJECT UPLOAD FORM -->
			<form action="user/upload/project" method="post" enctype="multipart/form-data">

				<div class="form-row">
					<select  class="custom-select col-12" name="categoryId" required>
						<option value="" selected disabled hidden>Choose Project Category
						</option>
						
						 <c:forEach var="category" items="${pc}">
						    <option value="${category.getId()}" title="${category.getDescription()}">
						     ${category.getName()}</option>
						 </c:forEach>
					</select>
				</div>

				<br>

				<div class="form-group form-row">
					<label for="name" class="col-3">Project Name </label> <input
						type="text" class="form-control col-9"
						placeholder="Enter Project Name" name="projectName" id="name" required>
				</div>

				<div class="form-group form-row">
					<label for="short_desc" class="col-3">Short Desc</label> <input
						type="text" class="form-control col-9"
						placeholder="Enter Short Description" name="shortDesc"
						id="short_desc" required>
				</div>

				<div class="form-group form-row">
					<label for="external_link" class="col-3">Social Links</label> <input
						type="url" class="form-control col-9"
						placeholder="Enter or Paste Social Media Link"
						name="external_link" id="external_link">
				</div>

				<div class="form-group  form-row">
					<label for="imgFiles" class="col-3">Images</label> 
					<input type="file" class="images-file col-9" placeholder="Choose file" 
					    name="images" accept="image/*" id="imgFiles" multiple="multiple" required>
				</div>

				<div class="form-group form-row">
					<label for="videoFile" class="col-3">Video</label> 
					   <input type="file" id="videoFile" class="images-file col-9" placeholder="Select video" accept="video/*" name="videofile">
				</div>

				<br>

				<div class="form-group form-row">
					<label for="description" class="text-center col-12">Description</label>
					<textarea class="form-control" rows="12" name="description"
						id="description"></textarea>
				</div>

				<div class="text-center mt-5">
					<button type="submit" class="btn btn-primary button">Upload</button>
				</div>
			</form>
			<!-- END OF THE PROJECT UPLOAD FORM -->

		</div>
		<!-- END OF THE PROJECT UPLOAD CONTAINER -->

	</div>
	<!-- END OF THE MAIN CONTAINER -->



<%@include file="Footer.jsp" %>
</body>
</html>