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
        <c:if test="${ empty param.txtNombre}">
            <c:redirect url="addDepartamento.jsp" >
                <c:param name="errMsg" value="El nombre del departamento no puede quedar vacio" />
            </c:redirect>
 
        </c:if>
        <c:if test="${empty param.txtDescripcion}">
            <c:redirect url="addDepartamento.jsp" >
                <c:param name="errMsg" value="La descripcion no puede quedar vacia" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="cnt">
            select * from departamento where nombre = ?
            <sql:param value="${param.txtNombre}"/>
        </sql:query>
            <c:if test="${cnt.rowCount >= 1}">
                <c:redirect url="addDepartamento.jsp" >
                    <c:param name="errMsg" value="El departamento ya existe" />
                </c:redirect>
            </c:if>
        <sql:update dataSource="${dbsource}" var="result">
            call insertar_departamento (?,?);
            <sql:param value="${param.txtNombre}" />
            <sql:param value="${param.txtDescripcion}" />
        </sql:update>
        <c:if test="${not empty result}">
            <font size="5" color='green'> 
                <c:out value="${result}"/> 
            </font>
 
            <c:redirect url="addDepartamento.jsp" >
                <c:param name="susMsg" value="El departamento se ingreso exitosamente" />
            </c:redirect>
        </c:if>
 
 
    </body>
</html>
