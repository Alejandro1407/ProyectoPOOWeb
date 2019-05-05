<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>
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
<%
    String Descripcion = request.getParameter("descripcion");
    String Porcentaje = request.getParameter("porcentaje");
    
    Connection conn = Conexion.Conectarse();
    if(conn == null){
        response.sendRedirect("ActualizarBit.jsp?Error=Ocurrio un error");
        return;
    }
    
    CallableStatement proc;
    proc = conn.prepareCall("{call ingresar_en_bitacora (?,?,?)}"); //Se encierra entre { la instruccion call y el procedimiento}
    proc.setInt(1, idDepartamento);
    proc.setString(2, Descripcion);
    proc.setString(3, Porcentaje);
    ResultSet rs = proc.executeQuery();
%>