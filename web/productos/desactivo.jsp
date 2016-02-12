<%@page import="clases.conexion"%>
<%
        String id = request.getParameter("id");
        conexion con = new conexion();
        con.consulta("UPDATE productos   SET  estproducto='false' WHERE idproducto='" + id + "';");
        out.print("Se ha Actualizado el registro");
        out.println("<script language='javascript'>window.location='listapro.jsp'</script>;");
    
%>
