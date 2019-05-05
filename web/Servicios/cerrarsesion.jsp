<%
    HttpSession sesion = request.getSession();
    
    session.invalidate();
    

    Cookie[] array= request.getCookies(); 
    for(int i=0; i<array.length; i++)
    {
            //Deleting the cookie
            array[i].setMaxAge(0);
            response.addCookie(array[i]); //After this, although cookie will be not be visible from browser's memory
                                          //but Cookie data will still be visible until you refresh this page.
    }
    
    response.sendRedirect("../index.jsp?Error=Sesion Finalizada");
    return;
%>