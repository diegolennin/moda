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
                        <h1><a href="../index.jsp" id="logo">MODIFICAR PRODUCTO</a></h1>
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

                            <%
                                String id = request.getParameter("id");
                                String consulta = "select p.*,pr.*,c.*,t.* from productos p,proveedor pr,categorias c,tallas t where c.idcategoria=p.catproducto and t.idtalla=p.talproducto and p.proproducto=pr.ruc and idproducto='" + id + "'";
                                conexion con = new conexion();
                                ResultSet rs = con.consulta(consulta);
                                while (rs.next()) {
                                    out.print("<form  id='registro' name='registro' action='' method='POST'>");
                                    out.print("<div class='form-group'>");
                                    out.print("    <input type='text' disabled='disabled'  value='" + rs.getString("idproducto") + "' required class='form-control' id='codigo' name='codigo' placeholder='Ingresa aqui el codigo del nuevo Producto' onkeydown='return numeros(event)' onchange='evaluar(registro)'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input type='text'  value='" + rs.getString("nomproducto") + "' required class='form-control' id='nombre' name='nombre' placeholder='Ingrese el Nombre o Descripcion del Producto'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print(" <select autofocus required class='form-control' name='categoria' id='categoria'>");
                                    out.print("   <option value='" + rs.getString("idcategoria") + "'>" + rs.getString("nomcategoria") + "</option>");
                                    ResultSet rs1 = con.consulta("select * from categorias where estcategoria='true'");
                                    while (rs1.next()) {
                                        out.print("<option value='" + rs1.getString("idcategoria") + "'>" + rs1.getString("nomcategoria") + "</option>");
                                    }
                                    out.print(" </select>");
                                    out.print(" </div>");
                                    out.print("<div class='form-group'>");
                                    out.print("    <input type='text'  value='" + rs.getString("maximo") + "'  required class='form-control' id='maximo' name='maximo' placeholder='Ingrese  cantidad maxima'>");
                                    out.print("</div>");
                                    out.print("<div class='form-group'>");
                                    out.print("    <input type='text' required  value='" + rs.getString("minimo") + "'  class='form-control' id='minimo' name='minimo' placeholder='Ingrese cantidad minima'>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print(" <select autofocus required class='form-control' name='talla' id='talla'>");
                                    out.print("   <option value='" + rs.getString("idtalla") + "'>" + rs.getString("nomtalla") + "</option>");
                                    ResultSet rs2 = con.consulta("select * from tallas where esttalla='true'");
                                    while (rs2.next()) {
                                        out.print("<option value='" + rs2.getString("idtalla") + "'>" + rs2.getString("nomtalla") + "</option>");

                                    }
                                    out.print(" </select>");
                                    out.print(" </div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input name='precio' type='text' value='" + rs.getString("precio") + "'  class='form-control' id='precio' placeholder='Ingrese el precio del Producto' onkeydown='return numeros(event)' maxlength='15'>");
                                    out.print("</div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <select autofocus required class='form-control' name='provedor' id='provedor'>");
                                    out.print("   <option value='" + rs.getString("ruc") + "'>" + rs.getString("nombres") + "</option>");
                                    ResultSet rs3 = con.consulta("select * from proveedor where estpersona='true'");
                                    while (rs3.next()) {
                                        out.print("<option value='" + rs3.getString("ruc") + "'>" + rs3.getString("nombres") + "</option>");

                                    }
                                    out.print(" </select>");
                                    out.print("</div>");
                                    out.print("<div class='form-group'>");
                                    out.print("   <input type='text' required  value='" + rs.getString("detalle") + "' class='form-control' id='detalle' name='detalle' placeholder='Detalle o Novedad del nuevo Producto'>");
                                    out.print("</div>");
                                    out.print(" <div class='form-group'>");
                                    out.print("    <input type='file' required class='form-control'  value='" + rs.getString("imagen") + "'  id='imagen' name='imagen' placeholder='Ingresa la Foto'>");
                                    out.print("</div>");
                                    out.print("<button type='submit' class='btn btn-default btn-green' id='enviar' name='enviar'>Registrar</button>");
                                    out.print("</form>");
                                }
                            %>
                            <%
                                if (request.getParameter("enviar") != null) {
                                    String nombre = request.getParameter("nombre");
                                    String categoria = request.getParameter("categoria");
                                    String maximo = request.getParameter("maximo");
                                    String minimo = request.getParameter("minimo");
                                    String talla = request.getParameter("talla");
                                    String precio = request.getParameter("precio");
                                    String proveedor = request.getParameter("provedor");
                                    String detalle = request.getParameter("detalle");
                                    String imagen = request.getParameter("imagen");
                                    con.consulta("UPDATE productos   SET  nomproducto='"+nombre+"', catproducto='"+categoria+"', maximo="+maximo+", minimo="+minimo+",        talproducto='"+talla+"', precio="+precio+", proproducto='"+proveedor+"', detalle='"+detalle+"', imagen='"+imagen+"' WHERE idproducto='"+id+"';");
                                    out.print("Se ha Actualizado el registro");
                                    out.println("<script language='javascript'>window.location='listapro.jsp'</script>;");
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