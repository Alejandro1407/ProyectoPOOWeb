<%@page import="java.sql.*" %>
<%@page import="Datos.Conexion" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = Conexion.Conectarse();
    CallableStatement proc = conn.prepareCall("{ call crear_caso (?,?,?,?,?) }");
    proc.setInt(1, id);
    proc.setString(2, request.getParameter("FLimite"));
    proc.setInt(3,Integer.parseInt(request.getParameter("programador")));
    proc.setInt(4,Integer.parseInt(request.getParameter("tester")));
    proc.setString(5, request.getParameter("observaciones"));
    
    proc.executeQuery();
    
    response.sendRedirect("solicitudes.jsp?sucess=Solicitud Aceptada con exito");
    return;
%>