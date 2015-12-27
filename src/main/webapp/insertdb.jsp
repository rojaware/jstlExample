<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>INSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.task_name or empty param.task_description}">
            <c:redirect url="entry.jsp" >
                <c:param name="errMsg" value="Please Enter name and description" />
            </c:redirect>
 
        </c:if>
 
        <sql:update dataSource="jdbc/mydatabase" var="result">
            INSERT INTO task_list (task_name, task_description, task_priority, task_status) VALUES (?,?,?, 'ACTIVE');
            <sql:param value="${param.task_name}" />
            <sql:param value="${param.task_description}" />
            <sql:param value="${param.task_priority}" />
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="entry.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>