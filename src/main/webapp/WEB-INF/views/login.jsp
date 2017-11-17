<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.error {
	color: #ff0000;
}

body {
	padding-top: 90px;
	background: beige;
}

.panel-heading {
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
}

.panel-login {
	padding: 10px;
	-webkit-box-shadow: 0px 1px 10px 0px rgba(0, 0, 0, 0.2);
}
</style>
<title>Login</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<script>
	$(document).ready(function() {
		window.history.forward(-1);
	});
</script>
<body style="background: #f5f5dc">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-login">
					<div class="panel text-center panel-heading">
						<c:choose>
							<c:when test="${register}">
								<font color="green">${success}</font>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<font color="#33A2FF">IAM System Login</font>
					</div>
					<div>
						<form:form method="post" modelAttribute="login" class="form-group">
							<div class="row" align="center">
								<c:choose>
									<c:when test="${error}">
										<p>
											<font color="red">Username or Password are wrong.
												Please try again</font>
										</p>
									</c:when>
									<c:otherwise>
										<p />
									</c:otherwise>
								</c:choose>
							</div>
							<div class="form-group">
								<form:input type="text" path="username" id="username/"
									class="form-control" placeholder="User Name" />
								<div class="has-error">
									<form:errors path="username" cssClass="error"
										class="help-inline" />
								</div>
							</div>
							<div class="form-group">
								<form:input type="password" path="password" id="password"
									class="form-control" placeholder="Your Password" />
								<div class="has-error">
									<form:errors path="password" cssClass="error"
										class="help-inline" />
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-6">
										<!-- <button class="btn btn-primary">Login</button> -->
										<input type="submit" value="Login" class="btn btn-primary">
									</div>
									<div class="col-xs-6">
										<a href="<c:url value='/new' />" class="pull-right">Register
											Now!</a>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>