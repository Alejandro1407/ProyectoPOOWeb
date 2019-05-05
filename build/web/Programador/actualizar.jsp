<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String Descripcion = request.getParameter("avances");
    String Porcentaje = request.getParameter("porcentaje");
    
    Connection conn = Conexion.Conectarse();
    if(conn == null){
        response.sendRedirect("ActualizarBit.jsp?Error=Ocurrio un error");
        return;
    }
    
    CallableStatement proc;
    proc = conn.prepareCall("{call ingresar_en_bitacora (?,?,?)}"); //Se encierra entre { la instruccion call y el procedimiento}
    proc.setInt(1, id);
    proc.setString(2, Descripcion);
    proc.setString(3, Porcentaje);
    ResultSet rs = proc.executeQuery();
    response.sendRedirect("bitacora.jsp?sucess=Bitacora actualizada con exito");
    return;
%>