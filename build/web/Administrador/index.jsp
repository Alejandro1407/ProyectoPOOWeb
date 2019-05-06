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
        <a href="index.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Dashboard
        </a>
        <a href="departamentos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-building mr-3"></i>Departamentos</a>
        <a href="empleados.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-users mr-3"></i>Empleados</a>
        <a href="roles.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-briefcase mr-3"></i>Roles</a>
        <a href="reportes.jsp" class="list-group-item list-group-item-action waves-effect">
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


      <!--Grid row-->
      <h1 class="text-center">Bienvenido Administrador</h1>
        <br>
      <div class="row wow fadeIn">

        <!--Grid column-->
                        
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header text-center">Departamentos</div>

            <!--Card content-->
            <div class="card-body text-center">

                <a href="departamentos.jsp" class="btn btn-black"><i class="fas fa-building mr-3"></i>Departamentos</a>

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->
        
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header text-center">Empleados</div>

            <!--Card content-->
            <div class="card-body text-center">

                <a href="empleados.jsp" class="btn btn-cyan"><i class="fas fa-users mr-3"></i>Empleados</a>

            </div>

          </div>
          <!--/.Card-->

        </div>
        
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header text-center">Roles</div>

            <!--Card content-->
            <div class="card-body text-center">

                <a href="roles.jsp" class="btn btn-success"><i class="fas fa-briefcase mr-3"></i>Roles</a>

            </div>

          </div>
          <!--/.Card-->

        </div>
        
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header text-center">Reportes</div>

            <!--Card content-->
            <div class="card-body text-center">

                <a href="reportes.jsp" class="btn btn-lime"><i class="fas fa-chart-line mr-3"></i>Reportes</a>

            </div>

          </div>
          <!--/.Card-->

        </div>
        
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header text-center">Cambiar contraseña</div>

            <!--Card content-->
            <div class="card-body text-center">

                <a href="cambiar.jsp" class="btn btn-orange"><i class="fas fa-lock mr-3"></i>Cambiar contraseña</a>

            </div>

          </div>
          <!--/.Card-->
        <!--Grid column-->
        
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

