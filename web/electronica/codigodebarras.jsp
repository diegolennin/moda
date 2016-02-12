
<%@page import="java.util.Calendar"%>
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
        <title>CODIGO DE BARRAS</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


 
    </head>
    <body class="homepage">
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1>CODIGO DE BARRAS</h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->


            <!-- Banner -->
 JPanel panel = new JPanel() {
                        public void paint(Graphics g) {
                                Dimension size = getSize();
                                g.setColor(getBackground());
                                g.fillRect(0, 0, size.width, size.height);
                                g.setColor(getForeground());
                                g.translate(10, 10);
                                barCodeRenderer.render(g, barCode, 1, 80, 12);
                        }
                };
BarcodeEAN codeEAN = new BarcodeEAN();
codeEAN.setCodeType(codeEAN.EAN13);
codeEAN.setCode("9780201615883");
Image imageEAN = codeEAN.createImageWithBarcode(cb, null, null);
                                        
                                        <table onClick="" id="tabla">
                                                            <tbody>
                                                                <tr >
                                                                    <th width="105" class="Estilo4"  scope="col">Cantidad</th>
                                                                    <th width="89" class="Estilo4"  scope="col">Codigo</th>
                                                                    <th width="102" class="Estilo4" scope="col">Producto</th>
                                                                    <th width="99" class="Estilo4" scope="col">P. Unitario</th>
                                                                    <th width="112" class="Estilo4" scope="col">P.Total</th>
                                                                </tr>
                                                            </tbody>
                                                        </table>


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
                        <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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