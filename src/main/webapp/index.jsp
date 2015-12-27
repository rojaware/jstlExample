<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>SELECT Operation</title>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
</script>
</head>
<body>
	<sql:query dataSource="jdbc/mydatabase" var="result">
       SELECT TASK_ID, TASK_NAME, TASK_DESCRIPTION, TASK_STATUS, TASK_PRIORITY FROM TASK_LIST;
    </sql:query>
	<b>Tasks selected:</b>

	<c:forEach var="aTask" items="${paramValues.taskId}">
		<c:out value="${aTask}" />
	</c:forEach>
	<br />
	<form name="input" action="entry.jsp" method="get">
		<input type="submit" value="New Task">
	</form>

	<form name="input" action="index.jsp" method="get" >	
        <div class="btn-group btn-group-justified">
			<a href="entry.jsp" class="btn btn-primary">New</a> 
		</div>
		<input type="submit" class="btn btn-default" value="Submit">

		<table border="1" width="100%">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>DESCRIPTION</th>
				<th>STATUS</th>
				<th>PRIORITY</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.task_id}" /></td>
					<td><c:out value="${row.task_name}" /></td>
					<td><c:out value="${row.task_description}" /></td>
					<td><c:out value="${row.task_status}" /></td>
					<td><c:out value="${row.task_priority}" /></td>
					<td><input TYPE=checkbox name=taskId VALUE="${row.task_id}"></td>
					
					<td><a href="update.jsp?task_id=<c:out value="${row.task_id}"/>" class="glyphicon glyphicon-edit"></a></td>
		            <td><a href="javascript:confirmGo('Sure to delete this record?','deletedb.jsp?task_id=<c:out value="${row.task_id}"/>')" class="glyphicon glyphicon-trash"></a></td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>