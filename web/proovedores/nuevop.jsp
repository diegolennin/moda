<%@page import="clases.MailSender"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<%
    String nom = "", apel = "", foto = "", id = "";
    conexion con = new conexion();
    ResultSet rs;
    String user = (String) session.getAttribute("varUsuario");
    String niv = (String) session.getAttribute("nivel");
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        if (!niv.equals("A1")) {
            out.println("<script>No puede ingresar a este panel administrativo</script>");
            out.println("<script language='javascript'>window.location='../administracion/logina.jsp'</script>;");
        } else {
            rs = con.consulta("select * from personas where correo='" + user + "'");
            while (rs.next()) {
                nom = rs.getString("nombres");
               apel = rs.getString("apellidos");
                foto = rs.getString("fotpersona");
            }
        }
    }
%>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>NUEVO PROVEEDOR</title>
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
				<section id="main-content">
                <section class="wrapper">
                    <h1><i class="fa fa-angle-right"></i>Intrucciones de activacion de cuenta</h1>
                    <br> <br><br> <%
                       
                        String dni = request.getParameter("dni");
                        String nombre = request.getParameter("nombres");
                        String apellido = request.getParameter("apellidos");
                        String correo = request.getParameter("correo");
                        String telefono = request.getParameter("telefono");
                        String celular = request.getParameter("celular");
                        String direccion = request.getParameter("direccion");
                        String tpersona = "P1";
                        rs = con.consulta("select p.dni,p.correo,p.estpersona from personas p where dni='" + dni + "' or correo='" + correo + "'");
                        String dn = "";
                        String cor = "";
                        String est = "";
                        while (rs.next()) {
                            dn = rs.getString("dni");
                            cor = rs.getString("correo");
                            est = rs.getString("estpersona");
                        }

                    %><br><br><br>
                    <%if (dn.equals(dni)) {
                    %>
                     <h4>Alerta Encontrada?</h4>
                    <p>El Dni ingresado ya se encuentra registrado en la base de datos</p>

                    <%
                    } else if (cor.equals(correo)) {
                    %>
                     <h4>Alerta Encontrada?</h4>
                    <p>El correo electronico ingresado ya se encuentra registrado en la base de datos</p>

                    <%
                    } else if (est.equals("t")) {
                    %>
                    <h4>Alerta Encontrada?</h4>
                    <p>Este usuario esta desativado temporalmente contacte la institucion</p>

                    <%
                    } else {
                    %>
                     <h4>Se ha enviado un mensaje de confirmacion a su correo?</h4>
                    <p>con este mensaje usted activara su cuenta asi permitiendose a acceder a los servicios del la intitucion.</p>

                    <%
                            con.consulta("INSERT INTO proveedores(dni, tdocumento, nombres, apellidos, correo, telefono, celular,direccion, tpersona)VALUES ('" + dni + "', 'true', '" + nombre + "', '" + apellido + "', '" + correo + "', '" + telefono + "', '" + celular + "','" + direccion + "', 'true', '" + tpersona + "');");
                            con.consulta("CREATE USER \"" + correo + "\" PASSWORD 'administrador';");
                            MailSender ms = new MailSender();
                            ms.mensaje("http://localhost:8080/moda/procesos/cambiocon.jsp?id=" + dni + "");
                            ms.para(correo);
                            ms.SendMail();

                        }
                    %>

                </section>
            </section>

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