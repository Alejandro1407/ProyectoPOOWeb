<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String Observaciones = request.getParameter("observacion");
    
    Connection conn = Conexion.Conectarse();
    if(conn == null){
        response.sendRedirect("ActualizarBit.jsp?Error=Ocurrio un error");
        return;
    }
    
    CallableStatement proc;
    proc = conn.prepareCall("{call agregar_observacion (?,?)}"); //Se encierra entre { la instruccion call y el procedimiento}
    proc.setInt(1, id);
    proc.setString(2, Observaciones);
    ResultSet rs = proc.executeQuery();
    response.sendRedirect("rechazar.jsp?sucess=Observaciones enviadas con exito");
    return;
%>
