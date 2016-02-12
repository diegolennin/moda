
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <title>Documento sin título</title>
</head>

<body>

    <div id="general"> 
    
    <form action="factura_ventas.jsp" name="form" method="post" >
                                        <table width="558" border="2" align="center">
                                            <tbody>
                                                <tr>
                                                    <td align="center" bgcolor="#ECDFDF"><table width="558" border="2" align="center">
                                                            <tbody>
                                                                <tr>
                                                                    <th height="50" colspan="2" align="center" scope="col"><label><br>
                                                                            <br>
                                                                            <span class="Estilo1" style="color: #000000; text-align: center; font-family: Constantia, 'Lucida Bright', 'DejaVu Serif', Georgia, serif;">REGISTRO </span></label></th>
                                                                </tr>
                                                                <tr>
                                                                    <td width="274" align="center" bgcolor="#ECDFDF"><span class="Estilo23">
                                                                            <label for="textfield" >C.I - RUC:</label>
                                                                            <input name="txtcedula" type="text" required="required" id="txtcedula" value="">
                                                                        </span></td>
                                                            <span class="Estilo23">
                                                                <input type="button" name="btncliente" id="btncliente" value="Buscar Cliente" onClick="mypopup()">
                                                            </span>
                                                            <td width="259" align="center" bgcolor="#ECDFDF"><span class="Estilo23">
                                                                    <label for="textfield"> Nombre : </label>
                                                                    <input name="txtnombre" type="text" required="required" id="txtnombre" value="" size="30">
                                                                </span></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" bgcolor="#ECDFDF"><span class="Estilo23">
                                                            <label for="date4">Fecha Emision:</label>
                                                            <input name="dtemision" type="date" required="required" id="dtemision" autocomplete="on" >
                                                        </span><span class="Estilo23">
                                                            <label for="date5"></label>
                                                        </span></td>
                                                    <td align="center" bgcolor="#ECDFDF"><span class="Estilo23">
                                                            <label for="textfield"> Telefono:</label>
                                                            <input name="txttelefono" type="text" required="required" id="txttelefono" value="" size="32">
                                                        </span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center" bgcolor="#ECDFDF"><span class="Estilo23">
                                                            <label for="date2"> Dirección:
                                                                <input name="txtdireccion" placeholder="Ingrese la direccion Actual" type="text" id="txtdireccion" value="" size="78">
                                                                <br>
                                                            </label>
                                                        </span></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right" bgcolor="#ECDFDF"><p class="Estilo4">
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
                                                    <td colspan="2" align="center" bgcolor="#ECDFDF"><span class="Estilo23">
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
    	
      	
    
    </div>  

</body>
</html>