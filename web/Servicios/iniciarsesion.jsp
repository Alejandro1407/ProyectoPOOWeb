<%@page import="Datos.Conexion" %>
<%@page import="java.sql.*" %>

<%
    
    String Email = request.getParameter("Email");
    String Password = request.getParameter("Password");
        Connection conn = Conexion.Conectarse();
        if(conn == null){
            response.sendRedirect("../index.jsp?Error=Ocurrio un error");
            return;
        }
            CallableStatement proc; //Declara un objeto de CallableStatement
            proc = conn.prepareCall("{call loguearse (?,?)}");
            proc.setString(1,Email);
            proc.setString(2,Password);
            ResultSet rs = proc.executeQuery();
       
    if(!rs.next()){
        response.sendRedirect("../index.jsp?Error=Usuario y/o contraseña incorrectos");
        return;
    }
    rs.first();
    
    HttpSession sesion = request.getSession(); //Para controlar las sesiones
   
    //Crea cookies con los datos necesarios para su funcionamiento
    Cookie idEmpleado = new Cookie("idEmpleado",rs.getString(1));
    Cookie NombreUser = new Cookie("NombreUser", rs.getString(2));
    Cookie idDepartamento = new Cookie("idDepartamento",rs.getString(4));
    Cookie NombreDepartamento = new Cookie("NombreDepartamento", rs.getString(5));
    idEmpleado.setPath("/");
    NombreUser.setPath("/");
    idDepartamento.setPath("/");
    NombreDepartamento.setPath("/");
    response.addCookie(idEmpleado);
    response.addCookie(NombreUser);
    response.addCookie(idDepartamento);
    response.addCookie(NombreDepartamento);
    
    String Rol = rs.getString(3);
    
            if(rs.getString(3).equals("Administrador")){
                sesion.setAttribute("Administrador", rs.getString(2));
                response.sendRedirect("../Administrador/index.jsp");
                return;
            }
            if(rs.getString(3).equals("Jefe de Area")){
                 sesion.setAttribute("JefeArea", rs.getString(2));
                response.sendRedirect("../JefeArea/index.jsp");
                return;
            }
           if(rs.getString(3).equals("Jefe de Desarrollo")){
                sesion.setAttribute("JefeDesarrollo", rs.getString(2));
                response.sendRedirect("../JefeDesarrollo/index.jsp");
                return;
           }
            if(rs.getString(3).equals("Empleado")){
                sesion.setAttribute("Empleado", rs.getString(2));
                response.sendRedirect("../Tester/index.jsp");
                return;
            }
            if(rs.getString(3).equals("Programador")){
                sesion.setAttribute("Programador", rs.getString(2));
                response.sendRedirect("../Programador/index.jsp"); 
                return;
            }
   
    %>