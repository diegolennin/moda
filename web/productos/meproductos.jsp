<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String niv = (String) session.getAttribute("nivel");
    String user = (String) session.getAttribute("varUsuario");

    conexion con = new conexion();
    ResultSet rs = con.consulta("select * from personas where correo='" + user + "'");
    String nom = "", apel = "", foto = "";
    while (rs.next()) {
        nom = rs.getString("nombres");
        apel = rs.getString("apellidos");
        foto = rs.getString("fotpersona");
    }
%>
<html>
	<head>
		<title>MODIFICAR PRODUCTO</title>
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
                    <span class="hidden-xs"> usuario : <% out.print(nom + " " + apel);%></span>
                   <li><a href="../procesos/cerrar.jsp" class="hidden-xs">cerrar secion</a></li>
                     </ul>
            </nav>

			<!-- Main -->
				<div id="main-wrapper">
					<div id="main" class="container">
					<%
                                    rs = con.consulta("select * from productos where idproducto='001'");
                                    while (rs.next()) {
                                        out.print(" <form  id='registro' name='registro' action='../productos/nuevop.jsp' method='POST'>");

                                        out.print(" <div class='form-group'>");
                                        out.print("    <input type='text' required class='form-control' id='codigo' disabled name='codigo' placeholder='Ingrese el Codigo de Producto' onkeydown='return numeros(event)' value='" + rs.getString("idproducto") + "' onchange='evaluar(registro)'>");
                                        out.print("    </div>");
                                        out.print(" <div class='form-group'>");
                                        out.print("       <input type='text' required class='form-control' id='nombre' name='nombre' value='" + rs.getString("nomproducto") + "' placeholder='Ingrese el Nombre o Descripcion del Producto'>");
                                        out.print("   </div>");
                                        out.print("    <div class='form-group'>");
                                        out.print("        <select autofocus required class='form-control' name='categoria' id='categoria'>");
                                        if (rs.getString("idvariedad").equals("L")) {
                                            out.print("     <option value='L'>L</option>");

                                        } else if (rs.getString("idvariedad").equals("S")) {
                                            out.print("     <option value='S'>S</option>");

                                        } else if (rs.getString("idvariedad").equals("M")) {
                                            out.print("     <option value='M'>M</option>");

                                        }
                                        out.print(" <option value='S'>S</option>");
                                        out.print("    <option value='M'>M</option>");
                                        out.print("  <option value='L'>L</option>");
                                        out.print("  </select>");
                                        out.print("  </div>");
                                        out.print("  <div class='form-group'>");
                                        
                                        out.print("      <input type='text' required class='form-control' id='maximo' name='maximo' value='" + rs.getString("canmaxima") + "' placeholder='Ingrese la cantidad Maxima'>");
                                        out.print("  </div>");
                                        out.print(" <div class='form-group'>");
                                        out.print("    <input type='text' class='form-control' id='minimo' name='minimo' value='" + rs.getString("canminima") + "' placeholder='Ingrese la Cantidad Minima' onchange='validare(registro);'>");
                                        out.print("  </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("     <input name='actual' type='text' class='form-control' id='actual'value='" + rs.getString("canactual") + "' placeholder='Ingrese la Cantidad Actual' onkeydown='return numeros(event)' maxlength='15'>");
                                        out.print("  </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("     <input name='precio' type='text' class='form-control' id='precio'value='" + rs.getString("preactual") + "' placeholder='Ingrese el precio' onkeydown='return numeros(event)' maxlength='15'>");
                                        out.print("  </div>");
                                        out.print("   <div class='form-group'>");
                                        out.print("      <input type='text' required class='form-control' id='color' name='color'value='" + rs.getString("colproducto") + "' placeholder='Ingrese el Color'>");
                                        out.print("  </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("     <input type='text' required class='form-control' id='descuento' name='descuento'value='" + rs.getString("desproducto") + "' placeholder='Ingrese el Descuento'>");
                                        out.print(" </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("    <input type='text' required class='form-control' id='detalle' name='detalle'value='" + rs.getString("detproducto") + "' placeholder='Detalle nuevo Producto'>");
                                        out.print("  </div>");

                                        out.print("  <button type='submit' class='btn btn-default btn-green'>Actualizar</button>");
                                        out.print(" </form>");
                                    }
                                %>

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