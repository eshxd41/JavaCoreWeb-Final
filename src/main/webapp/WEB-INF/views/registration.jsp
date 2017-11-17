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
<body style="background:#f5f5dc">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-login">
				<c:choose>
					<c:when test="${edit}">
					<div class="panel text-center panel-heading">Identity Modification</div>
					</c:when>
					<c:otherwise>
					<div class="panel text-center panel-heading">New Identity Creation</div>
					</c:otherwise>
				</c:choose>
					<div>
						<form:form method="post" modelAttribute="identity"
							class="form-group">
							<form:input type="hidden" path="id" id="id" />
							<div class="form-group">
								<form:input type="text" path="displayName" id="displayName"
									class="form-control" placeholder="Display Name" />
								<div class="has-error">
									<form:errors path="displayName" cssClass="error"
										class="help-inline" />
								</div>
							</div>
					<c:choose>
					<c:when test="${edit}">
							<div class="form-group">
								<form:input type="password" path="password" id="password"
									class="form-control" placeholder="Your Password" readonly="true" />
								<div class="has-error">
									<form:errors path="password" cssClass="error"
										class="help-inline" />
								</div>
							</div><p><span class="glyphicon glyphicon-info-sign">You cannot update password.</span></p>
							</c:when>
							<c:otherwise>
							<div class="form-group">
								<form:input type="password" path="password" id="password"
									class="form-control" placeholder="Your Password" />
								<div class="has-error">
									<form:errors path="password" cssClass="error"
										class="help-inline" />
								</div>
							</div>
							</c:otherwise>
							</c:choose>
							<div class="form-group">
								<form:input type="text" path="birthDate" id="birthDate"
									class="form-control" placeholder="Birth Date" />
								<div class="has-error">
									<form:errors path="birthDate" cssClass="error"
										class="help-inline" />
								</div>
							</div>
							<div class="form-group">
								<form:input type="text" path="email" id="email"
									class="form-control" placeholder="Email" />
								<div class="has-error">
									<form:errors path="email" cssClass="error" class="help-inline" />
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-xs-6">
										<c:choose>
											<c:when test="${edit}">
												<input type="submit" value="Update" class="btn btn-primary">
											</c:when>
											<c:otherwise>
												<input type="submit" value="Register"
													class="btn btn-primary">
													<a href="<c:url value='/' />" class="btn btn-default">Cancel</a>
											</c:otherwise>
										</c:choose>
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