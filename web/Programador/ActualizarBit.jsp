<%
     //Para evitar el acceso no authorizado
     
     HttpSession sesion = request.getSession();
     
     if(sesion.getAttribute("Programador") == null){
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
        <a href="bitacora.jsp" class="list-group-item active  waves-effect">
          <i class="fas fa-book mr-3"></i>Bitacora</a>
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
    <!--WorkArea-->
        <div class="row wow fadeIn">
                      <!--Grid column-->
            <div class="col-md-12 col-xl-11 mb-6">

                <!--Card-->
                <div class="card">

                  <!--Card content-->
                    <div class="card-body">

                        <!-- Form -->
                        <form action="actualizar.jsp" method="POST">
                            <!-- Heading -->
                            <h3 class="dark-grey-text text-center">
                              <strong>Actualizar Bitacora</strong>
                            </h3>
                            <hr>


                            <div class="md-form">
                                <label>Descripcion</label>
                                <input type="text" id="form2" class="form-control" name="descripcion" placeholder="Descripcion...">

                            </div>

                            <div class="md-form">
                                <label>Porcentaje</label>
                                <input type="text" id="form8" class="form-control" name="porcentaje" placeholder="Total de porcentaje %   "></input>
                            </div>

                            <div class="text-center">
                                <%
                                    if(request.getParameter("Error") != null){
                                %>
                                  <p class="alert alert-danger"> <%=request.getParameter("Error")%></p>
                                <%
                                     }
                                %>
                              <button class="btn btn-success">Actualizar</button>
                              <hr>
                            </div>

                        </form>
                        <!-- Form -->

                    </div>

                </div>
                <!--/.Card-->

            </div>
            <!--Grid column-->
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