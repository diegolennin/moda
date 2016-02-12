<%@page import="clases.conexion"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Unimoda</title>
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
							<h1><a href="index.html" id="logo">UNIMODA </a></h1>
						</div>
					</div>
				</header>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="index.html">INICIO</a></li>
						<li><a href="#">NOSOTROS</a></li>
						<li><a href="registros/rnuevop.html">CONTACTOS</a></li>
						<li><a href="right-sidebar.html">CATALOGO</a></li>
						<li><a href="no-sidebar.html">REGISTRO</a>
                        <ul>
								<li><a href="#">Iniciar Sesión</a></li>
								<li><a href="#">Nuevo Cliente</a></li>
								<li><a href="#">Nuevo Administrador</a></li>
						  </ul>
                        
                        
                        
                        </li>
					</ul>
				</nav>
        <!-- Navigacion del menu inicio -->
       
        <!-- Navigacion del menu final -->

       

        <!-- inicio de Services -->
         <header id="header">
                <div class="logo container">
                    <div>
                        <section class="box highlight">
                             <h1><a href="index.html" id="logo">SE ACTIVO CU CUENTA CORRECTAMENTE</a></h1>
                             <%
                                 conexion con=new conexion();
                                 String id= request.getParameter("id");
                                 con.consulta("update personas set estactivo=true where dni='"+id+"'");
                                                                %>  
                                 
                             <br>
                             <br>
                             <br>
			<ul class="special">
                            <li><a href="../administracion/logina.jsp" title="Ingresar a su Cuenta" class="icon fa fa-envelope-o"><span class="label">Tablet</span></a></li>
                        
                        </ul>
                            </section>
                         
                    </div>
                </div>
            </header>
        
        
     

        <!--fin de Servicios -->

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