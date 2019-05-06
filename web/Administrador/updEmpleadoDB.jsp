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
            <c:redirect url="updEmpleado.jsp" >
                <c:param name="errMsg" value="El nombre del empleado no puede quedar vacio" />
            </c:redirect>
 
        </c:if>
        <c:if test="${empty param.txtApellido}">
            <c:redirect url="updEmpleado.jsp" >
                <c:param name="errMsg" value="El apellido no puede quedar vacio" />
            </c:redirect>
 
        </c:if>
        <c:if test="${empty param.txtEmail}">
            <c:redirect url="updEmpleado.jsp" >
                <c:param name="errMsg" value="El email no puede quedar vacio" />
            </c:redirect>
        </c:if>
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        
        <sql:query dataSource="${dbsource}" var="cnt">
            select * from empleado where email = '${param.txtEmail}' and id != ${param.txtId}
        </sql:query>
            <c:if test="${cnt.rowCount > 0}">
                <c:redirect url="updEmpleado.jsp" >
                    <c:param name="errMsg" value="El email ya esta registrado" />
                </c:redirect>
            </c:if>
            
        <sql:update dataSource="${dbsource}" var="count">
            call actualizar_empleado(?,?,?,?,?,?)
            <sql:param value="${param.txtId}" />
            <sql:param value="${param.txtNombre}" />
            <sql:param value="${param.txtApellido}" />
            <sql:param value="${param.txtEmail}" />
            <sql:param value="${param.rol}" />
            <sql:param value="${param.depto}" />
        </sql:update>
            
        <c:redirect url="empleados.jsp" >
            <c:param name="susMsg" value="El empleado se modifico exitosamente" />
        </c:redirect>
 
 
    </body>
</html>
