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
     
     if(sesion.getAttribute("Programador") == null){
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <a href="bitacora.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-book mr-3"></i>Bitacora</a>
          <a href="cambiar.jsp" class="list-group-item active  waves-effect">
          <i class="fas fa-lock mr-3"></i>Cambiar Contraseña</a>
           <a href="../Servicios/cerrarsesion.jsp" class="list-group-item red-text list-group-item-action waves-effect">
          <i class="fas fa-sign-out-alt mr-3"></i>Cerrar Sesion</a>
      </div>

    </div>
    <!-- Sidebar -->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
     <form action="cambiardb.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                       <h2>Cambiar contraseña</h2>
                
              
                                <div class="form-group">
                   <label for="email">Ingrese la nueva contraseña:</label>
                   <input type="password" class="form-control" id="email" name="p1">
                 </div>
                 <div class="form-group">
                   <label for="pwd">Vuelva a escribir la contraseña:</label>
                   <input type="password" class="form-control" id="pwd" name="p2">
                 </div>
                    <tr>
                        <td><input type="submit" value="Cambiar contraseña" /></td>
                        <td><input type="reset" value="Limpiar"/></td>
                        
                    </tr>
                    <tr>
                        <td><label></label></td>
                        <td><input  type="text" value="<%= idEmpleado %>" style="visibility:hidden" name="id"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
                      <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
          
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
    
        </c:if></font>
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

