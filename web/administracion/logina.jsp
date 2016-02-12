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
		<title>INICIO SESIóN</title>
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
							<h1><a href="index.html" id="logo">INICIO SESIóN </a></h1>
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
                                    
                                    <div style="float: right;">
                    <!-- inicio de ayuda -->

                    <a aling="left" class="dropdown-toggle" href="../reportes/ayuda.jsp?id=/pdf/inicio-de-sesion.pdf">
                        <i aling="left" class="fa fa-question fa-3x"></i>
                    </a>

                    <!-- fin de ayuda -->
                </div> 
				</nav>
      
        <!-- inicio de formulario -->
        <br>
        <center>
         <br>
        Inicia Sesión para poder utilizar nuestros servicios..!!
        <br>
        Ingresa tu Correo Electronico 
        <br>
        Y tu contraseña...!!
         <br>
         </center>
          <br>
        <div>
            
            <div class="container content">
                <div id="prelog">
                    <form  id="logina" name="logina" action="../procesos/logina.jsp" method="POST">
                        <div class="form-group">
                            <input type="text" required class="form-control" id="usuario" name="usuario" placeholder="Ingrese DNI de documento">
                        </div>
                        <div class="form-group">
                            <input type="password" required class="form-control" id="clave" name="clave" placeholder="Ingrese su clave de autorizacion">
                        </div>

                        <button type="submit" class="btn btn-default btn-green" id="buscar" name="buscar">Acceder al sistema</button>
                    </form>
                    <br>
                    <div class="form-group">


                        

                    </div>

                </div>

            </div>
        </div>
        <br>
        <br>
        <!-- fin del formulario -->
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