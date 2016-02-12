<%@page import="clases.conexion"%>
<%
    String nivel = (String) session.getAttribute("nivel");
    conexion con = new conexion();
    String id = request.getParameter("id");
    String id1 = request.getParameter("ni");
    String nombre = request.getParameter("nombres");
    String apellido = request.getParameter("apellidos");
    String telefono = request.getParameter("telefono");
    String celular = request.getParameter("celular");
    String tipo = request.getParameter("perfil");
    String direccion = request.getParameter("direccion");con.consulta("UPDATE personas SET nombres='" + nombre + "', apellidos='" + apellido + "', telefono='" + telefono + "',celular='" + celular + "', direccion='" + direccion + "', tpersona='" + tipo + "' WHERE dni='" + id + "';");
    response.sendRedirect("../administracion/listar.jsp?id=" + id1 + "");
%>