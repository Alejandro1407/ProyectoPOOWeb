<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/mdb.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        
        <!-- cdn de librerías -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" />
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>

        <!-- fin librerías NO ME FUNCIONO-->
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
            
            table{
                border: 1px solid #009382;
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
          <i class="fas fa-chart-pie mr-3"></i><fmt:message key="menu.dash" />
        </a>
        <a href="departamentos.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-building mr-3"></i><fmt:message key="menu.departamentos" /></a>
        <a href="empleados.jsp" class="list-group-item active  waves-effect">
          <i class="fas fa-users mr-3"></i><fmt:message key="menu.empleados" /></a>
        <a href="roles.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-briefcase mr-3"></i><fmt:message key="menu.roles" /></a>
        <a href="reportes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-line mr-3"></i><fmt:message key="menu.reportes" /></a>
          <a href="#" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-lock mr-3"></i><fmt:message key="menu.cambiar" /></a>
           <a href="../Servicios/cerrarsesion.jsp" class="list-group-item red-text list-group-item-action waves-effect">
          <i class="fas fa-sign-out-alt mr-3"></i>Cerrar Sesion</a>
      </div>

    </div>
    <!-- Sidebar -->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="roles">
            call mostrar_rol()
        </sql:query>
        <sql:query dataSource="${dbsource}" var="deptos">
            call mostrar_departamento()
        </sql:query>
        
        <!-- WorkArea -->
        <div class="bg-white p-5 w-100">
        <h1 style="text-align: center"><fmt:message key="lbl.emptitle"/></h1>
        <h3 style="text-align: center; color:#009382;"><fmt:message key="btn.agregar"/></h3>
        <center>
       
        <form action="addEmpleadoDB.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <tbody>
                    <tr>
                        <td><label><fmt:message key="form.nombre" /> <span class="red-text">*</span></label></td>
                        <td><input type="text" class="form-control" name="txtNombre"/></td>
                    </tr>
                    <tr>
                        <td><label><fmt:message key="form.apellidos" /> <span class="red-text">*</span></label></td>
                        <td><input type="text" class="form-control" name="txtApellido"/></td>
                    </tr>
                    <tr>
                        <td><label><fmt:message key="form.correo" /> <span class="red-text">*</span></label></td>
                        <td><input type="email" class="form-control" name="txtEmail"/></td>
                    </tr>
                    <tr>
                        <td><label><fmt:message key="form.rol" /> <span class="red-text">*</span></label></td>
                        <td>
                            <select name="rol" class="custom-control custom-select">
                                <c:forEach var="data" items="${roles.rows}">
                                    <option value="${data.id}">${data.rol}</option>
                                </c:forEach>
                            </select>
                        
                        </td>
                    </tr>
                    <tr>
                        <td><label><fmt:message key="form.departamento" /> <span class="red-text">*</span></label></td>
                        <td>
                            <select name="depto" class="custom-control custom-select">
                                <c:forEach var="data" items="${deptos.rows}">
                                    <option value="${data.id}">${data.nombre}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input class="btn btn-success" type="submit" value="Agregar" /></td>
                        <td><input class="btn btn-warning" type="reset" value="Limpiar"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
                      
        <a href="empleados.jsp">Ver todos los empleados</a>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
        </c:if></font>
        </center>
        
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
    <script type="text/javascript">
            
            $(document).ready(function() {
                $('#deptotable').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                } );
                
                new WOW().init();
            } );
    </script>
</html>

