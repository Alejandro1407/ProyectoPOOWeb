package org.apache.jsp.Programador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bitacora_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write(' ');

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title></title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.8.1/css/all.css\">\r\n");
      out.write("        <link href=\"../css/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../css/mdb.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <style>\r\n");
      out.write("            .map-container{\r\n");
      out.write("                overflow:hidden;\r\n");
      out.write("                padding-bottom:56.25%;\r\n");
      out.write("                position:relative;\r\n");
      out.write("                height:0;\r\n");
      out.write("            }\r\n");
      out.write("            .map-container iframe{\r\n");
      out.write("                left:0;\r\n");
      out.write("                top:0;\r\n");
      out.write("                height:100%;\r\n");
      out.write("                width:100%;\r\n");
      out.write("                position:absolute;\r\n");
      out.write("            }\r\n");
      out.write("            </style>\r\n");
      out.write("    </head>\r\n");
      out.write("  <body class=\"grey lighten-3\">\r\n");
      out.write("    <!-- Sidebar -->\r\n");
      out.write("    <div class=\"sidebar-fixed position-fixed\">\r\n");
      out.write("\r\n");
      out.write("      <a class=\"logo-wrapper waves-effect\">\r\n");
      out.write("        <img src=\"https://mdbootstrap.com/img/logo/mdb-email.png\" class=\"img-fluid\" alt=\"\">\r\n");
      out.write("      </a>\r\n");
      out.write("        <div class=\"list-group list-group-flush\">\r\n");
      out.write("        <a href=\"index.jsp\" class=\"list-group-item list-group-item-action waves-effect\">\r\n");
      out.write("          <i class=\"fas fa-chart-pie mr-3\"></i>Dashboard\r\n");
      out.write("        </a>\r\n");
      out.write("        <a href=\"bitacora.jsp\" class=\"list-group-item active  waves-effect\">\r\n");
      out.write("          <i class=\"fas fa-book mr-3\"></i>Bitacora</a>\r\n");
      out.write("          <a href=\"#\" class=\"list-group-item list-group-item-action waves-effect\">\r\n");
      out.write("          <i class=\"fas fa-lock mr-3\"></i>Cambiar Contraseña</a>\r\n");
      out.write("           <a href=\"../Servicios/cerrarsesion.jsp\" class=\"list-group-item red-text list-group-item-action waves-effect\">\r\n");
      out.write("          <i class=\"fas fa-sign-out-alt mr-3\"></i>Cerrar Sesion</a>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- Sidebar -->\r\n");
      out.write("\r\n");
      out.write("  <!--Main layout-->\r\n");
      out.write("  <main class=\"pt-5 mx-lg-5\">\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("   <!--WorkArea-->\r\n");
      out.write("   \r\n");
      out.write("   <!--WorkArea-->\r\n");
      out.write("    </div>\r\n");
      out.write("  </main>\r\n");
      out.write("  <!--Main layout-->\r\n");
      out.write("\r\n");
      out.write("                    <!-- SCRIPTS -->\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/jquery.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/popper.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/bootstrap.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/mdb.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("              new WOW().init();\r\n");
      out.write("        </script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
