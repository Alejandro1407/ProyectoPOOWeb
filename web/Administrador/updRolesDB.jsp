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
        <c:if test="${ empty param.txtRol}">
            <c:redirect url="addRoles.jsp" >
                <c:param name="errMsg" value="El rol no puede quedar vacio" />
            </c:redirect>
 
        </c:if>
        <c:if test="${empty param.txtDescripcion}">
            <c:redirect url="addRoles.jsp" >
                <c:param name="errMsg" value="La descripcion no puede quedar vacia" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="cnt">
            select * from rol where rol = ? and id != ?
            <sql:param value="${param.txtRol}"/>
            <sql:param value="${param.txtId}"/>
        </sql:query>
            <c:if test="${cnt.rowCount >= 1}">
                <c:redirect url="updRoles.jsp" >
                    <c:param name="errMsg" value="El departamento ya existe" />
                </c:redirect>
            </c:if>
        <sql:update dataSource="${dbsource}" var="count">
            call actualizar_rol(?,?,?)
            <sql:param value="${param.txtId}" />
            <sql:param value="${param.txtRol}" />
            <sql:param value="${param.txtDescripcion}" />
        </sql:update>
        
        <c:redirect url="roles.jsp" >
            <c:param name="susMsg" value="El rol se modifico exitosamente" />
        </c:redirect>
 
 
    </body>
</html>
