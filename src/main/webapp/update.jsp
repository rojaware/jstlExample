<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 
        <sql:query dataSource="jdbc/mydatabase" var="result">
            SELECT * from task_list where task_id=?;
            <sql:param value="${param.task_id}" />
        </sql:query>
        <form action="updatedb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update Task</caption>
                <tr>
                    <th> Name</th>
                    <th>Description</th>
                    <th>Priority</th>
                    <th></th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.task_id}" name="task_id"/>
                            <input type="text" value="${row.task_name}" name="task_name"/></td>
                        <td><input type="text" value="${row.task_description}" name="task_description"/></td>
                        <td>
                        <select	name="task_priority">
							<option value="HIGH">HIGH</option>
							<option value="MEDIUM">MEDIUM</option>
							<option value="LOW">LOW</option>
						</select> </td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="index.jsp">Go Home</a>
        </form>
    </body>
</html>