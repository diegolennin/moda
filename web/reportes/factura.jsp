<%-- 
    Document   : factura
    Created on : 29-dic-2015, 16:40:58
    Author     : User
--%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URL"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.util.JRLoader"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*Importamos la clase "Conexion_Postgresql" y la instanciamos por el nombre conexion
             con la siguiente linea de codigo*/
            conexion con = new conexion();
            JasperReport jasperReport;
            JasperPrint jasperPrint;
            con.conectar();
            /*Establecemos la ruta del reporte*/
            File reportFile = new File(application.getRealPath("reportes/factura.jasper"));
            /*Enviamos parámetros porque nuestro reporte los necesita asi que escriba 
             y seguiremos el formato del método runReportToPdf*/
            /*Con Map y el HaspMap nos servira para crear los paramentros*/
            Map parameters = new HashMap();
            /*Capturamos el valor de nuestra formulario que es el codigo del cliente que es un
             varchar(5), lo almacenamos en una String*/
            String idcliente = "1003601240";
            int idfactura = 13;
            /*Digitamos la siguiente linea de codigo entre parentesis ira el parametro que agregamos en nuestro reporte
             llamado $P{CODIGO}, pero solo se escribira "CODIGO", el String que capturamos lo colocamos, en este caso el 
             reporte solo nos pide un parametro*/
            parameters.put("cliente", idcliente);
            parameters.put("factura", idfactura);
            /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, con.getconexion());
            JasperPrint reporte = JasperFillManager.fillReport("D:\\Users\\User\\Desktop\\UNIANDES\\7MO\\PROGRAMACION WEB\\PRIMERA PARCIAL\\moda\\web\\reportes\\factura.jasper", parameters, con.getconexion());
            JasperExportManager.exportReportToPdfFile(reporte, "C:\\reportes\\FACTURA.pdf");
            /*Indicamos que la respuesta va a ser en formato PDF*/
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream ouputStream = response.getOutputStream();
            ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/ ouputStream.flush();
            ouputStream.close();

            con.desconectar();
        %>
    </body>
</html>
