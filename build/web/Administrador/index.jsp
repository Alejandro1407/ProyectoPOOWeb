 <%
     //Para evitar el acceso no authorizado
     
     HttpSession sesion = request.getSession();
     if(sesion.getAttribute("Administrador").equals(null)){
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
    </head>
    <body>
        
        
        <!-- SCRIPTS -->
        <script type="text/javascript" src="../js/jquery-3.4.0.min.js"></script>
        <script type="text/javascript" src="../js/popper.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/mdb.min.js"></script>
        <script type="text/javascript">
              new WOW().init();
        </script>
    </body>
</html>

