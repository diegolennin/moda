<%
    String user = (String) session.getAttribute("varUsuario");

    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    }
%>
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
		<title>BUSCAR - - MODIFICAR - ELIMIRAR CLIENTES </title>
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
							<h1><a href="index.html" id="logo">BUSCAR - - MODIFICAR - ELIMIRAR CLIENTES </a></h1>
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
        <!-- Navigacion del menu inicio -->
       
        <!-- Navigacion del menu final -->
       

        <!-- Inicio de informacion -->
       
        <!-- inicio de formulario -->
        <div>
            <div>
                <div >
                    <form  id="mregistrop" name="mregistrop" action="../registros/mregistrop.jsp" method="POST">
                        <div>
                            <select autofocus required class="form-control" name="tdocumento" id="tdocumento">
                                <option value="">Seleccione el tipo de busqueda que requiere</option>
                                <option value="0">DNI</option>
                                <option value="1">Apellidos</option>
                            </select>
                        </div>
                        <div>
                            <input type="text" required class="form-control" id="busqueda" name="busqueda" placeholder="Ingrese lo que desea buscar">
                        </div>

                        <button type="submit" class="btn btn-default btn-green" id="buscar" name="buscar">Buscar Registro</button>
                    </form>
                    <br>
                    <div>


                        <%                            if (request.getParameter("buscar") != null) {
                                conexion con = new conexion();
                                String valor = request.getParameter("tdocumento");
                                String buscar = request.getParameter("busqueda");
                                String consulta = "";
                                if (valor.equals("0")) {
                                    consulta = "select * from personas where dni like'%" + buscar + "%' and tpersona !='A1'";
                                } else if (valor.equals("1")) {
                                    consulta = "select * from personas where apellidos like'%" + buscar + "%' and tpersona !='A1'";
                                }
                                ResultSet rs = con.consulta(consulta);
                                int contador = 0;
                                while (rs.next()) {
                                    contador++;
                                }
                                rs = con.consulta(consulta);
                                if (contador > 0) {
                                    out.print("<table border='2'");
                                    out.print("<tbody>");
                                    out.print(" <tr>");
                                    out.print("<td>DNI </td>");
                                    out.print("<td>Nombres  </td>");
                                    out.print("<td>Apellidos  </td>");
                                    out.print("<td>Estado  </td>");
                                    out.print("<td>Accion  </td>");
                                    out.print("</tr>");
                                    while (rs.next()) {
                                        out.print("<tr>");
                                        out.print("  <td>" + rs.getString("dni") + "</td>");
                                        out.print("  <td>" + rs.getString("nombres") + "</td>");
                                        out.print("  <td>" + rs.getString("apellidos") + "</td>");
                                        out.print("  <td>" + rs.getString("estpersona") + "</td>");
                                        out.print("  <td>&nbsp;<a href=../registros/modregistrop.jsp?id=" + rs.getString("dni") + "><img src=../img/editar.png width=30px height=30px></a>"
                                                + "&nbsp;<a href=../procesos/eregistrop.jsp?id=" + rs.getString("dni") + "><img src=../img/borrar.png width=30px height=30px></a>"
                                                + "&nbsp;<a href=../procesos/aregistrop.jsp?id=" + rs.getString("dni") + "><img src=../img/activar.png width=30px height=30px></a>"
                                                + "&nbsp;<a href=../procesos/elregistrop.jsp?id=" + rs.getString("dni") + "><img src=../img/eliminar.png width=30px height=30px></a></td>");
                                        out.print(" </tr>");
                                    }
                                    out.print("</tbody>");
                                    out.print("</table>");
                                } else {

                                }
                            }
                        %>

                    </div>

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