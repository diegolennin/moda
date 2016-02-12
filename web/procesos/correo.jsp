<%@page import="clases.MailSender"%>
<%
    MailSender ms = new MailSender();
    ms.SendMail();
%>