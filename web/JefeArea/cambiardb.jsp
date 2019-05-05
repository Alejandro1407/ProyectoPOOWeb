
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
        <c:if test="${ empty param.p1 or empty param.p2}">
            <c:redirect url="cambiar.jsp" >
                <c:param name="errMsg" value="Por favor rellenar ambos campos" />
            </c:redirect>
 
        </c:if>
           <c:if test="${  param.p1 != param.p2}">
            <c:redirect url="cambiar.jsp" >
                <c:param name="errMsg" value="No existe coincidencia de contraseñas, asegurese de escribirlas de igual manera" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/sistemapoo"
                           user="root"  password=""/>
 
 
        <sql:update dataSource="${dbsource}" var="result">
           call actualizar_contrasenia (?,?)
            <sql:param value="${param.id}" />
            <sql:param value="${param.p1}"/>
        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'>Contraseña reestablecida de manera exitosa</font>
        </c:if> 
                        <c:redirect url="cambiar.jsp" >
                <c:param name="susMsg" value="Contraseña reestablecida de manera exitosa" />
            </c:redirect>
 
 
    </body>
</html>
