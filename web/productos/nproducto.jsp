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
        <title>NUEVO PRODUCTO</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="./../assets/css/main.css" />
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

                <div style="float: right;">
                    <!-- inicio de ayuda -->

                    <a aling="left" class="dropdown-toggle" href="../reportes/ayuda.jsp?id=/pdf/nuev-producto1.pdf">
                        <i aling="left" class="fa fa-question fa-3x"></i>
                    </a>

                    <!-- fin de ayuda -->
                </div>
            </nav>
            <a href="javascript:window.history.back();">&laquo; Volver atrás </a>
            &nbsp;
            &nbsp;
            <a href="../admin/admin.jsp">&laquo; Inicio </a>
            <!-- Main -->
            <div id="main-wrapper">
                <div id="main" class="container">
                    <div class="col-md-9">
                        <form  id="registro" name="registro" action="nproducto.jsp" method="POST">

                            <div class="form-group">
                                <input type="text" required class="form-control" id="codigo" name="codigo" placeholder="Ingresa aqui el codigo del nuevo Producto" title="Ingresa aqui el codigo del nuevo Producto" onkeydown="return numeros(event)" onchange="evaluar(registro)">
                            </div>
                            <div class="form-group">
                                <input type="text" required class="form-control" id="nombre" name="nombre" placeholder="Ingrese el Nombre o Descripcion del Producto" title="Ingrese el Nombre o Descripcion del Producto" >
                            </div>
                            <div class="form-group">
                                <select autofocus required class="form-control" name="categoria" title="categoria" id="categoria">
                                    <option value="">Selecione categoria</option>
                                    <%
                                        conexion con = new conexion();
                                        ResultSet rs = con.consulta("select * from categorias where estcategoria='true'");
                                        while (rs.next()) {
                                            out.print("<option value='" + rs.getString("idcategoria") + "'>" + rs.getString("nomcategoria") + "</option>");

                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" required class="form-control" id="maximo" name="maximo" placeholder="Ingrese  cantidad maxima" title="Ingrese  cantidad maxima">
                            </div>
                            <div class="form-group">
                                <input type="text" required class="form-control" id="minimo" name="minimo" placeholder="Ingrese cantidad minima" title="Ingrese cantidad minima">
                            </div>
                            <div class="form-group">
                                <select autofocus required class="form-control" name="talla" id="talla" title="talla">
                                    <option value="">Selecione la talla</option>
                                    <%
                                        rs = con.consulta("select * from tallas where esttalla='true'");
                                        while (rs.next()) {
                                            out.print("<option value='" + rs.getString("idtalla") + "'>" + rs.getString("nomtalla") + "</option>");

                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="precio" type="text" class="form-control" id="precio" placeholder="Ingrese el precio del Producto" title="Ingrese el precio del Producto" onkeydown="return numeros(event)" maxlength="15">
                            </div>
                            <div class="form-group">
                                <select autofocus required class="form-control" name="provedor" id="provedor" title="provedor">
                                    <option value="">Selecione el Proveedor</option>
                                    <%
                                        rs = con.consulta("select * from proveedor where estpersona='true'");
                                        while (rs.next()) {
                                            out.print("<option value='" + rs.getString("ruc") + "'>" + rs.getString("nombres") + "</option>");

                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" required class="form-control" id="detalle" name="detalle" placeholder="Detalle o Novedad del nuevo Producto" title="Detalle o Novedad del nuevo Producto">
                            </div>

                            <div class="form-group">
                                <input type="file" required class="form-control" id="imagen" name="imagen" placeholder="Ingresa la Foto" title="Ingresa la Foto">
                            </div>


                            <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Registrar</button>
                        </form>
                        <%
                            if (request.getParameter("enviar") != null) {
                                rs = con.consulta("select * from parametros where idparametro=1");
                                int gan = 0;
                                while (rs.next()) {
                                    gan = rs.getInt("ganancia");
                                }

                                String codigo = request.getParameter("codigo");
                                String nombre = request.getParameter("nombre");
                                String categoria = request.getParameter("categoria");
                                String maximo = request.getParameter("maximo");
                                String minimo = request.getParameter("minimo");
                                String talla = request.getParameter("talla");
                                String precio = request.getParameter("precio");
                                String proveedor = request.getParameter("provedor");
                                String detalle = request.getParameter("detalle");
                                String imagen = request.getParameter("imagen");
                                double can = ((Double.parseDouble(precio) * gan) / 100) + Double.parseDouble(precio);
                                con.consulta("INSERT INTO productos(            idproducto, nomproducto, catproducto, maximo, minimo, talproducto,             precio, proproducto, detalle, imagen , prod_venta)    VALUES ('" + codigo + "','" + nombre + "', '" + categoria + "', " + maximo + ", " + minimo + ",'" + talla + "',             " + precio + ", '" + proveedor + "', '" + detalle + "', '" + imagen + "',"+can+");");
                                con.consulta("INSERT INTO inventario( idproducto) VALUES ('" + codigo + "');");
                                out.print("Registro guardado");
                            }
                        %>
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