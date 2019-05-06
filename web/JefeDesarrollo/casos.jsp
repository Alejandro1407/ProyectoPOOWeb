 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Datos.Conexion"%>
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
         
          String idEmpleado = getCookie("idEmpleado", cookies);
         String NombreUser = getCookie("NombreUser", cookies);
         int idDepartamento = Integer.parseInt(getCookie("idDepartamento", cookies));
         String NombreDepartamento = getCookie("NombreDepartamento", cookies); 
         ResultSet Data;
         Connection conn = Conexion.Conectarse();
            if(conn == null){
               throw new Exception("No se pudo Conectar");
            }
            CallableStatement proc = conn.prepareCall("{call mostrar_casos (?)}");
            proc.setInt(1, 3);
            Data = proc.executeQuery();        
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
        <a href="index.jsp" class="list-group-item list-group-item-action  waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
        <a href="solicitudes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-file-alt mr-3"></i>Solicitudes</a>
        <a href="casos.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Casos</a>
          <a href="cambiar.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-lock mr-3"></i>Cambiar Contraseña</a>
           <a href="../Servicios/cerrarsesion.jsp" class="list-group-item red-text list-group-item-action waves-effect">
          <i class="fas fa-sign-out-alt mr-3"></i>Cerrar Sesion</a>
      </div>

    </div>
    <!-- Sidebar -->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
       
 
    
        <center> <h1> Lista de solicitudes</h1> </center>
        <% if(!Data.next()){
            out.print("<p class='alert alert-danger'>No hay casos para mostrar</p>");
        }
        Data.beforeFirst();
        %>
            <table class="table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre del caso</th>
                    <th>Codigo de caso</th>
                    <th>Descripcion</th>
                    <th>Fecha Final</th>
                    <th>Descripcion elementos</th>
                    <th>ID Encargado</th>
                    <th>Nombre del encargado</th>
                    <th>ID Tester</th>
                    <th>Nombre Tester</th>
                    <th>Nombre</th>
                </tr>
                </thead>
                <%
                while (Data.next()) {
                %>
                <tr>
 <td><%=Data.getString(1)%></td>
 <td><%=Data.getString(2)%></td>
 <td><%=Data.getString(3)%></td>
 <td><%=Data.getString(4)%></td>
 <td><%=Data.getString(5)%></td>
 <td><%=Data.getString(6)%></td>
 <td><%=Data.getString(7)%></td>
 <td><%=Data.getString(8)%></td>
 <td><%=Data.getString(9)%></td>
 <td><%=Data.getString(10)%></td>
 <td><%=Data.getString(11)%></td>
 </tr>
  <%
 }
 %>
            </table>
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

