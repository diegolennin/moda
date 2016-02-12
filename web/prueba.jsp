<%@page import="clases.MailSender"%>
<%
    MailSender ms = new MailSender();
    ms.mensaje("http://localhost:8080/moda/procesos/cambiocon.jsp?id=");
    ms.para("santi4862@gmail.com");
    ms.SendMail();
%>
