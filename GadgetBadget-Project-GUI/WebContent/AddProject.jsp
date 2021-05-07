<%@page import="com.project.model.ProjectServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/Project.js"></script>

<style type="text/css">
html {
	position: relative;
	min-height: 100%;
}

body {
	padding-top: 4.5rem;
	margin-bottom: 4.5rem;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 3.5rem;
	line-height: 3.5rem;
	background-color: #ccc;
}

.nav-link:hover {
	transition: all 0.4s;
}

.nav-link-collapse:after {
	float: right;
	content: '\f067';
	font-family: 'FontAwesome';
}

.nav-link-show:after {
	float: right;
	content: '\f068';
	font-family: 'FontAwesome';
}

.nav-item ul.nav-second-level {
	padding-left: 0;
}

.nav-item ul.nav-second-level>.nav-item {
	padding-left: 20px;
}

@media ( min-width : 992px) {
	.sidenav {
		position: absolute;
		top: 0;
		left: 0; width : 230px;
		height: calc(100vh - 3.5rem);
		margin-top: 3.5rem;
		background: #343a40;
		box-sizing: border-box;
		border-top: 1px solid rgba(0, 0, 0, 0.3);
		width: 230px;
	}
	.navbar-expand-lg .sidenav {
		flex-direction: column;
	}
	.content-wrapper {
		margin-left: 230px;
	}
	.footer {
		width: calc(100% - 230px);
		margin-left: 230px;
	}
}
</style>

</head>
<body>

	<!-- Navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">GadgetBadget</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto sidenav" id="navAccordion">
				<li class="nav-item ml-3"><a class="nav-link"
					href="AdminPanel.jsp">Home </a></li>
				<!-- 				<li class="nav-item"><a class="nav-link" href="#">Item 1</a></li> -->

				<li class="nav-item active ml-3"><a
					class="nav-link nav-link-collapse" href="#" id="hasSubItems"
					data-toggle="collapse" data-target="#collapseSubItems3"
					aria-controls="collapseSubItems3" aria-expanded="false">Project
						Details<span class="sr-only">(current)</span>
				</a>
					<ul class="nav-second-level collapse" id="collapseSubItems3"
						data-parent="#navAccordion">
						<li style="list-style-type: none;" class="nav-item"><a
							class="nav-link" href="AddProject.jsp"> <span
								class="nav-link-text">Add Project</span>
						</a></li>
					</ul></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#">UserDetails</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#">Order
						Details</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#">Funder
						Details</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#">Product
						Details</a></li>
			</ul>
		</div>
	</nav>

	<main class="content-wrapper">
		<div class="container-fluid">
			<section class="mt-2">
				<div class="pl-5 pr-5">
					<h2 class="mb-3">Add Project Details</h2>
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
							<button class="btn btn-info" id="clear" type="button">clear</button>

							<input type="hidden" id="projectID" name="projectID" value="">
						</div>
					</form>


				</div>
			</section>
		</div>

		<div class="container">
			<h2 class="mb-5">All Project Details</h2>
		</div>
		<div class="container col-12 mb-5" id="ProjectGrid">
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

	<footer class="footer bg-dark mt-5">
		<div class="container">
			<div class="text-center text-light">
				<span>Create by , <span style="color: #87CEEB;">PAF
						Team</span> 2021
				</span>
			</div>
		</div>
	</footer>


	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('.nav-link-collapse').on('click', function() {
				$('.nav-link-collapse').not(this).removeClass('nav-link-show');
				$(this).toggleClass('nav-link-show');
			});

		});
	</script>

</body>
</html>