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
        <a href="solicitudes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-file-alt mr-3"></i>Solicitudes</a>
        <a href="casos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Casos</a>
          <a href="#" class="list-group-item list-group-item-action waves-effect">
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
             <h4 class="grey-text pt-3">Aceptar Solicitud</h4>
             
             <div>
                <%@page import="Datos.Conexion" %>
                <%@page import="java.sql.*" %>
                <%
                   int id = Integer.parseInt(request.getParameter("id"));
                   Connection conn = Conexion.Conectarse();
                   if(conn == null){
                       out.print("<p class='alert alert-danger'>Ocurrio un error</p>");
                       return;
                   }
                    CallableStatement proc = conn.prepareCall("{call mostrar_solicitudes (?)}");
                    proc.setInt(1, idDepartamento);
                    ResultSet solicitudes = proc.executeQuery();
                    solicitudes.beforeFirst();
                    while(solicitudes.next()){
                        if(solicitudes.getInt(1) == id){
                    
                %>
                <form class="pl-5 pr-5 pt-3" action="procesarsolicitud.jsp" method="POST">
                        <input type="hidden" value="<%=solicitudes.getString(1)%>" name="id" >
                      <div class="form-group">
                        <label for="exampleInputEmail1">Nombre:</label>
                        <input type="text" class="form-control" value="<%= solicitudes.getString(2) %>" disabled>
                        <small id="emailHelp" class="form-text text-muted"></small>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Descripcion</label>
                        <textarea  class="form-control" disabled><%= solicitudes.getString(3) %>
                        </textarea>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">Fecha Limite:</label>
                        <input type="date" class="form-control" name="FLimite" required>
                      </div>
                        
                        <label for="exampleInputPassword1">Programador:</label>
                        
                        <select name="programador" class="custom-select" required>
                        
                   <%
                       Connection conn2 = Conexion.Conectarse();
                       CallableStatement proc2 = conn2.prepareCall("{call programadores_sin_caso (?)}");
                       proc2.setInt(1, idDepartamento);
                       ResultSet programadores = proc2.executeQuery();
                       while(programadores.next()){
                    %>
                    <option value="<%= programadores.getString(1) %>"><%= programadores.getString(2)%></option>>
                <%         }//While
                         %>
                        </select>
                        <!---->
                        <label for="exampleInputPassword1">Tester:</label>
                        <select name="tester" class="custom-select" required>
                        
                   <%
                       Connection conn3 = Conexion.Conectarse();
                       CallableStatement proc3 = conn3.prepareCall("{call empleados_sin_caso (?)}");
                       proc3.setInt(1, idDepartamento);
                       ResultSet testers = proc3.executeQuery();
                       while(testers.next()){
                    %>
                    <option value="<%= testers.getString(1) %>"><%= testers.getString(2)%></option>>
                <%         }//While
                        } //If
                    } //While %>
                        </select>
                         <div class="form-group">
                        <label for="exampleInputPassword1">Observaciones:</label>
                        <textarea  class="form-control" placeholder="(Opcional)"></textarea>
                      </div>
                        <%
                            if(request.getParameter("Error") != null){
                        %>
                        <p class="alert alert-danger mb-0"><%= request.getParameter("Error") %></p>
                        <%}%>
                      <button type="submit" class="btn btn-primary">Aceptar</button>
                       <a href="solicitudes.jsp" class="btn btn-danger">Cancelar</a>
                   </form>
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

