<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    
    Connection conn = Conexion.Conectarse();
    if(conn == null){
        response.sendRedirect("ActualizarBit.jsp?Error=Ocurrio un error");
        return;
    }
    
    CallableStatement proc;
    proc = conn.prepareCall("{call finalizar_caso (?)}"); //Se encierra entre { la instruccion call y el procedimiento}
    proc.setInt(1, id);
    ResultSet rs = proc.executeQuery();
    response.sendRedirect("cambios.jsp?sucess=Sistema finalizado correctamente");
    return;
%>
