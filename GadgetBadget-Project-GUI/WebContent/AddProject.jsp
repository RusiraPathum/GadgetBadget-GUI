<%@page import="com.project.model.ProjectServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>

<link href="myStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/Project.js"></script>

</head>
<body>

	<main class="content-wrapper">
		<div class="container-fluid">
			<section class="mt-3">
				<div class="container">
					<h2 class="mb-5">Add Project Details</h2>
					<form class="row g-3 needs-validation" id="PROJECT" name="formItem"
						novalidate>
						<input hidden type="text" class="form-control" id="projectID"
							name="projectID">
						<div class="col-md-12 mb-3">
							<label for="validationCustom03" class="form-label">Select
								Project Category</label> <select class="form-select form-control"
								id="project_category" name="project_category"
								aria-label="Default select example">
								<option selected>Select Project Category</option>
								<option value="Art">Art</option>
								<option value="Technology">Technology</option>
								<option value="Design">Design And Tech</option>
								<option value="Game">Game</option>
								<option value="Music">Music</option>
								<option value="Food">Food</option>
								<option value="Films">Films</option>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustom01" class="form-label">Project
								Name</label> <input type="text" class="form-control" id="project_name"
								name="project_name" placeholder="Project Name">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustom02" class="form-label">Short
								Description</label> <input type="text" class="form-control"
								id="short_des" name="short_des" placeholder="Short Description">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustomUsername" class="form-label">Price</label>
							<input type="number" class="form-control" id="price" name="price"
								aria-describedby="inputGroupPrepend">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustomUsername" class="form-label">Date</label>
							<input type="date" class="form-control" id="date" name="date"
								aria-describedby="inputGroupPrepend">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustom03" class="form-label">Project
								Goal</label> <input type="text" class="form-control" id="project_goal"
								name="project_goal" placeholder="Project Goal">
						</div>
						<div class="col-md-6">
							<label for="validationCustom05" class="form-label">Long
								Description</label>
							<textarea id="long_des" name="long_des"
								class="md-textarea form-control" rows="5"
								placeholder="Long Description"></textarea>
						</div>

						<div class="mt-3 ml-3">
							<div id="alertSuccess" class="alert alert-success"></div>
							<div id="alertError" class="alert alert-danger"></div>
						</div>


						<div class="col-12 mt-3 mb-5 d-flex justify-content-end">
							<button class="btn btn-primary mr-3" id="save_project"
								type="button">Save Project</button>
							<button class="btn btn-info" id="clear"
								type="button">clear</button>

							<input type="hidden" id="projectID" name="projectID" value="">
						</div>
					</form>


				</div>
			</section>
		</div>

		<div class="container">
			<h2 class="mb-5">All Project Details</h2>
		</div>
		<div class="container col-12" id="ProjectGrid">
			<fieldset>
				<form method="post" action="AddProject.jsp"
					class="table table-striped">
					<%
					ProjectServlet viewProject = new ProjectServlet();
					out.print(viewProject.readProjects());
					%>
				</form>
				<br>
			</fieldset>
		</div>

	</main>


</body>
</html>