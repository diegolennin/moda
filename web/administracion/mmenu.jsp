<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%
    conexion con = new conexion();
    ResultSet rs = null;
    String nom = "", apel = "", foto = "";
    String id = request.getParameter("id");

%>
<html>
    <head>
        <title>ADMINISTRACION</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>

    <body class="homepage">
        <div id="page-wrapper">

            <!-- Header -->
            <!--

<header id="header">
    <div class="logo container">
            <div>
                    <h1><a href="index.html" id="logo">UNIMODA</a></h1>
            </div>
    </div>
</header>

            <!-- Nav -->








            <!-- Nav -->

            <nav id="nav">
                <ul>
                    <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>
                    <span class="hidden-xs"> usuario : <% out.print(nom + " " + apel);%></span>
                    <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                </ul>
            </nav>
            <!-- Banner -->


            <!-- acceso -->  
            <br>
            <br>
            <br>


            <div class="container content">
                <div class="row"></div>
            </div>

            <!-- acceso --> 




            <!-- Main -->

            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="row 200%">
                        <div class="12u">

                            <!-- Highlight -->
                            <!--inicio de contenido-->
         <section id="main-content">
                <section class="wrapper">
                    <br>
                    <center><h4><i class="fa fa-refresh"></i>Modificando Registro</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <%rs = con.consulta("select * from menup where idmenu='" + id + "'");
                                    while (rs.next()) {
                                %>

                                <form  id="mmenu" name="mmenu" action="" method="POST">
                                    <div class="form-group">
                                        <input type="text" disabled="true" class="form-control" value="<%out.print(rs.getString("idmenu"));%>" id="codigomen" name="codigomen" placeholder="Ingrese el codigo unico del menu principal">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" value="<%out.print(rs.getString("nombre"));%>" id="nombremen" name="nombremen" placeholder="Ingrese el nombre del menu principal">
                                    </div>
                                    <div class="form-group">
                                        <input type="text"  class="form-control" value="<%out.print(rs.getString("referencia"));%>" id="referencia" name="referencia" placeholder="Ingrese la url de referencia al menú">
                                    </div>
                                    <div class="form-group">
                                        <input name="clasemen" type="text" value="<%out.print(rs.getString("clase"));%>" class="form-control" id="clasemen" placeholder="Ingrese codigo de clase para generar un icono html5">
                                    </div>
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="relacion" id="relacion">

                                            <%if (rs.getString("relacion").equals("0")) {
                                                    out.print("<option value='0'>Menu Principal</option>");
                                                } else {
                                                    ResultSet rs1 = con.consulta("select * from menup where idmenu='" + rs.getString("relacion") + "'");
                                                    while (rs1.next()) {
                                                        out.print("<option value='" + rs1.getString("idmenu") + "'>" + rs1.getString("nombre") + "</option>");
                                                    }
                                                }
                                            %>
                                            <option value="0">Menu Principal</option>
                                            <%
                                                ResultSet rs1 = con.consulta("select * from menup where estado='true' and relacion='0'");
                                                while (rs1.next()) {
                                                    out.print("<option value='" + rs1.getString("idmenu") + "'>" + rs1.getString("nombre") + "</option>");
                                                }
                                            %>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="visible" id="visible">
                                            <%if (rs.getString("visible").equals("t")) {
                                            %><option value="true">Pagina siempre visible</option><%
                                            } else {
                                            %><option value="false">Pagina siempre oculta</option><%
                                                }
                                            %>
                                            <option value="true">Pagina siempre visible</option>
                                            <option value="false">Pagina siempre oculta</option>
                                        </select>
                                    </div>  
                                    <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Actualizar Registro</button>
                                </form>
                                <%}%>
                                <%
                                    if (request.getParameter("enviar") != null) {
                                        String codigo = request.getParameter("codigomen");
                                        String nombre = request.getParameter("nombremen");
                                        String referencia = request.getParameter("referencia");
                                        String relacion = request.getParameter("relacion");
                                        String visible = request.getParameter("visible");
                                        if (referencia.equals("")) {
                                            referencia = "javascript:;";
                                        }
                                        String clase = request.getParameter("clasemen");
                                        if (clase.equals("")) {
                                            clase = "fa fa-bars";
                                        }
                                        int contador = 0;
                                        rs = con.consulta("select count(*) from menup where idmenu='" + codigo + "'");
                                        while (rs.next()) {
                                            contador = rs.getInt("count");
                                        }
                                        if (contador == 0) {
                                            con.consulta("UPDATE menup SET clase='" + clase + "', referencia='" + referencia + "', nombre='" + nombre + "', relacion='" + relacion + "', visible='" + visible + "' WHERE idmenu='" + id + "';");
                                            out.print("<script>alert('Registro Actualizado');</script>");
                                            out.println("<script language='javascript'>window.location='../administracion/listarmen.jsp'</script>;");
                                        } else {
                                            out.print("<script>alert('Codigo ya registrado');</script>");
                                        }

                                    }


                                %>
                            </div>
                        </div>  
                    </div>     
                </section>
            </section>

        </section>

                        </div>


                        <!-- Highlight -->



                    </div>
                </div>
                </section>

            </div>
        </div>
        <div class="row 200%"></div>
    </div>
</div>

<!-- Footer -->
<footer id="footer" class="container">
    <div class="row 200%"></div>

    <!-- Copyright -->
    <div id="copyright">
        <ul class="menu">
            PANEL DE ADMINISTRACION 
            <li></li>
            <li>UNIMODA<a href="http://html5up.net"></a></li>
        </ul>
    </div>

</footer>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/skel-viewport.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>



