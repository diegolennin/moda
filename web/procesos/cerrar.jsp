<%
    session.invalidate();
    out.println("<script>alert('cerrando sesion')</script>");
    response.sendRedirect("../index.jsp");
    //response.sendRedirect("../index.jsp");
%>

