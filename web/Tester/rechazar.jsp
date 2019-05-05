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
     
     if(sesion.getAttribute("Empleado") == null){
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
        <a href="cambios.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-exchange-alt mr-3"></i>Cambios</a>
          <br>
          <a href="rechazar.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-exchange-alt mr-3"></i>Rechazar</a>
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
        <!--WorkArea-->
        <div class="bg-white p-3 ">
             <h4 class="grey-text pt-3">Purebas realizadas</h4>
             <% if(request.getParameter("sucess") != null){%>
                <p class="alert alert-success mb-0"><%=request.getParameter("sucess")%></p>
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
                    CallableStatement proc = conn.prepareCall("{call  mostrar_al_tester (?)}");
                    proc.setInt(1,Integer.parseInt(idEmpleado));
                    ResultSet tester = proc.executeQuery();
                    if(!tester.next()){
                        out.print("<p class='alert alert-danger'>No hay bitacoras que mostrar</p>");
                    }   
                    tester.beforeFirst();
                    tester.next();
                        
                %>
                <form class="pl-5 pr-5 pt-3" action="rechazo.jsp" method="POST">
                        <input type="hidden" value="<%=tester.getString(1)%>" name="id" >
                        <div class="form-group">
                        <label for="exampleInputPassword1">Nombre del caso:</label>
                        <input  class="form-control" disabled value="<%=tester.getString(2)%>"></input>
                      </div>
                       <div class="form-group">
                        <label for="exampleInputPassword1">Descripcion</label>
                        <textarea  name="descripcion" class="form-control"><%=tester.getString(3)%></textarea>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Observaciones del tester</label>
                        <textarea name="observacion" class="form-control"></textarea>
                      </div>
                        <%
                            if(request.getParameter("Error") != null){
                        %>
                        <p class="alert alert-danger mb-0"><%= request.getParameter("Error") %></p>
                        <%}%>
                      <button type="submit" class="btn btn-danger"><i class="fas fa-times white-text mr-1"></i>Rechazar</button>
                   </form>
              </div>
           </div>
        <!--WorkArea-->
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