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
            <c:redirect url="addRoles.jsp" >
                <c:param name="errMsg" value="El nombre del rol no puede quedar vacio" />
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
            select * from rol where rol = ?
            <sql:param value="${param.txtNombre}"/>
        </sql:query>
            <c:if test="${cnt.rowCount > 0}">
                <c:redirect url="addRoles.jsp" >
                <c:param name="errMsg" value="El rol ya esta registrado" />
            </c:redirect>
            </c:if>
            
            <sql:transaction dataSource="${dbsource}">
                <sql:update  var="result">
                    call insertar_rol (?,?);
                    <sql:param value="${param.txtNombre}" />
                    <sql:param value="${param.txtDescripcion}" />
                </sql:update>
                <c:redirect url="addRoles.jsp" >
                    <c:param name="susMsg" value="El rol se ha insertado correctamente" />
                </c:redirect>
            </sql:transaction>
            
            
            
        
 
            
 
 
    </body>
</html>
