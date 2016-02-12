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
        <title>FACTURA ELECTRÓNICA</title>
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
                myNewCell.innerHTML = '<td><input type="text" onkeydown="return numeros(event)" value="0"  size="10"  name="cantidad_' + cont + '"onChange="comprobar(' + cont + ');mul('+cont+');" /></td>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<td><input type="text" size="10" name="codigo_' + cont + '" onClick="javascript:mypopup1(' + cont + ')" /></td>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" size="10"  name="producto_' + cont + '"/>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" value="0" size="10"  name="preu_' + cont + '"/>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="text" size="10" name="pret_' + cont + '">';


                //myNewCell.innerHTML='<input type="text" size="8" name="cant" id="cant">';

             //   myNewCell = myNewRow.insertCell(-1);
              //  myNewCell.innerHTML = '<input type="button" name="b' + cont + '" value=".." onClick="javascript:mul(' + cont + ');" >';
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
                var i=1;
                if (c > 1) {
                    var t = document.forms['form'].elements['codigo_' + (c-1)];
                    i = t.value;
                } 
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
                        <h1>FACTURA ELECTRÓNICA</h1>
                    </div>
                </div>
            </header>

            <!-- Nav -->


            <!-- Banner -->


            <div id="facturaelectronica">
                <table width="100%"  align="center">
                    <tbody>
                        <tr>
                            <td>
                                <label  for="date2"> IMAGEN:
                                    <br>
                                    <img id="Image2" src="../images/logo.png" style="height:200px;width:300px;border-width:0px;left: 72px; position: static; top: 336px">
                                    <br>
                                </label>
                                <div id="uno">
                                   
                                    
                                    <label for="date2"> EDISON JAIME SALASAR ORTIZ:
                                        <br>
                                        <input name="txtiva" type="text" id="txtiva" value="" >
                                        <br>
                                    </label>
                                    <label for="date2"> DIRECCION MATRIZ:
                                        <br>
                                        <input name="txttotal" type="text" id="txttotal" value="" >
                                        <br>
                                    </label>
                                    <label for="date2"> DIRECCION SUCURSAL:
                                        <br>
                                        <input name="txttotal" type="text" id="txttotal" value="" >
                                        <br>
                                    </label>
                                    <label for="date2"> CONTRIBUYENTE ESPECIAL NUMERO:
                                        <br>
                                        <input name="txttotal" type="text" id="txttotal" value="" >
                                        <br>
                                    </label>

                                    <label for="date2"> OBLIGADO A LLEVAR CONTABILIDAD:
                                        <input name="txtobservacion" type="text" id="txtobservacion" value="" >
                                        <br>
                                    </label>
                                    <br>
                                   
                                </div>
                            </td>
                            <td>
                    
                                <div id="dos">
                                    
                                    
                                    <label for="date2"> RUC:
                                        <br>
                                        <input name="txtsubtotal" type="text" id="txtsubtotal" value="" >
                                        <br>
                                    </label>
                                    <label for="date2"><h2> FACTURA</h2>

                                        <input name="txtiva" type="text" id="txtiva" value="" >
                                        <br>
                                    </label>
                                    <label for="date2"> NUMERO DE AUTORIZACION:
                                        <br>
                                        <input name="txttotal" type="text" id="txttotal" value="" >
                                        <br>
                                    </label>
                                    
                                    <label for="date2"> FECHA Y HORA DE AUTORIZACION:
                                        <input name="txtobservacion" type="text" id="txtobservacion" value="" >
                                        <br>
                                    </label>
                                   
                                    <label for="date2"> AMBIENTE:
                                        <br>
                                        <input name="txtobservacion" type="text" id="txtobservacion" value="" >
                                        <br>
                                    </label>
                                    
                                    <label for="date2"> EMISION:
                                        <br>
                                        <input name="txtobservacion" type="text" id="txtobservacion" value="" >
                                        <br>
                                    </label>
                                    <%
                                        String codigop = "231020140117921078650011001";
                                    %>
                                    <label for="date2"> CLAVE DE ACCESO:
                                        <br>
                                        <center> 
                                            <img src='http://barcode.tec-it.com/barcode.ashx?data=<%out.print(codigop);%>&code=Code128&dpi=72' alt='Barcode Generator TEC-IT'/>
                                        </center> 
                                        <br>
                                    </label>
                                    <br>
                                   
                                    </td>
                                   
                                </div>
                        </tr>
                </table>

                <div id="dos">
                   
                    <table>
                        <tr>
                            <td> 
                                <label for="date2"> RAZON SOCIAL/NOMBRE:
                                    <br>
                                    <input name="txtsubtotal" type="text" id="txtsubtotal" value="" >
                                    <br>
                                </label>
                                <label for="date2"> FECHA DE EMISION:
                                   <br>
                                    <input name="txtiva" type="text" id="txtiva" value="" >
                                    <br>
                                </label>
                            </td> 
                            <td>
                                <label for="date2"> RUC:
                                    <br>
                                    <input name="txtsubtotal" type="text" id="txtsubtotal" value="" >
                                    <br>
                                </label>
                                <label for="date2"> GIA DE REMISION:
                                    <br>
                                    <input name="txtiva" type="text" id="txtiva" value="" >
                                    <br>
                                </label>
                            </td>
                        </tr> 
                    </table>
                        
                </div>
                                        
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