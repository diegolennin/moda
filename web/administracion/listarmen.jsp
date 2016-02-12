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
    String nom = "", apel = "", foto = "", id = "", pri = "", idno = "";//variables de usuario
    String empresa = "";//variable de empresa
    String user = (String) session.getAttribute("varUsuario");//variable que contiene la sesion activa
    String url = request.getRequestURI();//varible que extrae url de pagina
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        //DATOS DEL USUARIO
        rs = con.consulta("select * from personas where correo='" + user + "'");
        while (rs.next()) {
            pri = rs.getString("tpersona");
            idno = rs.getString("dni");
            nom = rs.getString("nombres");
            apel = rs.getString("apellidos");
            foto = rs.getString("fotpersona");
        }

    }
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
            <center>
            <div id="main-wrapper">
                   

                <div id="main" class="container">
                    <div class="row 500%">
                        <a href="javascript:window.history.back();">&laquo; Volver atrás </a>
  &nbsp;
  &nbsp;
    <a href="../admin/admin.jsp">&laquo; Inicio </a>
                        <div class12u>

                            <!-- Highlight -->
                            <!--inicio de contenido-->
           <section >
               
                <section class="wrapper">
                    
                    <br>
                    <center><h4><i class="fa fa-plus"></i>Crear un Nuevo Registro</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <center>
                            <div class="form-panel">
                                <form  id="listarmen" name="listarmen" action="listarmen.jsp" method="POST">
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="codigomen" name="codigomen" placeholder="Ingrese el codigo unico del menu principal">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="nombremen" name="nombremen" placeholder="Ingrese el nombre del menu principal">
                                    </div>
                                    <div class="form-group">
                                        <input name="referencia" type="text"  class="form-control" id="referencia" placeholder="Ingrese la url de referencia al menú">
                                    </div>
                                    <div class="form-group">
                                        <input name="clasemen" type="text"  class="form-control" id="clasemen" placeholder="Ingrese codigo de clase para generar un icono html5">
                                    </div>
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="relacion" id="relacion">
                                            <option value="0">Menu Principal</option>
                                            <%rs = con.consulta("select * from menup where estado='true' and relacion='0'");
                                                while (rs.next()) {
                                                    out.print("<option value='" + rs.getString("idmenu") + "'>" + rs.getString("nombre") + "</option>");
                                                }
                                            %>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="visible" id="visible">
                                            <option value="true">Pagina siempre visible</option>
                                            <option value="false">Pagina siempre oculta</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Guardar Registro</button>
                                </form>
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
                                            con.consulta("INSERT INTO menup(idmenu,nombre,referencia,clase,relacion,visible)VALUES ('" + codigo + "','" + nombre + "', '" + referencia + "', '" + clase + "', '" + relacion + "', '" + visible + "');");
                                            out.print("<script>alert('Registro Guardado');</script>");
                                        } else {
                                            out.print("<script>alert('Codigo ya registrado');</script>");
                                        }

                                    }


                                %>
                                <br> 
                                <center> <h4><i class='fa fa-list'></i> Listado de registros </h4></center>
                                <br>

                                <form  id="listamen" name="listarmen" action="listarmen.jsp" method="POST">
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="tbuscar" id="tbuscar">
                                            <option value="0">Busqueda por código</option>
                                            <option value="1">Busqueda por nombre</option>
                                            <option value="2">Mostrar solo menus principal</option>
                                            <option value="3">Mostrar solo submenus</option>
                                            <option value="4">Mostrar submenus de menu principal</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Ingrese lo que desea buscar">
                                    </div>

                                    <button type="submit" class="btn btn-default btn-green" id="buscar" name="buscar">Buscar Registro</button>
                                </form>
                                <br>
                                <div>

                                    <%                                        String consulta = "select * from menup order by idmenu desc";

                                        if (request.getParameter("buscar") != null) {
                                            String valor = request.getParameter("tbuscar");
                                            String buscar = request.getParameter("busqueda");
                                            if (valor.equals("0")) {
                                                consulta = "select * from menup where idmenu like'%" + buscar + "%' order by idmenu desc";
                                            } else if (valor.equals("1")) {
                                                consulta = "select * from menup where idmenu like'%" + buscar + "%' order by idmenu desc";
                                            } else if (valor.equals("2")) {
                                                consulta = "select * from menup where relacion='0' order by idmenu desc";
                                            } else if (valor.equals("3")) {
                                                consulta = "select * from menup where relacion!='0' order by idmenu desc";
                                            } else if (valor.equals("4")) {
                                                consulta = "select * from menup where relacion like'%" + buscar + "%' order by idmenu desc";
                                            }
                                        }
                                        rs = con.consulta(consulta);
                                        out.print("<table class='table table-striped table-advance table-hover'>");
                                        out.print("  <hr>");
                                        out.print(" <thead>");
                                        out.print("  <tr>");
                                        out.print("    <th class='hidden-phone'><i class='fa fa-barcode'></i> Codigo</th>");
                                        out.print("    <th><i class='fa fa-list-alt'></i> Nombre</th>");
                                        out.print("    <th><i class='fa fa-list'></i>Dependen</th>");
                                        out.print(" <th><i class='fa fa-check-square-o'></i> Estado</th>");
                                        out.print("    <th><i class='fa fa-cog'></i>Acciones</th>");
                                        out.print("</tr>");
                                        out.print(" </thead>");
                                        out.print("  <tbody>");
                                        while (rs.next()) {
                                            out.print("   <tr>");
                                            out.print("  <td class='hidden-phone'>" + rs.getString("idmenu") + "</td>");
                                            out.print("    <td>" + rs.getString("nombre") + "</td>");
                                            if (rs.getString("relacion").equals("0")) {
                                                out.print("   <td>Principal</span></td>");

                                            } else {
                                                out.print("   <td>" + rs.getString("relacion") + "</span></td>");

                                            }
                                            if (rs.getString("estado").equals("t")) {
                                                out.print("   <td><span class='label label-info label-mini'>Activo</span></td>");

                                            } else {
                                                out.print("   <td><span class='label label-info label-mini'>Desactivado</span></td>");

                                            }
                                            out.print("    <td>");
                                            out.print("  <a href = '../administracion/mmenu.jsp?id=" + rs.getString("idmenu") + "' <button class='btn btn-primary btn-xs'><i class='fa fa-pencil'></i></button> </a>");
                                            out.print("  <a href = '../procesos/amenu.jsp?id=" + rs.getString("idmenu") + "' <button class='btn btn-success btn-xs'><i class='fa fa-play'></i></button></a>");
                                            out.print("   <a href = '../procesos/dmenu.jsp?id=" + rs.getString("idmenu") + "' <button class='btn btn-warning btn-xs'><i class='fa fa-stop'></i></button></a>");
                                            out.print("   <a href = '../procesos/emenu.jsp?id=" + rs.getString("idmenu") + "' <button class='btn btn-danger btn-xs'><i class='fa fa-eraser'></i></button></a>");
                                            out.print("   </td>");
                                            out.print(" </tr>");
                                        }
                                        out.print("  </tbody>");
                                        out.print(" </table>");
                                    %>

                                </div>
                            </div>
                                    </center>
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
                                    </center>
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
