<%-- 
    Document   : newjspinsertdb
    Created on : 04-may-2019, 9:10:48
    Author     : Denys
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Operation</title>
    </head>
    <body>
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        
        <sql:update dataSource="${dbsource}" var="result">
            call eliminar_rol (?);
            <sql:param value="${param.id}" />
        </sql:update>
        <sql:query dataSource="${dbsource}" var="cnt">
            SELECT * FROM rol e WHERE id = ?
            <sql:param value="${param.id}"/>
        </sql:query>
        <c:if test="${cnt.rowCount == 0}">
            <font size="5" color='green'> 
                <c:out value="${result}"/> 
            </font>
 
            <c:redirect url="roles.jsp" >
                <c:param name="susMsg" value="El departamento se elimino exitosamente" />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>
