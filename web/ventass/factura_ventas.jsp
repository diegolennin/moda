
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
        <title>VENTAS</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <script language='JavaScript'>
            var cont = 1;
            var suma = 0.0;

            function addRowX()  //Esta la funcion que agrega las filas :
            {

                cont = form.var_cont.value;
                cont++;
                form.var_cont.value = cont;
                var indiceFila = 1;
                myNewRow = document.getElementById('tabla').insertRow(-1);
                myNewRow.id = indiceFila;
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<td><input type="text" value="0" onChange="javascript:mul(' + cont + ');" size="10" name="cantidad_' + cont + '" /></td>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<td><input type="text" size="10" name="codigo_' + cont + '" onClick="javascript:mypopup1(' + cont + ')" /></td>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" size="10"  name="producto_' + cont + '"/>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" value="0" size="10"  name="preu_' + cont + '"/>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" size="10" name="pret_' + cont + '">';


                //myNewCell.innerHTML='<input type="text" size="8" name="cant" id="cant">';

                //myNewCell = myNewRow.insertCell(-1);
               // myNewCell.innerHTML = '<input type="button" name="b' + cont + '" value=".." onClick="javascript:mul(' + cont + ');" >';
                indiceFila++;
            }
            //////////////Borrar() ///////////
            function borrar() {
                var table = document.getElementById('tabla');
                if (table.rows.length > 1)
                {
                    table.deleteRow(table.rows.length - 1);
                    cont = form.var_cont.value;

                    cont--;
                    form.var_cont.value = cont;
                }
            }

            ////////////FUNCION ASIGNA VALOR DE CONT PARA EL FOR DE MOSTRAR DATOS MP-MOD-TT////////

            function mul(p)
            {

                var c = 0;
                var s = "";
                var t = 0;

                //s=p.toString();
                //alert(s);
                //alert(document.form.code_p.value);
                var contador = document.forms['form'].elements['preu_' + p];
                // alert(contador.value);
                var can = document.forms['form'].elements['cantidad_' + p];

                var t = parseInt(contador.value);
                var t1 = parseInt(can.value);
                var t3 = t * t1;

                suma = suma + t3;
                iva = (suma * 12) / 100;
                des = (suma * 5) / 100;
                tot = (suma + iva) - des;
                document.forms['form'].elements['pret_' + p].value = t3;
                //document.forms['form'].elements['id_' + p].value = document.form.txtIdfactura.value;
                document.forms['form'].elements['txtsubtotal'].value = suma;
                document.forms['form'].elements['txtiva'].value = iva;
                document.forms['form'].elements['txttotal'].value = tot;
                document.forms['form'].elements['var_cont'].value = cont;

            }

            function asigna()
            {
                valor = document.form.var_cont.value = cont;
                document.form.total.value = suma;

            }


            function mypopup()
            {

                mywindow = window.open("busuario.jsp", "mywindow", "location=1,status=1,scrollbars=1,  width=800,height=600");
                mywindow.moveTo(100, 300);

            }

            function mypopup1(c)
            {
                var i = form.txtcedula.value;
                var f = "bproducto.jsp?f=" + c.toString() + "&&id=" + i.toString();
                mywindow = window.open(f, "mywindow", "location=1,status=1,scrollbars=1,  width=800,height=600");
                mywindow.moveTo(100, 300);

            }
        </script>
    </head>
    <body class="homepage">
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <div class="logo container">
                    <div>
                        <h1>VENTAS</h1>
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

            <!-- Banner -->
           

                                <div id="facturacompra">
                                    <form action="factura_ventas.jsp" name="form" method="post" >
                                        <table width="558" border="2" align="center">
                                            <tbody>
                                                <tr>
                                                    <td align="center"><table width="558" border="2" align="center">
                                                            <tbody>
                                                                <tr>
                                                                    <th height="50" colspan="2" align="center" scope="col"><label><br>
                                                                            <br>
                                                                            <span class="Estilo1" style="color: #000000; text-align: center; font-family: Constantia, 'Lucida Bright', 'DejaVu Serif', Georgia, serif;">REGISTRO </span></label></th>
                                                                </tr>
                                                                <tr>
                                                                    <td width="274" align="center" ><span class="Estilo23">
                                                                            <label for="textfield" >C.I - RUC:</label>
                                                                            <input name="txtcedula" type="text" required="required" id="txtcedula" value="">
                                                                        </span></td>
                                                            <span class="Estilo23">
                                                                <input type="button" name="btncliente" id="btncliente" value="Buscar Cliente" onClick="mypopup()">
                                                            </span>
                                                            <td width="259" align="center" ><span class="Estilo23">
                                                                    <label for="textfield"> Nombre : </label>
                                                                    <input name="txtnombre" type="text" required="required" id="txtnombre" value="" size="30">
                                                                </span></td>
                                                </tr>
                                                <%
// Quiero la fecha actual para ponerla por defecto 
                                                Calendar ahora = Calendar.getInstance();
                                                int anyo = ahora.get(Calendar.YEAR);
                                                int mes = ahora.get(Calendar.MONTH) + 1;
                                                int dia = ahora.get(Calendar.DAY_OF_MONTH);
                                                String sAhora = "";
                                                if (mes < 10) {
                                                    sAhora = anyo + "-0" + mes;
                                                } else {
                                                    sAhora = anyo + "-" + mes;
                                                }
                                                if (dia < 10) {
                                                    sAhora += "-0" + dia;
                                                } else {
                                                    sAhora += "-" + dia;
                                                }
                                            %>
                                                <tr>
                                                    <td align="center" ><span class="Estilo23">
                                                            <label for="date4">Fecha Emision:</label>
                                                            <input  name="dtemision" type="date" id="fecha" name="fecha" value="<%=sAhora%>"  >
                                                        </span><span class="Estilo23">
                                                            <label for="date5"></label>
                                                        </span></td>
                                                    <td align="center" ><span class="Estilo23">
                                                            <label for="textfield"> Telefono:</label>
                                                            <input name="txttelefono" type="text" required="required" id="txttelefono" value="" size="32">
                                                        </span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center"><span class="Estilo23">
                                                            <label for="date2"> Dirección:
                                                                <input name="txtdireccion" placeholder="Ingrese la direccion Actual" type="text" id="txtdireccion" value="" size="78">
                                                                <br>
                                                            </label>
                                                        </span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right" ><p class="Estilo4">
                                                            <input type="button" name="btnmas" id="btnmas" value="+" onClick="addRowX()">
                                                            <input type="button" name="btnmenos" id="btnmenos" value="-" onClick="borrar()">
                                                            <input type="button" name="button" id="button" value="Enviar" onClick="calculos()">
                                                            <input name="var_cont" id="var_cont" type="text" value="0" size="1">
                                                        </p>
                                                        <table width="543" border="2"  onClick="" id="tabla">
                                                            <tbody>
                                                                <tr >
                                                                    <th width="105" class="Estilo4" scope="col">Cantida

                                                                        d</th>
                                                                    <th width="89" class="Estilo4" scope="col">Codigo</th>
                                                                    <th width="102" class="Estilo4" scope="col">Producto</th>
                                                                    <th width="99" class="Estilo4" scope="col">P. Unitario</th>
                                                                    <th width="112" class="Estilo4" scope="col">P.Total</th>
                                                                </tr>
                                                            </tbody>
                                                        </table></td>
                                                </tr>



                                                <tr>
                                                    <td colspan="2" align="center" ><span class="Estilo23">
                                                            <label for="date2"> Subtotal a Pagar:
                                                                <input name="txtsubtotal" type="text" id="txtsubtotal" value="" size="78">
                                                                <br>
                                                            </label>
                                                            <label for="date2"> Iva a Pagar:
                                                                <input name="txtiva" type="text" id="txtiva" value="" size="78">
                                                                <br>
                                                            </label>
                                                            <label for="date2"> Total a Pagar:
                                                                <input name="txttotal" type="text" id="txttotal" value="" size="78">
                                                                <br>
                                                            </label>
                                                            <label for="date2"> Observaciones finales de la venta:
                                                                <input name="txtobservacion" type="text" id="txtobservacion" value="" size="78">
                                                                <br>
                                                            </label>
                                                        </span>

                                                        <input name="btnenviar"  type="submit" value="Guardar" id="btnenviar" /></td>
                                                </tr>




                                            </tbody>
                                        </table></td>
                                        </tr>
                                        </tbody>
                                        </table>
                                    </form>
                                    <%
                                        if (request.getParameter("btnenviar") != null) {
                                            int pase = Integer.parseInt(request.getParameter("var_cont"));
                                            if (pase > 0) {
                                                conexion con = new conexion();
                                                String comprador = request.getParameter("txtcedula");
                                                String fecha = request.getParameter("dtemision");
                                                String total = request.getParameter("txttotal");
                                                String subtotal = request.getParameter("txtsubtotal");
                                                String iva = request.getParameter("txtiva");
                                                String detalle = request.getParameter("txtobservacion");
                                                con.consulta("INSERT INTO ventas( idcomprador, idvendedor, frealizada, total, iva, detalle, subtotal ) VALUES ('" + comprador + "', 'Temporal', '" + fecha + "', " + total + ", " + iva + ", '" + detalle + "', " + subtotal + ");");
                                                for (int i = 1; i <= pase; i++) {
                                                    String codigo = request.getParameter("codigo_" + i);
                                                    String cantidad = request.getParameter("cantidad_" + i);
                                                    String precu = request.getParameter("preu_" + i);
                                                    String prect = request.getParameter("pret_" + i);
                                                    con.consulta("INSERT INTO detalleventa(             idcodigo, idproducto, canproducto, preunitario, pretotal)    VALUES ( (select idcodigo from compras order by idcodigo desc limit 1), '" + codigo + "', " + cantidad + ", " + precu + ", " + prect + ");");
                                                    con.consulta("UPDATE productos   SET actual=actual-" + cantidad + " WHERE idproducto='" + codigo + "';");
                                                     con.consulta("INSERT INTO inventario(  salida, vunitarios, idproducto,disponibles, vunitariod)    VALUES (" + cantidad + ", " + precu + ", '" + codigo + "',(select disponibles from inventario where idproducto='" + codigo + "' order by idinventario desc limit 1)-(" + cantidad + "),  " + precu + ");");
                                                }
                                               
                                            }
                                        }
                                    %>


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