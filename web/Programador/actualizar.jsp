<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>
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