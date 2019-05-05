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
         
         String idEmpleado = (String) cookies[1].getValue();
         String NombreUser = (String) cookies[2].getValue();
         int idDepartamento = Integer.parseInt(cookies[3].getValue());
         String NombreDepartamento = (String) cookies[4].getValue();     
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
          <i class="fas fa-file-alt mr-3"></i>Mostrar Solicitudes</a>
        <a href="casos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Crear solicitud</a>
           <a href="mostrarcasos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-suitcase mr-3"></i>Mostrar Casos</a>
        <a href="reportes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-line mr-3"></i>Reportes</a>
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


      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-lg-6 col-md-6 mb-4">

          <!--Card-->
          <div class="card">

            <!-- Card header -->
            <div class="card-header">Usuarios</div>

            <!--Card content-->
            <div class="card-body">

              <canvas id="lineChart"></canvas>

            </div>

          </div>
          <!--/.Card-->

        </div>
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

