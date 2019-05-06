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
     
     if(sesion.getAttribute("Administrador") == null){
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
            CallableStatement proc = conn.prepareCall("{call reporte_todo (?)}");
            proc.setInt(1, idDepartamento);
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
        <a href="index.jsp" class="list-group-item  waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
        <a href="solicitudes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-file-alt mr-3"></i>Mostrar Solicitudes</a>
        <a href="casos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Crear solicitud</a>
           <a href="mostrarcasos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Mostrar Casos</a>
        <a href="reportes.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-chart-line mr-3"></i>Reportes</a>
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
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            call reporte_dep(?)
            <sql:param value="<%=idDepartamento%>" />
        </sql:query>
            <center> <h1> Reportes</h1>
            <div class="container-fluid">
                <div class="row wow fadeInUp">  
                <c:forEach var="row" items="${result.rows}">
                     <div class="col-lg-6 text-white  col-md-6 mb-4">
                        <div class="card bg-primary">
                           <div class="card-header">Casos</div>
                                      <div class="card-body">
                                        <h5 class="card-title">Totales</h5>
                                        <p class="card-text"><h1><c:out value="${row.Totales}"/></h1></p>
                                      </div>

                        </div>
                    </div>
                    <div class="col-lg-6 text-white  col-md-6 mb-4">                
                        <div class="card text-white bg-warning" >
                              <div class="card-header">CASOS</div>
                              <div class="card-body">
                                <h5 class="card-title">Aprobados</h5>
                                <p class="card-text"><h1><c:out value="${row.Desarrollo}"/></h1></p>
                              </div>
                            </div>
                      </div>        
                    <div class="col-lg-6 text-white  col-md-6 mb-4"> 
                        <div class="card text-white bg-danger" >
                        <div class="card-header">CASOS</div>
                        <div class="card-body">
                          <h5 class="card-title">Rechazados</h5>
                          <p class="card-text"><h1><c:out value="${row.Rechazados}"/></h1></p>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 text-white  col-md-6 mb-4"> 
                         <div class="card text-white bg-success" >
                        <div class="card-header">CASOS</div>
                        <div class="card-body">
                          <h5 class="card-title">Finalizados</h5>
                         <p class="card-text"><h1><c:out value="${row.Finalizados}"/></h1></p>
                        </div>
                      </div>
                    </div> 
                </c:forEach>
                </div>
            </div>
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

