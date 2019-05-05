<%-- 
    Document   : deletedb
    Created on : 04-may-2019, 9:12:55
    Author     : Denys
--%>

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
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sistemapoo"
                           user="root"  password=""/>
        <sql:update dataSource="${dbsource}" var="count">
            call cancelar_soli(?)
           <sql:param value="${param.id}"/>
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'>Solicitud eliminada de manera exitosa</font>
              <a href="index.jsp">Go Home</a>          
        </c:if>
               <c:redirect url="solicitudes.jsp" >
                <c:param name="susMsg" value="Solicitud eliminada de manera exitosa" />
            </c:redirect>
    </body>
</html>