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
     
     if(sesion.getAttribute("JefeDesarrollo") == null){
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
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <i class="fas fa-file-alt mr-3"></i>Solicitudes</a>
        <a href="casos.jsp" class="list-group-item list-group-item-action waves-effect">
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
        <!-- WorkArea -->
         <div class="bg-white p-3 ">
             <h4 class="grey-text mb-3">Solicitudes</h4>
             <%
                 if(request.getParameter("sucess") != null){
             %>
                <p class="alert alert-warning"><%= request.getParameter("sucess")%></p>
             <% } %>
             <div>
                <%@page import="Datos.Conexion" %>
                <%@page import="java.sql.*" %>
                <%
                   Connection conn = Conexion.Conectarse();
                   if(conn == null){
                       out.print("<p class='alert alert-danger'>Ocurrio un error</p>");
                       return;
                   }
                    CallableStatement proc = conn.prepareCall("{call mostrar_solicitudes (?)}");
                    proc.setInt(1, idDepartamento);
                    ResultSet solicitudes = proc.executeQuery();
                    if(!solicitudes.next()){
                        out.println("<p class='alert alert-success'>No hay solicitudes pendientes de aprobacion </p>");
                        return;
                    }
                    solicitudes.beforeFirst();
                %>
                
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Acciones</th>
                    </tr>
                    <% while(solicitudes.next()) { %>
                    <tr>
                        <td> <%= solicitudes.getString(2) %></td>
                        <td> <%= solicitudes.getString(3) %></td>
                        <td> 
                            <a href="aceptarsolicitud.jsp?id=<%= solicitudes.getString(1)%>" class="btn btn-success"><i class="fas fa-check white-text mr-1"></i>Aceptar</a>
                            <a href="rechazarsolicitud.jsp?id<%= solicitudes.getString(1)%>" class="btn btn-danger"><i class="fas fa-times white-text mr-1"></i>Rechazar</a>
                        </td>
                    </tr>
                    <% } %>
                 </table>
              </div>
           </div>
           
        <!-- FinWorkArea-->
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

