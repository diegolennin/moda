<%@page import="clases.conexion"%>
<%
        String id = request.getParameter("id");
        conexion con = new conexion();
        con.consulta("delete from proveedor WHERE ruc='" + id + "';");
        out.print("Se ha Actualizado el registro");
        out.println("<script language='javascript'>window.location='listapro.jsp'</script>;");
    
%>
