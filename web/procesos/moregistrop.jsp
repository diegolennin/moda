<%@page import="clases.conexion"%>
<%
    String nivel = (String) session.getAttribute("nivel");
    conexion con = new conexion();
    String id=request.getParameter("id");
    String nombre = request.getParameter("nombres");
    String apellido = request.getParameter("apellidos");
    String telefono = request.getParameter("telefono");
    String celular = request.getParameter("celular");
    String direccion = request.getParameter("direccion");
    con.consulta("UPDATE personas SET nombres='"+nombre+"', apellidos='"+apellido+"', telefono='"+telefono+"',celular='"+celular+"', direccion='"+direccion+"' WHERE dni='"+id+"';");
    if (nivel.equals("A1")) {
            out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");

        } else if (nivel.equals("E1")) {
            out.println("<script language='javascript'>window.location='../administracione/panele.jsp'</script>;");

        } else if (nivel.equals("P1")) {
            out.println("<script language='javascript'>window.location='../administracionp/panelp.jsp'</script>;");
        }
%>