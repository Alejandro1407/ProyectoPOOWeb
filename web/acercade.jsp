<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>ProyectoPOO - Acerca de</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.css" rel="stylesheet">
  <style type="text/css">
    html,
    body,
    header,
    .view {
      height: 100%;
    }

    @media (max-width: 740px) {
      html,
      body,
      header,
      .view {
        height: 1000px;
      }
    }

    @media (min-width: 800px) and (max-width: 850px) {
      html,
      body,
      header,
      .view {
        height: 650px;
      }
    }
    @media (min-width: 800px) and (max-width: 850px) {
              .navbar:not(.top-nav-collapse) {
                  background: #1C2331!important;
              }
          }
  </style>
</head>

<body>

  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank">
        <strong><fmt:message key="navbar.title"/></strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
              <a class="nav-link" href="index.jsp"><fmt:message key="navbar.index"/>
              <span class="sr-only">(current)</span>
            </a>
          </li>
           <li class="nav-item active">
            <a class="nav-link" href="acercade.jsp"><fmt:message key="navbar.acerca"/>
              <span class="sr-only">(current)</span>
            </a>
          </li>
        </ul>
        
         
        


        <!-- Right -->
        <ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
              <i class="fab fa-facebook-f"></i>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
              <i class="fab fa-twitter"></i>
            </a>
          </li>
        </ul>

      </div>

    </div>
  </nav>
  <!-- Navbar -->


  <div id="theDiv">
      <h1 class="white-text text-align-center font-weight-bold" id="Titulo"><fmt:message key="acerca.title"/></h1>
    </div>

    <div class="bg-white panel pt-5">
        <h2 class="grey-text text-align-center font-weight-bold wow fadeInUp pb-3"><fmt:message key="navbar.title"/></h2>
        <h4 class="grey-text Lato"><fmt:message key="acerca.misiontitle"/></h4>
        <p class="grey-text wow fadeInUp">
          <fmt:message key="acerca.mision"/>
        </p>
        <h4 class="grey-text Lato"><fmt:message key="acerca.visiontitle"/></h4>
        <p class="grey-text wow fadeInUp">
           <fmt:message key="acerca.vision"/>
        </p>
        <br><br>
    </div>
    
    <div class="bg-white2 panel">
        <h2 class="grey-text text-align-center font-weight-bold pt-5 pb-5 wow fadeInUp"><fmt:message key="acerca.team"/></h2>
        <div class="mb-4">
            <img class="img-fluid float-left mr-4 wow fadeInUp" width="95" heigth="94" src="img/denis.jpg" alt="dennisee">
            <h5 class="Lato pt-4 wow fadeInUp">Dennise Enrique Cruz Inestrosa, Ing. Civil</h5>
            <p class="Lato pt-0 blue-text wow fadeInUp">Dennise@gmail.com | TelÃ©fono: 78829289</p>
            <p class="Lato pt-2 grey-text wowo fadeInUp clear-both">Es el encargado de diseñar y dar mantenimiento a la base de datos</p>
        </div>
        <div class="mb-3">
            <img class="img-fluid float-left mr-4 wow fadeInUp" width="95" heigth="94" src="img/mat.jpg" alt="dennisee">
            <h5 class="Lato pt-4 wow fadeInUp">Matthew Emilio Gai Ramos, ing.computacion</h5>
            <p class="Lato pt-0 blue-text wow fadeInUp">GaiRamos@gmail.com | TelÃ©fono: 78829289</p>
            <p class="Lato pt-2 grey-text wowo fadeInUp clear-both">Es el encargado de darle diseño a los programas ya hechos</p>
        </div>
        <div class="mb-3">
            <img class="img-fluid float-left mr-4 wow fadeInUp" width="95" heigth="94" src="img/marco.jpg" alt="dennisee">
            <h5 class="Lato pt-5 wow fadeInUp">Marco Hernandez Hernandez, Web Developer</h5>
            <p class="Lato pt-0 blue-text wow fadeInUp">michael_hernandez@gmail.com | Teléfono: 78829289</p>
            <p class="Lato pt-2 grey-text wowo fadeInUp clear-both">Es el encargado de ayudarle a todos en sus tareas al realizar un proyecto</p>
        </div>
        <div class="mb-3">
            <img class="img-fluid float-left mr-4 wow fadeInUp" width="95" heigth="94" src="img/pablo.jpg" alt="dennisee">
            <h5 class="Lato pt-5 wow fadeInUp">Javier Ernesto Perez Pablo, ing. Teleco</h5>
            <p class="Lato pt-0 blue-text wow fadeInUp">hawinkg@gmail.com | TelÃ©fono: 78829289</p>
            <p class="Lato pt-2 grey-text wowo fadeInUp clear-both">Es el encargado de programar algunas interfaces de proyectos</p>
        </div>
        <div class="mb-3">
            <img class="img-fluid float-left mr-4 wow fadeInUp" width="95" heigth="94" src="img/alejo.jpg" alt="dennisee">
            <h5 class="Lato pt-3 wow fadeInUp">Victor Alejandro Alejo Gálvez, CEO</h5>
            <p class="Lato pt-0 blue-text wow fadeInUp">elmejordobleaa@gmail.com | TelÃ©fono: 78827529</p>
            <p class="Lato pt-2 grey-text wowo fadeInUp clear-both">Es el encargado de verificar que todo este bien y funcionando y si no funciona el lo arregla</p>
        </div>
        <br><br>
    </div>


  <!--Footer-->
  <footer class="page-footer text-center font-small wow fadeIn">

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fab fa-facebook-f mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fab fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fab fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fab fa-google-plus-g mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fab fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fab fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fab fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fab fa-codepen mr-3"></i>
      </a>
    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      Â© 2019 Copyright:
      <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> ProyectoPOO.com </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popperjs"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrapjs"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();
  </script>
</body>

</html>