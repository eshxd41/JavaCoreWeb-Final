<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Identities available in IAM System</title>

<style>
tr:first-child {
	font-weight: bold;
	background-color: #C6C9C4;
}
</style>

</head>


<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Welcome to the IAM System</h1>
			<p>
				<a href="<c:url value='/' />">Disconnect</a>
			</p>
		</div>
		<h4 align="center" style="color:#33A2FF">Below are the details of the identity ${identity.displayName}</h4>
		<div class="row" class="table-responsive">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-hover">
					<tr>
						<td>UID</td>
						<td>NAME</td>
						<td>Birth Date</td>
						<td>Mail ID</td>
						<td>Password</td>
						<td>Edit Identity</td>
						<td>Delete</td>
						<td></td>
					</tr>
					<tr>
						<td>${identity.id}</td>
						<td>${identity.displayName}</td>
						<td>${identity.birthDate}</td>
						<td>${identity.email}</td>
						<td>${identity.password}</td>
						<td><a
							href="<c:url value='/edit-${identity.displayName}-identity' />">${identity.displayName}</a></td>
						<td><a
							href="<c:url value='/delete-${identity.displayName}-identity' />">delete</a></td>
					</tr>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<br />
</body>
</body>
</html>