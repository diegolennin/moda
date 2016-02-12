<%@page import="clases.MailSender"%>
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
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1><a href="index.jsp" id="logo">UNIMODA </a></h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li ><a href="index.jsp">Inicio</a></li>
                    <li><a href="misionvision.html">Mision-Vision</a></li>
                    <li><a href="contactos.html">Contactos</a></li>
                    <li><a href="servicios.html">Servicios</a></li>
                    <li class="current"><a href="sugerencias.jsp">Sugerencias</a></li>
                    <li><a href="nosotros.html">Nosotros</a></li>

                </ul>
            </nav>
            <!-- Main -->
            <div >
                <div id="main" class="container">
                    <div class="row" id="content">
                        <div class="col-md-12">
                            <h2>Si tiene sugerencias por favor escribalas aqui.!!�</h2>
                        </div>
                    </div>
                    <div class="col-md-9">
                    <form role="form" id="contact_form" name="contacto" action="sugerencias.jsp" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" id="InputName" placeholder="Ingrese sus Nombre" name="nombre" required="">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="InputEmail" placeholder="Ingrese su Correo" name="correo" required="">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="Message" placeholder="Ingrese su Mensaje" rows="8" name="mensaje" required=""></textarea>
                        </div>
                        <button type="submit" class="btn btn-default btn-green" name="enviar">Enviar Mensaje</button>
                    </form>
                    <%
                        if (request.getParameter("enviar") != null) {
                            String nombre = request.getParameter("nombre");
                            String correomsm = request.getParameter("correo");
                            String mensaje = request.getParameter("mensaje");
                            MailSender sms = new MailSender();
                            sms.asunto("Contacto de Informacion de: " + nombre);
                            sms.para("unimodaibarra@gmail.com");
                            sms.mensaje("Usuario: " + nombre + " \n Mensaje: " + mensaje + " \n Correo de Usuario: " + correomsm);
                            sms.SendMail();
                        }
                    %>
                </div>
                        <p>INGRESE SU NÚMERO DE CELULAR Y TAMBIEN SU CORREO ELETRÓNICO PARA PODERNOS CONTACTARNOS CON USTED
                        </p>
                        <p>Para poder enviar sus sugerencias siga los siguientes pasos:
                        </p>
                        <p>1.- Primeramente llene todos los campos Nombre, Apellido, Mensaje. El campo teléfono es opcional (este campo es para podernos comunicarnos con usted)
                        </p>
                        <p>2.- Despúes haga un click en el Cuadro donde dice "No soy un robot". Espere un momento hasta que aparezca un visto de color verde.
                        </p>
                        <p>3.- Seguidamente de click en el Botón ¡Enviar Mensaje!. </p>
                        <p>4.- Finalmente cuando el mensaje fue enviado correctamente le aprarecerá otra ventana donde aparece todos los datos enviados y con un mensaje que dice: "EL MENSAJE A SIDO ENVIADO CON ÉXITO"
                            Nota: Si le aparece un cuadro donde aparecen letras y números por favor digite las letras o números y luego de click en el Botón ¡Enviar Mensaje!
                        </p>



                        <!-- Footer -->
                        <footer id="footer" class="container">
                            <div class="row 200%">
                                <div class="12u">

                                    <!-- Contact -->
                                    <section>
                                        <h2 class="major"><span>Contactenos</span></h2>
                                        <ul class="contact">
                                            <li><a class="icon fa-facebook" href="https://www.facebook.com/unimoda.catalogo/"><span class="label">Facebook</span></a></li>
                                            <li><a class="icon fa-twitter" href="https://twitter.com/UNIMODACATALOGO"><span class="label">Twitter</span></a></li>
                                            <li><a class="icon fa-instagram" href="https://www.instagram.com/unimodasc/"><span class="label">Instagram</span></a></li>
                                            <li><a class="icon fa-dribbble" href="https://es.pinterest.com/matrizatuntaqui/"><span class="label">Dribbble</span></a></li>
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