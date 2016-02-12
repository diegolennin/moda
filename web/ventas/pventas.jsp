<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../alertas/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../alertas/sweetalert.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@page import="clases.conexion"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
    </head>
    <body>

        <%conexion con = new conexion();
            int pase = Integer.parseInt(request.getParameter("var_cont"));
            if (pase > 0) {
                Date fecha=new Date();
                String comprador = request.getParameter("txtcedula");
                String total = request.getParameter("txttotal");
                String subtotal = request.getParameter("txtsubtotal");
                String iva = request.getParameter("txtiva");
                String detalle = request.getParameter("txtobservacion");
                con.consulta("INSERT INTO ventas( idcomprador, idvendedor, frealizada, total, iva, detalle, subtotal ) VALUES ('" + comprador + "', '" + comprador + "', '" + fecha + "', " + total + ", " + iva + ", '" + detalle + "', " + subtotal + ");");
                for (int i = 1; i <= pase; i++) {
                    String codigo = request.getParameter("codigo_" + i);
                    String cantidad = request.getParameter("cantidad_" + i);
                    String precu = request.getParameter("preu_" + i);
                    String prect = request.getParameter("pret_" + i);
                    con.consulta("INSERT INTO detalleventa(             idcodigo, idproducto, canproducto, preunitario, pretotal)    VALUES ( (select idcodigo from ventas order by idcodigo desc limit 1), '" + codigo + "', " + cantidad + ", " + precu + ", " + prect + ");");
                    con.consulta("UPDATE productos   SET actual=actual-" + cantidad + " WHERE idproducto='" + codigo + "';");
                    con.consulta("INSERT INTO inventario(  salida, vunitarios, idproducto,disponibles, vunitariod)    VALUES (" + cantidad + ", " + precu + ", '" + codigo + "',(select disponibles from inventario where idproducto='" + codigo + "' order by idinventario desc limit 1)-(" + cantidad + "),  " + precu + ");");
                }
                out.println("<script language='javascript'>window.location='../reportes/efactura.jsp?id=" + comprador + "'</script>;");
           
            } else {
        %>   
        <script>
            sweetAlert("Oops...", "Su Factura se encuentra vacia", "error");
            setTimeout(window.history.back(), 5000);

        </script>
        <%
            }%>



    </body>
</html>
