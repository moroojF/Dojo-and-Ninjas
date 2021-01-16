<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Create Ninja</title>
</head>
<body>
<div class="container">
		<h2>New Ninja</h2>
		<form:form action="/ninjas" method="POST" modelAttribute="ninja">
			<div class="form-group">
		        <form:label path="dojo">Dojo</form:label>
		        <form:errors path="dojo"/>
		        <form:select class="form-control" path="dojo">
		        <c:forEach items="${ dojos }" var="doj">
		        	<option value="${ doj.id }">${ doj.name }</option>
		        </c:forEach>
		        </form:select>
		    </div>
			<div class="form-group">
		        <form:label path="firstName">First Name</form:label>
		        <form:errors path="firstName"/>
		        <form:input class="form-control" path="firstName"/>
		    </div>
		    <div class="form-group">
		        <form:label path="lastName">Last Name</form:label>
		        <form:errors path="lastName"/>
		        <form:input class="form-control" path="lastName"/>
		    </div>
		    <div class="form-group">
		        <form:label path="age">Age</form:label>
		        <form:errors path="age"/>
		        <form:input type="number" class="form-control" path="age"/>
		    </div>
		    <button>Add Ninja</button>
		</form:form>
	</div>
</body>
</html>