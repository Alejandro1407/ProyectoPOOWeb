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
        <title>Update Operation</title>
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
            select * from departamento where nombre = ? and id != ?
            <sql:param value="${param.txtNombre}"/>
            <sql:param value="${param.txtId}"/>
        </sql:query>
            <c:if test="${cnt.rowCount >= 1}">
                <c:redirect url="updDepartamento.jsp" >
                    <c:param name="errMsg" value="El departamento ya existe" />
                </c:redirect>
            </c:if>
        <sql:update dataSource="${dbsource}" var="count">
            call actualizar_departamento(?,?,?)
            <sql:param value="${param.txtId}" />
            <sql:param value="${param.txtNombre}" />
            <sql:param value="${param.txtDescripcion}" />
        </sql:update>
        
        <c:redirect url="departamentos.jsp" >
            <c:param name="susMsg" value="El departamento se modifico exitosamente" />
        </c:redirect>
 
 
    </body>
</html>
