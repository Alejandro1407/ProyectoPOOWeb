 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Datos.Conexion"%>
<<<<<<< HEAD
<%!
    public String getCookie(String cookieName, Cookie[] cookies){
        for(int i = 0;i < cookies.length;i++){
            Cookie cookie = cookies[i];
                if(cookie.getName().equals(cookieName)){
                    return cookie.getValue();
                }
        }
        return "Null";
    }
%>
=======
>>>>>>> ea1914a8eddf62562fd64f7b57546fa3339f9a34
<%
     //Para evitar el acceso no authorizado
     
     HttpSession sesion = request.getSession();
     
     if(sesion.getAttribute("JefeArea") == null){
         response.sendRedirect("../index.jsp?Error=Debe iniciar sesion");
         return;
     }
     //Codigo para obtener las cookies
         Cookie[] cookies = null;
        
         cookies = request.getCookies();
         
<<<<<<< HEAD
         String idEmpleado = getCookie("idEmpleado", cookies);
         String NombreUser = getCookie("NombreUser", cookies);
         int idDepartamento = Integer.parseInt(getCookie("idDepartamento", cookies));
         String NombreDepartamento = getCookie("NombreDepartamento", cookies);
         ResultSet Data;
         Connection conn = Conexion.Conectarse();
            if(conn == null){
               out.print("No se pudo Conectar");
            }
            CallableStatement proc = conn.prepareCall("{call mostrar_solicitudes (?)}");
            proc.setInt(1, idDepartamento);
           Data = proc.executeQuery();
            if(!Data.next()){
                String msg = "No hay solicitudes registradas";
           }
            Data.beforeFirst();
=======
         String idEmpleado = (String) cookies[1].getValue();
         String NombreUser = (String) cookies[2].getValue();
         int idDepartamento = Integer.parseInt(cookies[3].getValue());
         String NombreDepartamento = (String) cookies[4].getValue();  
         ResultSet Data;
         Connection conn = Conexion.Conectarse();
            if(conn == null){
               throw new Exception("No se pudo Conectar");
            }
            CallableStatement proc = conn.prepareCall("{call mostrar_solicitudes (?)}");
            proc.setInt(1, idDepartamento);
            Data = proc.executeQuery();
            if(!Data.next()){
                String msg = "No hay solicitudes registradas";
                return;
           }
            
>>>>>>> ea1914a8eddf62562fd64f7b57546fa3339f9a34
         
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/mdb.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <style>
            .map-container{
                overflow:hidden;
                padding-bottom:56.25%;
                position:relative;
                height:0;
            }
            .map-container iframe{
                left:0;
                top:0;
                height:100%;
                width:100%;
                position:absolute;
            }
            </style>
    </head>
  <body class="grey lighten-3">
    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

      <a class="logo-wrapper waves-effect">
        <img src="https://mdbootstrap.com/img/logo/mdb-email.png" class="img-fluid" alt="">
      </a>
      <div class="list-group list-group-flush">
        <a href="index.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
        <a href="solicitudes.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-file-alt mr-3"></i>Mostrar Solicitudes</a>
        <a href="casos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Crear solicitud</a>
           <a href="mostrarcasos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Mostrar Casos</a>
        <a href="reportes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-line mr-3"></i>Reportes</a>
          <a href="cambiar.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-lock mr-3"></i>Cambiar Contraseña</a>
           <a href="../Servicios/cerrarsesion.jsp" class="list-group-item red-text list-group-item-action waves-effect">
          <i class="fas fa-sign-out-alt mr-3"></i>Cerrar Sesion</a>
      </div>

    </div>
    <!-- Sidebar -->
<script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
<<<<<<< HEAD
                           url="jdbc:mysql://localhost/SistemaPOO"
=======
                           url="jdbc:mysql://localhost/sistemapoo"
>>>>>>> ea1914a8eddf62562fd64f7b57546fa3339f9a34
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            call mostrar_solicitudes(?)
            <sql:param value="<%=idDepartamento%>" />
        </sql:query>
            <center> <h1> Lista de solicitudes</h1>
<<<<<<< HEAD
                  <c:if test="${result.rowCount == 0 }">
                        <p class="alert alert-danger">No hay solicitudes</p>
                  </c:if>
=======
>>>>>>> ea1914a8eddf62562fd64f7b57546fa3339f9a34
            <table class="table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Opcion</th>
                </tr>
                </thead>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.nombre}"/></td>
                        <td><c:out value="${row.descripcion}"/></td>
<<<<<<< HEAD
                  <td><a class="btn btn-danger" href="javascript:confirmGo('Esta seguro de querer eliminar la solicitud?','deletedb.jsp?id=<c:out value="${row.id}"/>')">Cancelar Solicitud</a></td>
=======
                  <td><a href="javascript:confirmGo('Esta seguro de querer eliminar la solicitud?','deletedb.jsp?id=<c:out value="${row.id}"/>')">Cancelar Solicitud</a></td>
>>>>>>> ea1914a8eddf62562fd64f7b57546fa3339f9a34
 
                    </tr>
                </c:forEach>
            </table>
     
      
    </center>
    </div>
  </main>
  <!--Main layout-->

                    <!-- SCRIPTS -->
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/popper.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/mdb.js"></script>
        <script type="text/javascript">
              new WOW().init();
        </script>
    </body>
</html>

