<%@page import="java.sql.*" %>>
<%@page import="Datos.Conexion" %>
<%
        int id = Integer.parseInt(request.getParameter("id"));
        String Motivo = request.getParameter("motivo");
        Connection conn = Conexion.Conectarse();
        CallableStatement proc = conn.prepareCall("{call crear_rechazo (?,?)}");
        proc.setInt(1, (id));
        proc.setString(2, Motivo);
        proc.executeQuery();
        
        response.sendRedirect("solicitudes.jsp?sucess=Se rechazo con exito");
        return;
%>