<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>

<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
    <head>
        <title>KARDEX</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="./../assets/css/main.css" />
        <script language="javascript">
            function mypopup()
            {

                mywindow = window.open("bproducto.jsp", "mywindow", "location=1,status=1,scrollbars=1,  width=800,height=600");
                mywindow.moveTo(100, 300);

            }
        </script>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="../index.jsp" id="logo">KARDEX</a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>

                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar sesion</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="col-md-9">
                        <div>
                            <form action="inventario.jsp" name="mproducto" method="post">
                                <p>&nbsp;</p>
                                <table align="center" border="5" cellpadding="5">
                                    <tr  valign="baseline" >
                                        <td align="left" nowrap="nowrap">Buscar por Codigo:
                                            <input name="txtbuscar" type="text" value="" size="10" onClick="mypopup()"/> 
                                            Fecha Inicial:
                                            <%
// Quiero la fecha actual para ponerla por defecto 
                                                Calendar ahora = Calendar.getInstance();
                                                int anyo = ahora.get(Calendar.YEAR);
                                                int mes = ahora.get(Calendar.MONTH) + 1;
                                                int dia = ahora.get(Calendar.DAY_OF_MONTH);
                                                String sAhora = "";
                                                if (mes < 10) {
                                                    sAhora = anyo + "-0" + mes;
                                                } else {
                                                    sAhora = anyo + "-" + mes;
                                                }
                                                if (dia < 10) {
                                                    sAhora += "-0" + dia;
                                                } else {
                                                    sAhora += "-" + dia;
                                                }
                                            %>
                                            <input name="txtfechai" type="date" id="fecha" name="fecha" value="<%=sAhora%>" >
                                            Hasta:
                                            <input name="txtfechaf" type="date" id="fecha" name="fecha" value="<%=sAhora%>" >
                                            Mostrar Registros 
                                            <select name="limite">
                                                <option value="10">1 hasta 10</option>
                                                <option value="50">1 hasta 50</option>
                                                <option value="all">Todo</option>
                                            </select>
                                            <input name="btnfiltrar"  type="submit" value="Filtrar" />
                                            <input name="btntodo"  type="submit" value="Mostar Todo" />                                       </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            <%
                                conexion con = new conexion();
                                ResultSet rs = con.consulta("select * from inventario");
                                ResultSet rs1 = con.consulta("select * from inventario");
                                String buscar = request.getParameter("txtbuscar");
                                String fechai = request.getParameter("txtfechai");
                                String fechal = request.getParameter("txtfechaf");
                                String limite = request.getParameter("limite");
                                String idpro = "";

                                if (request.getParameter("btnfiltrar") != null) {
                                    rs = con.consulta("select * from inventario where idproducto ::text like '%" + buscar + "%' and (fecha>='" + fechai + "' and fecha<='" + fechal + "') limit '" + limite + "';");
                                    rs1 = con.consulta("select sum(entrada)as a,sum(vunitarioe)as  b, sum(vtotale)as c, sum(salida)as d,sum(vunitarios)as e, sum(vtotals)as f, sum(disponibles)as g,sum(vunitariod)as h, sum(vtotald)as i from inventario where idproducto ::text like '%" + buscar + "%' and (fecha>='" + fechai + "' and fecha<='" + fechal + "') limit '" + limite + "';");
                                    out.print("<form name='mproducto' method='post' action='mproducto.php' enctype='multipart/form-data'>");
                                    out.print("<table width='100%' border='1' cellpadding='2' cellspacing='2' align='center' class='btn-danger'>");
                                    out.print("<tr bgcolor ='white'>");
                                    out.print("<td> Producto </td>");
                                    out.print("<th>Fecha</th>");
                                    out.print("<th>Cant.Entrada</th>");
                                    out.print("<th>V.Unitario</th>");
                                    out.print("<th>V.total</th>");
                                    out.print("<th>Cant.Salida</th>");
                                    out.print("<th>V.Unitario</th>");
                                    out.print("<th>V.total</th>");
                                    out.print("<th>Cant.Disponible</th>");
                                    out.print("<th>V.Unitario</th>");
                                    out.print("<th>V.total</th ><tr>");

                                    while (rs.next()) {
                                        out.print("<tr class='campo2' >");
                                        out.print(" <td > " + rs.getString("idproducto") + " </td>");
                                        idpro = rs.getString("idproducto");
                                        out.print("<td>" + rs.getString("fecha") + "</td>");
                                        out.print("<td>" + rs.getString("vunitarioe") + "</td>");
                                        out.print("<td>" + rs.getString("vunitarioe") + "</td>");
                                        out.print("<td>" + rs.getString("vtotale") + "</td>");
                                        out.print("<td>" + rs.getString("salida") + "</td>");
                                        out.print("<td>" + rs.getString("vunitarios") + "</td>");
                                        out.print("<td>" + rs.getString("vtotals") + "</td>");
                                        out.print("<td>" + rs.getString("disponibles") + "</td>");
                                        out.print("<td>" + rs.getString("vunitariod") + "</td>");
                                        out.print("<td>" + rs.getString("vtotald") + "</td></tr>");
                                    }
                                    while (rs1.next()) {
                                        out.print("<tr bgcolor='White'>");
                                        out.print(" <td > " + idpro + " </td >");
                                        out.print("<td>Sumas totales</td>");
                                        out.print("<td>" + rs1.getString("a") + "</td>");
                                        out.print("<td>" + rs1.getString("b") + "</td>");
                                        out.print("<td>" + rs1.getString("c") + "</td>");
                                        out.print("<td>" + rs1.getString("d") + "</td>");
                                        out.print("<td>" + rs1.getString("e") + "</td>");
                                        out.print("<td>" + rs1.getString("f") + "</td>");
                                        out.print("<td>" + rs1.getString("g") + "</td>");
                                        out.print("<td>" + rs1.getString("h") + "</td>");
                                        out.print("<td>" + rs1.getString("i") + "</td></tr>");

                                    }
                                    out.print("</table></form>");

                                }
                                if (request.getParameter("btntodo") != null) {
                                    rs = con.consulta("select * from inventario order by idproducto asc limit all");
                                    rs1 = con.consulta("select sum(entrada)as a,sum(vunitarioe)as  b, sum(vtotale)as c, sum(salida)as d,sum(vunitarios)as e, sum(vtotals)as f, sum(disponibles)as g,sum(vunitariod)as h, sum(vtotald)as i from inventario limit all");
                                    out.print("<form name='mproducto' method='post' action='mproducto.php' enctype='multipart/form-data'>");
                                    out.print("<table width='100%' border='1' cellpadding='2' cellspacing='2' align='center' class='btn-danger'>");
                                    out.print("<tr bgcolor ='#88DD9E'>");
                                    out.print("<td align='center'>Producto</td>");
                                    out.print("<td align='center'>Fecha</td>");
                                    out.print("<td align='center'>Cant.Entrada</td>");
                                    out.print("<td align='center'>V.Unitario</td>");
                                    out.print("<td align='center'>V.total</td>");
                                    out.print("<td align='center'>Cant.Salida</td>");
                                    out.print("<td align='center'>V.Unitario</td>");
                                    out.print("<td align='center'>V.total</td>");
                                    out.print("<td align='center'>Cant.Disponible</td>");
                                    out.print("<td align='center'>V.Unitario</td>");
                                    out.print("<td align='center'>V.total</td > <tr>");

                                    while (rs.next()) {
                                        out.print("<tr class='campo2' >");
                                        out.print(" <td bgcolor ='#B9FBC9' align='center'> " + rs.getString("idproducto") + " </td>");
                                        idpro = rs.getString("idproducto");
                                        out.print("<td align='right'>" + rs.getString("fecha") + "</td>");
                                        out.print("<td bgcolor ='#B9FBC9' align='right'>" + rs.getString("vunitarioe") + "</td>");
                                        out.print("<td align='right'>" + rs.getString("vunitarioe") + "</td>");
                                        out.print("<td bgcolor ='#B9FBC9'align='right'>" + rs.getString("vtotale") + "</td>");
                                        out.print("<td align='right'>" + rs.getString("salida") + "</td>");
                                        out.print("<td bgcolor ='#B9FBC9'align='right'>" + rs.getString("vunitarios") + "</td>");
                                        out.print("<td align='right'>" + rs.getString("vtotals") + "</td>");
                                        out.print("<td bgcolor ='#B9FBC9'align='right'>" + rs.getString("disponibles") + "</td>");
                                        out.print("<td align='right'>" + rs.getString("vunitariod") + "</td>");
                                        out.print("<td bgcolor ='#B9FBC9'align='right'>" + rs.getString("vtotald") + "</td></tr>");
                                    }
                                    /*while (rs1.next()) {
                                        out.print("<tr bgcolor='White'>");
                                        out.print(" <td > " + idpro + " </td>");
                                        out.print("<td>Sumas totales</td>");
                                        out.print("<td>" + rs1.getString("a") + "</td>");
                                        out.print("<td>" + rs1.getString("b") + "</td>");
                                        out.print("<td>" + rs1.getString("c") + "</td>");
                                        out.print("<td>" + rs1.getString("d") + "</td>");
                                        out.print("<td>" + rs1.getString("e") + "</td>");
                                        out.print("<td>" + rs1.getString("f") + "</td>");
                                        out.print("<td>" + rs1.getString("g") + "</td>");
                                        out.print("<td>" + rs1.getString("h") + "</td>");
                                        out.print("<td>" + rs1.getString("i") + "</td></tr>");

                                    }*/
                                    out.print("</table></form>");
                                }

                            %>
                            < </div>
                    </div

                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer id="footer" class="container">
            <div class="row 200%">
                <div class="12u">

                    <!-- Contact -->
                    <section>
                        <h2 class="major"><span>Contactenos</span></h2>
                        <ul class="contact">
                            <li><a class="icon fa-facebook" href="#"><span class="label">Facebook</span></a></li>
                            <li><a class="icon fa-twitter" href="#"><span class="label">Twitter</span></a></li>
                            <li><a class="icon fa-instagram" href="#"><span class="label">Instagram</span></a></li>
                            <li><a class="icon fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
                            <li><a class="icon fa-google-plus" href="#"><span class="label">Google+</span></a></li>
                        </ul>
                    </section>

                </div>
            </div>

            <!-- Copyright -->
            <div id="copyright">
                <ul class="menu">
                    <li>&copy; Untitled. Uniandes</li><li>Design: <a href="http://html5up.net">Diego Chamorro - Daniel Ruano</a></li>
                </ul>
            </div>

        </footer>



        <!-- Scripts -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery.dropotron.min.js"></script>
        <script src="../assets/js/skel.min.js"></script>
        <script src="../assets/js/skel-viewport.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="../assets/js/main.js"></script>

    </body>
</html>