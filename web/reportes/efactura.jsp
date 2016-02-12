<%@page import="java.sql.ResultSet"%>
<%@page import="clases.MailSender"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
    ResultSet rs = null;
    String nom = "", apel = "", correo = "";//variables de usuario
    rs = con.consulta("select * from proveedor where ruc='" + id + "'");
    while (rs.next()) {
        nom = rs.getString("nombres");
        apel = rs.getString("apellidos");
        correo = rs.getString("correo");
    }
%>
<%
    con.conectar();
    File archivo = new File(application.getRealPath("pdf/factura.jasper"));
    Map parameters = new HashMap();
    String rutapdf = archivo.getParent() + "/factura_" + id + ".pdf";
    String rutaxml = archivo.getParent() + "/factura_" + id + ".xml";
    parameters.put("cliente", id);
    byte[] bytes = JasperRunManager.runReportToPdf(archivo.getPath(), parameters, con.conexionget());
    JasperPrint reporte = JasperFillManager.fillReport(archivo.getPath(), parameters, con.conexionget());
    JasperExportManager.exportReportToPdfFile(reporte, rutapdf);
    JasperExportManager.exportReportToXmlFile(reporte, rutaxml, false);
    MailSender ms = new MailSender();
    ms.para(correo);
    ms.asunto("Has recibido una Factura Electrónica");
    ms.enviarpdfxml(rutapdf, "Factura.pdf", rutaxml, "Factura.xml", "Estimado(a): " + nom + " " + apel + " ha recibido un documento que certifica el pago de su servicio obtenido");
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
    ouputStream.close();
    con.desconectar();
%>
