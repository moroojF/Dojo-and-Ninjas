<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Show Dojo's Ninjas</title>
</head>
<body>
	<div class="container">
		<h1>${ dojo.name } Ninjas</h1>
			<table class="table table-bordered mt-5">
    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ninjas}" var="n">
        <tr>
            <td><c:out value="${n.firstName}"/></td>
            <td><c:out value="${n.lastName}"/></td>
            <td><c:out value="${n.age}"/></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
	</div>
</body>
</html>
