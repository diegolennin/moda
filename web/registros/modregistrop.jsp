<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!doctype html>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>EDITAR CLIENTES</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<h1><a href="index.html" id="logo">EDITAR CLIENTES </a></h1>
						</div>
					</div>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="../index.jsp">INICIO</a></li>
						<li><a href="../nosotros.html">NOSOTROS</a></li>
						<li><a href="../contactos.html">CONTACTOS</a></li>
						<li><a href="../sujerencias.html">SUGERENCIAS</a></li>
						<li><a href="">REGISTRO</a>
                        <ul>
								<li><a href="../administracion/logina.jsp">Iniciar Sesión</a></li>
								<li><a href="../registros/rnuevop.html">Nuevo Cliente</a></li>
								<li><a href="#">Nuevo Administrador</a></li>
						  </ul>
                        
                        
                        
                        </li>
					</ul>
				</nav>

        <!-- Inicio de informacion -->
        
        <!-- fin de informacion -->
        <br>
        <br>
        <!-- inicio de formulario -->
        <div class="container content">
            <div class="row">
                <div class="col-md-9">
                    <%
                        String id = request.getParameter("id");
                        conexion con = new conexion();
                        ResultSet rs = con.consulta("select * from personas where dni='" + id + "'");
                        while (rs.next()) {
                            out.print("<form  id='registro' name='registro' action='../procesos/moregistrop.jsp?id="+rs.getString("dni")+"' method='POST'>");
                             out.print(" <div class='form-group'>");
                            out.print("    <input type='text' disabled  class='form-control' id='dni' name='dni' placeholder='Ingrese su DNI' value='" + rs.getString("dni") + "'>");
                            out.print("   </div>");
                            out.print(" <div class='form-group'>");
                            out.print("    <input type='text' required class='form-control' id='nombres' name='nombres' placeholder='Ingrese sus nombres' value='" + rs.getString("nombres") + "'>");
                            out.print("   </div>");
                            out.print("   <div class='form-group'>");
                            out.print("      <input type='text' required class='form-control' id='apellidos' name='apellidos' placeholder='Ingrese sus apellidos' value='" + rs.getString("apellidos") + "'>");
                            out.print("   </div>");
                            out.print("  <div class='form-group'>");
                            out.print("      <input type='email' class='form-control' id='correo' name='correo' placeholder='Ingrese su correo electronico' onchange='validare(registro);' value='" + rs.getString("correo") + "'>");
                            out.print("   </div>");
                            out.print("   <div class='form-group'>");
                            out.print("      <input name='telefono' type='text' class='form-control' id='telefono' placeholder='Ingrese su  numero de telefono' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("telefono") + "'>");
                            out.print(" </div>");
                            out.print("  <div class='form-group'>");
                            out.print("<input name='celular' type='text' class='form-control' id='celular' placeholder='Ingrese su numero de celular' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("celular") + "'>");
                            out.print("</div>");
                            out.print("  <div class='form-group'>");
                            out.print(" <input type='text' required class='form-control' id='direccion' name='direccion' placeholder='Ingrese su direccion donde vive actualmente' value='" + rs.getString("direccion") + "'>");
                            out.print("</div>");
                            out.print("  <button type='submit' class='btn btn-default btn-green'>Actualizar Registro</button>");
                            out.print(" </form>");
                        }
                    %>
                </div>

            </div>
        </div>
        <br>
        <br>
        <!-- fin del formulario -->

        <!-- Pie de pagina inicio -->
        
        <!-- termina pie de pagina -->



        <!-- Javascript plugins -->
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