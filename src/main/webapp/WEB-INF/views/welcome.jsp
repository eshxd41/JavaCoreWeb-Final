<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .form-container {
  position:fixed;
  width:50%;
  margin-left: 20px;
  margin-top: 20px;
  margin-bottom: 20px;
  padding: 20px;
  background-color: #E8E1E1;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.floatRight{
	float:right;
	margin-right: 18px;
}

.has-error{
	color:red;
}


.success{
  position:fixed;
  width:50%;
  margin-left: 50px;
  margin-top:20px;
  padding: 20px;
  background-color: #E8E1E1;
  border: 1px solid #ddd;
  border-radius: 4px;
}
  </style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Confirmation Page</title>
</head>

<body>
<div class="container">
  <div class="jumbotron">
    <h1>Welcome to the IAM System</h1> 
    <p><a href="<c:url value='/' />">Disconnect</a></p>     
  </div>     
     <h4 style="color:green">${welcome}</h4>
    <br/>
    <br/>
    <div class="row">
    	<div class="col-md-6">
    		<h3>Identity Creation</h3>
			<p>Thanks to this action, you can create a brand new Identity, you can click on the button below to begin</p>
			 <br/>
			 <b>Note:</b><p>After successful creation of identity you will disconnected and you need to login again.</p>
			 <br/>
			<a href="<c:url value='/new' />" class="btn btn-default btn-md">Create</a>
    	</div>
    	<div class="col-md-6">
    		<h3>Identity Search</h3>
			<p>Thanks to this action, you can search an identity and then access to its information. Through this action, you can also modify or delete the wished identity</p>
			<br/><b>We can search identity by name by clicking on below Search button.</b>
			<br/><br/>
			<a href="#search" class="btn btn-default btn-md" data-toggle="collapse">Search</a>
    	</div>
    </div>
    
  <div id="search" class="collapse">
  <br/><br/>
     <form:form method="POST" action="search" modelAttribute="login" class="form-horizontal">
 
        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="username">Enter Identity Name:</label>
                <div class="col-md-7">
                    <form:input type="text" path="username" id="username" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="username" cssClass="error" class="help-inline"/>
                    </div>
                </div>
            </div>
        
            <div class="form-actions form-group col-md-2">
                <input type="submit" value="Search" class="btn btn-primary btn-md">
            </div>
        </div>
        <br/>
        <br/>
        <br/>
    </form:form>
    </div>
    </div>
     
</body>
 
</html>