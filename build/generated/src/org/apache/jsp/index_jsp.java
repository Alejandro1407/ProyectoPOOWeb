package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"utf-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n");
      out.write("  <title>ProyectoPOO - Index</title>\r\n");
      out.write("  <!-- Font Awesome -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.1/css/all.css\">\r\n");
      out.write("  <!-- Bootstrap core CSS -->\r\n");
      out.write("  <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("  <!-- Material Design Bootstrap -->\r\n");
      out.write("  <link href=\"css/mdb.css\" rel=\"stylesheet\">\r\n");
      out.write("  <!-- Your custom styles (optional) -->\r\n");
      out.write("  <link href=\"css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("  <style type=\"text/css\">\r\n");
      out.write("    html,\r\n");
      out.write("    body,\r\n");
      out.write("    header,\r\n");
      out.write("    .view {\r\n");
      out.write("      height: 100%;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media (max-width: 740px) {\r\n");
      out.write("      html,\r\n");
      out.write("      body,\r\n");
      out.write("      header,\r\n");
      out.write("      .view {\r\n");
      out.write("        height: 1000px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media (min-width: 800px) and (max-width: 850px) {\r\n");
      out.write("      html,\r\n");
      out.write("      body,\r\n");
      out.write("      header,\r\n");
      out.write("      .view {\r\n");
      out.write("        height: 650px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("    @media (min-width: 800px) and (max-width: 850px) {\r\n");
      out.write("              .navbar:not(.top-nav-collapse) {\r\n");
      out.write("                  background: #1C2331!important;\r\n");
      out.write("              }\r\n");
      out.write("          }\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("  <!-- Navbar -->\r\n");
      out.write("  <nav class=\"navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("      <!-- Brand -->\r\n");
      out.write("      <a class=\"navbar-brand\" href=\"https://mdbootstrap.com/docs/jquery/\" target=\"_blank\">\r\n");
      out.write("        <strong>ProyectoPOO</strong>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Collapse -->\r\n");
      out.write("      <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\"\r\n");
      out.write("        aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("      </button>\r\n");
      out.write("\r\n");
      out.write("      <!-- Links -->\r\n");
      out.write("      <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Left -->\r\n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\r\n");
      out.write("          <li class=\"nav-item active\">\r\n");
      out.write("            <a class=\"nav-link\" href=\"#\">Home\r\n");
      out.write("              <span class=\"sr-only\">(current)</span>\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("\r\n");
      out.write("        <!-- Right -->\r\n");
      out.write("        <ul class=\"navbar-nav nav-flex-icons\">\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a href=\"https://www.facebook.com/mdbootstrap\" class=\"nav-link\" target=\"_blank\">\r\n");
      out.write("              <i class=\"fab fa-facebook-f\"></i>\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a href=\"https://twitter.com/MDBootstrap\" class=\"nav-link\" target=\"_blank\">\r\n");
      out.write("              <i class=\"fab fa-twitter\"></i>\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("  </nav>\r\n");
      out.write("  <!-- Navbar -->\r\n");
      out.write("\r\n");
      out.write("  <!-- Full Page Intro -->\r\n");
      out.write("  <div class=\"view full-page-intro\" style=\"background-image: url('https://mdbootstrap.com/img/Photos/Others/images/78.jpg'); background-repeat: no-repeat; background-size: cover;\">\r\n");
      out.write("   \r\n");
      out.write("     \r\n");
      out.write("    <!-- Mask & flexbox options-->\r\n");
      out.write("    <div class=\"mask rgba-black-light d-flex justify-content-center align-items-center\">\r\n");
      out.write("      \r\n");
      out.write("      <!-- Content -->\r\n");
      out.write("      <div class=\"container\">\r\n");
      out.write("        <!--Grid row-->\r\n");
      out.write("        <div class=\"row wow fadeIn\">\r\n");
      out.write("\r\n");
      out.write("          <!--Grid column-->\r\n");
      out.write("          <div class=\"col-md-6 mb-4 white-text text-center text-md-left\">\r\n");
      out.write("\r\n");
      out.write("            <h1 class=\"display-4 font-weight-bold\">Sistema de Administracion Web</h1>\r\n");
      out.write("\r\n");
      out.write("            <hr class=\"hr-light\">\r\n");
      out.write("\r\n");
      out.write("            <p>\r\n");
      out.write("              <strong>Sistema de gestion de casos y solicitudes</strong>\r\n");
      out.write("            </p>\r\n");
      out.write("\r\n");
      out.write("            <p class=\"mb-4 d-none d-md-block\">\r\n");
      out.write("              <strong>Sistema desarrollado para complementar el desarrollo de la aplicacion de escritorio para la materia Programacion Orientada a Objetos</strong>\r\n");
      out.write("            </p>\r\n");
      out.write("\r\n");
      out.write("          </div>\r\n");
      out.write("          <!--Grid column-->\r\n");
      out.write("\r\n");
      out.write("          <!--Grid column-->\r\n");
      out.write("          <div class=\"col-md-6 col-xl-5 mb-4\">\r\n");
      out.write("\r\n");
      out.write("            <!--Card-->\r\n");
      out.write("            <div class=\"card\">\r\n");
      out.write("\r\n");
      out.write("              <!--Card content-->\r\n");
      out.write("              <div class=\"card-body\">\r\n");
      out.write("\r\n");
      out.write("                <!-- Form -->\r\n");
      out.write("                <form action=\"Servicios/iniciarsesion.jsp\" method=\"POST\">\r\n");
      out.write("                  <!-- Heading -->\r\n");
      out.write("                  <h3 class=\"dark-grey-text text-center\">\r\n");
      out.write("                    <strong>Iniciar Sesion</strong>\r\n");
      out.write("                  </h3>\r\n");
      out.write("                  <hr>\r\n");
      out.write("\r\n");
      out.write("          \r\n");
      out.write("                  <div class=\"md-form\">\r\n");
      out.write("                    <i class=\"fas fa-envelope prefix grey-text\"></i>\r\n");
      out.write("                    <input type=\"text\" id=\"form2\" class=\"form-control\" name=\"Email\" placeholder=\"alguien@example.com\">\r\n");
      out.write("                   \r\n");
      out.write("                  </div>\r\n");
      out.write("\r\n");
      out.write("                  <div class=\"md-form\">\r\n");
      out.write("                    <i class=\"fas fa-lock prefix grey-text\"></i>\r\n");
      out.write("                    <input type=\"password\" id=\"form8\" class=\"form-control\" name=\"Password\" placeholder=\"********\"></input>\r\n");
      out.write("                  </div>\r\n");
      out.write("\r\n");
      out.write("                  <div class=\"text-center\">\r\n");
      out.write("                      ");

                          if(request.getParameter("Error") != null){
                      
      out.write("\r\n");
      out.write("                        <p class=\"alert alert-danger\"> ");
      out.print(request.getParameter("Error"));
      out.write("</p>\r\n");
      out.write("                      ");

                           }
                      
      out.write("\r\n");
      out.write("                    <button class=\"btn btn-indigo\">Iniciar Sesion</button>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                  </div>\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("                <!-- Form -->\r\n");
      out.write("\r\n");
      out.write("              </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <!--/.Card-->\r\n");
      out.write("\r\n");
      out.write("          </div>\r\n");
      out.write("          <!--Grid column-->\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--Grid row-->\r\n");
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- Content -->\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- Mask & flexbox options-->\r\n");
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- Full Page Intro -->\r\n");
      out.write("\r\n");
      out.write("  <!--Footer-->\r\n");
      out.write("  <footer class=\"page-footer text-center font-small wow fadeIn\">\r\n");
      out.write("\r\n");
      out.write("    <hr class=\"my-4\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Social icons -->\r\n");
      out.write("    <div class=\"pb-4\">\r\n");
      out.write("      <a href=\"https://www.facebook.com/mdbootstrap\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-facebook-f mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://twitter.com/MDBootstrap\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-twitter mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://www.youtube.com/watch?v=7MUISDJ5ZZ4\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-youtube mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://plus.google.com/u/0/b/107863090883699620484\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-google-plus-g mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://dribbble.com/mdbootstrap\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-dribbble mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://pinterest.com/mdbootstrap\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-pinterest mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"https://github.com/mdbootstrap/bootstrap-material-design\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-github mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("\r\n");
      out.write("      <a href=\"http://codepen.io/mdbootstrap/\" target=\"_blank\">\r\n");
      out.write("        <i class=\"fab fa-codepen mr-3\"></i>\r\n");
      out.write("      </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- Social icons -->\r\n");
      out.write("\r\n");
      out.write("    <!--Copyright-->\r\n");
      out.write("    <div class=\"footer-copyright py-3\">\r\n");
      out.write("      © 2019 Copyright:\r\n");
      out.write("      <a href=\"https://mdbootstrap.com/education/bootstrap/\" target=\"_blank\"> ProyectoPOO.com </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!--/.Copyright-->\r\n");
      out.write("\r\n");
      out.write("  </footer>\r\n");
      out.write("  <!--/.Footer-->\r\n");
      out.write("\r\n");
      out.write("  <!-- SCRIPTS -->\r\n");
      out.write("  <!-- JQuery -->\r\n");
      out.write("  <script type=\"text/javascript\" src=\"js/jquery-3.4.0.min.js\"></script>\r\n");
      out.write("  <!-- Bootstrap tooltips -->\r\n");
      out.write("  <script type=\"text/javascript\" src=\"js/popper.min.js\"></script>\r\n");
      out.write("  <!-- Bootstrap core JavaScript -->\r\n");
      out.write("  <script type=\"text/javascript\" src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("  <!-- MDB core JavaScript -->\r\n");
      out.write("  <script type=\"text/javascript\" src=\"js/mdb.min.js\"></script>\r\n");
      out.write("  <!-- Initializations -->\r\n");
      out.write("  <script type=\"text/javascript\">\r\n");
      out.write("    // Animations initialization\r\n");
      out.write("    new WOW().init();\r\n");
      out.write("  </script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
