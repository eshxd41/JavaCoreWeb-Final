<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Confirmation Page</title>
</head>
<body>
    <h4><font color="green">${success}</font></h4>
    <br/>
    Click here to login <a href="<c:url value='/' />">Login.</a>
     
</body>
 
</html>