<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<!-- <form action="process.jsp" method="post"> -->
	<form action="insertdb.jsp" method="post">
		Task Name:<input type="text" name="task_name" /><br />
	    Description:<input type="text" name="task_description" /><br />
		 <select
			name="task_priority">
			<option value="HIGH">HIGH</option>
			<option value="MEDIUM">MEDIUM</option>
			<option value="LOW">LOW</option>
		</select> 
		<input type="submit" value="submit" />

	</form>
	<font color="red"><c:if test="${not empty param.errMsg}">
			<c:out value="${param.errMsg}" />
			<a href="index.jsp">Go Back</a>
		</c:if></font>
	<font color="green"><c:if test="${not empty param.susMsg}">
			<c:out value="${param.susMsg}" /><BR>
			<a href="index.jsp">Go Back</a>
		</c:if></font>

</body>
</html>