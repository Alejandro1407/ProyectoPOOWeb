
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
        <c:if test="${ empty param.pname or empty param.qty}">
            <c:redirect url="casos.jsp" >
                <c:param name="errMsg" value="Por favor llene correctamente los campos" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
 
        <sql:update dataSource="${dbsource}" var="result">
           call realizar_solicitud(?,?,?)
            <sql:param value="${param.pname}" />
            <sql:param value="${param.qty}" />
            <sql:param value="${param.id}"/>
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'>Solicitud de caso ingresada de manera exitosa</font>
        </c:if> 
                        <c:redirect url="casos.jsp" >
                <c:param name="susMsg" value="Solicitud de caso ingresada de manera exitosa" />
            </c:redirect>
 
 
    </body>
</html>
