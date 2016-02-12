<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
        TXT by HTML5 UP
        html5up.net | @n33co
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%
    String ids = request.getParameter("id");
    String f = request.getParameter("f");

%>
<html>
    <head>
        <title>NUEVO PROVEEDOR</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="./../assets/css/main.css" />
        <script language='JavaScript'>
            function enviar(fi, codigo, nombre, precio) {
                opener.document.forms['form'].elements['cantidad_'+fi].value = 0;
                opener.document.forms['form'].elements['codigo_'+fi].value = codigo;
                opener.document.forms['form'].elements['producto_'+fi].value = nombre;
                opener.document.forms['form'].elements['preu_'+fi].value = precio;

                self.close();
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
                        <h1><a href="../index.jsp" id="logo">NUEVO PRODUCTO </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                     <li><a href="../admin/admin.jsp" class="hidden-xs">Administracion</a></li>
                   
                   <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                     </ul>
            </nav>

            <!-- Main -->
            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="col-md-9">
                        <div>
                            <form  id="registro" name="registro" action="bproducto.jsp?f=<%out.print(f);%>&&id=<%out.print(ids);%>" method="POST">
                                <div class="form-group">
                                    <select autofocus required class="form-control" name="tipo" id="tipo">
                                        <option value="">Selecione el tipo de busqueda</option>
                                        <option value="0">codigo</option>
                                        <option value="1">nombre</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" required class="form-control" id="busqueda" name="busqueda" placeholder="Ingrese lo deseado" onkeydown="return evaluar(event)" onchange="evaluar(registro)">
                                </div>

                                <div class="form-group">

                                </div> <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Buscar</button>
                            </form>
                            <%                                if (request.getParameter("enviar") != null) {
                                    String dni = request.getParameter("tipo");
                                    String buscar = request.getParameter("busqueda");
                                    String consulta = "";
                                    if (dni.equals("0")) {
                                        consulta = "select p.*,pr.*,c.*,t.* from productos p,proveedor pr,categorias c,tallas t where c.idcategoria=p.catproducto and t.idtalla=p.talproducto and p.proproducto=pr.ruc  and  idproducto like '%" + buscar + "%'";
                                    } else {
                                        consulta = "select p.*,pr.*,c.*,t.* from productos p,proveedor pr,categorias c,tallas t where c.idcategoria=p.catproducto and t.idtalla=p.talproducto and p.proproducto=pr.ruc  and nomproducto like '%" + buscar + "%'";

                                    }
                                    conexion con = new conexion();
                                    ResultSet rs = con.consulta(consulta);
                                    out.print("<table  border='1'>");
                                    out.print("  <tbody>");
                                    out.print("  <tr>");
                                    out.print("    <th><i class='fa fa-bullhorn'></i> Codigo</th>");
                                    out.print("    <th class='hidden-phone'><i class='fa fa-question-circle'></i> Producto</th>");
                                    out.print("   <th><i class='fa fa-bookmark'></i> Categoria</th>");
                                    out.print("</tr>");
                                    ;
                                    while (rs.next()) {
                                        out.print("   <tr onclick=enviar('"+f+"','" + rs.getString("idproducto") + "','" + rs.getString("nomproducto") + "','" + rs.getString("precio") + "')>");
                                        out.print("  <td>" + rs.getString("idproducto") + "</td>");
                                        out.print("    <td>" + rs.getString("nomproducto") + "</td>");
                                        out.print("  <td>" + rs.getString("catproducto") + "</td>");
                                        out.print(" </tr>");
                                    }
                                    out.print("  </tbody>");
                                    out.print(" </table>");

                                }
                            %>
                        </div>
                    </div>

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