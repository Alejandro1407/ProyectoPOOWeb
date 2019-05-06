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
        <title>Departamentos</title>
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
        <a href="departamentos.jsp" class="list-group-item active waves-effect">
          <i class="fas fa-building mr-3"></i><fmt:message key="menu.departamentos" /></a>
        <a href="empleados.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-users mr-3"></i><fmt:message key="menu.empleados" /></a>
        <a href="roles.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-briefcase mr-3"></i><fmt:message key="menu.roles" /></a>
        <a href="reportes.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-line mr-3"></i><fmt:message key="menu.reportes" /></a>
          <a href="cambiar.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-lock mr-3"></i><fmt:message key="menu.cambiar" /></a>
           <a href="../Servicios/cerrarsesion.jsp" class="list-group-item red-text list-group-item-action waves-effect">
          <i class="fas fa-sign-out-alt mr-3"></i><fmt:message key="menu.cerrar" /></a>
      </div>


    </div>
    <!-- Sidebar -->

  <!--Main layout-->
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid">
        <!-- WorkArea -->
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/SistemaPOO"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            select * from departamento;
        </sql:query>
            <h1 style="text-align: center">Departamentos</h1>
            <a href='addDepartamento.jsp'><i class="fas fa-plus"></i> Agregar departamento</a>
        <center>
            <table style="margin-top: 10px;" class="table table-striped table-bordered" id="deptotable" width="100%">
                <thead class="thead-dark">
                    <tr>
                        <th>Codigo</th>
                        <th>Dpto. Nombre</th>
                        <th>Dpto. Descripcion</th>
                        <th colspan="2"><center>Acciones</center></th>
                    </tr>
                </thead>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.codigo}"/></td>
                        <td><c:out value="${row.nombre}"/></td>
                        <td><c:out value="${row.descripcion}"/></td>
                        <td><a style='color:#009382; font-weight: bold' href="updDepartamento.jsp?id=<c:out value="${row.id}"/>">Modificar</a></td>
                        <td><a style='color:#f44336; font-weight: bold' href="delDepartamento.jsp?id=<c:out value="${row.id}"/>">Borrar</a></td>
                    </tr>
                </c:forEach>
            </table>
            <font color="red"><c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}" />
                </c:if>
            </font>
            <font color="green"><c:if test="${not empty param.susMsg}">
                <c:out value="${param.susMsg}" />
                </c:if>
            </font>
        </center>
        
        
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
