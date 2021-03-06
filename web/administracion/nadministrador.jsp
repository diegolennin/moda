<%
    String nom = "", apel = "", foto = "", id = "";
    conexion con = new conexion();
    ResultSet rs;
    String user = (String) session.getAttribute("varUsuario");
    String niv = (String) session.getAttribute("nivel");
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        if (!niv.equals("A1")) {
            out.println("<script>No puede ingresar a este panel administrativo</script>");
            out.println("<script language='javascript'>window.location='../administracion/logina.jsp'</script>;");
        } else {
            rs = con.consulta("select * from personas where correo='" + user + "'");
            while (rs.next()) {
                nom = rs.getString("nombres");
                nom = rs.getString("apellidos");
                foto = rs.getString("fotpersona");
            }
        }
    }
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <script type="text/javascript" src="../js/validar.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Nuevo Administrador</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.5 -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect.
        -->
        <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
    -->
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">

                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>LT</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Administracion</b></span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <!-- Menu toggle button -->
                                <ul class="dropdown-menu">
                                    <li class="header">You have 4 messages</li>
                                    <li>
                                        <!-- inner menu: contains the messages -->
                                        <ul class="menu">
                                            <li><!-- start message -->
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <!-- User Image -->
                                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <!-- Message title and timestamp -->


                                                    <!-- /.messages-menu -->

                                                    <!-- Notifications Menu -->

                                                    <!-- Inner Menu: contains the notifications -->

                                                    <!-- The progress bar -->
                                                    <div class="progress xs">
                                                        <!-- Change the css width attribute to simulate progress -->
                                                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <a href="#">View all tasks</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="..<% out.print(foto); %>" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"><% out.print(nom + " " + apel);%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>
                                            Alexander Pierce - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="..<% out.print(foto); %>" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><% out.print(nom + " " + apel);%></p>
                        </div>
                    </div>

                    <!-- search form (Optional) -->

                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu">
                        <li class="header">Procesos</li>
                        <!-- Optionally, you can add icons to the links -->
                        <li class="active"><a href="perfil.jsp"><i class="fa fa-link"></i> <span>Inicio</span></a></li> <li class="treeview">
                            <a href="../administracionp/panela.jsp"><i class="fa fa-link"></i> <span>Perfil</span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="../administracion/perfil.jsp">Modificar Perfil</a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </li>
                        <li><a href="foto.jsp"><i class="fa fa-link"></i> <span>Foto</span></a></li>
                           <li class="treeview">
                            <a href="#"><i class="fa fa-link"></i> <span>Clientes</span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="#">Nuevo Cliente</a></li>
                                <li><a href="#">Modificar Cliente</a></li>
                            </ul>
                        </li>
                            <li class="treeview">
                            <a href="#"><i class="fa fa-link"></i> <span>Administrador</span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="../administracion/nadministrador.jsp">Nuevo Administrador</a></li>
                                <li><a href="#">...</a></li>
                            </ul>
                        </li>
                              <li class="treeview">
                            <a href="#"><i class="fa fa-link"></i> <span>Productos</span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="../administracion/nproducto.jsp">Nuevo Productos</a></li>
                                <li><a href="../administracion/meproductos.jsp">Modificar Productos</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-link"></i> <span>Informes</span> <i class="fa fa-angle-left pull-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="#">Reporte </a></li>
                                <li><a href="#">Unimoda</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        UNIMODA
                        <small>unimodaibarra@gmail.com</small>
                    </h1>

            <!--fin de usuario y menu->
            
            <!--inicio de contenido-->
          
                <section>
                    <h3><i></i>Nuevo Administrador</h3>
                    <div>

                        <div>
                            <div>
                                <form  id="registro" name="registro" action="../administracion/nuevoa.jsp" method="POST">
                                    <div class="form-group">
                                        <select autofocus required class="form-control" name="tdocumento" id="tdocumento">
                                            <option value="">Selecione de tipo de documento de DNI</option>
                                            <option value="true">Nacional</option>
                                            <option value="false">Extranjero</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="dni" name="dni" placeholder="Ingrese su numero DNI de ciudadano" onkeydown="return evaluar(event)" onchange="evaluar(registro)">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="nombres" name="nombres" placeholder="Ingrese sus nombres">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese sus apellidos">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" required class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electronico" onchange="validare(registro);">
                                    </div>
                                    <div class="form-group">
                                        <input name="telefono" type="text" class="form-control" id="telefono" placeholder="Ingrese su  numero de telefono" onkeydown="return numeros(event)" maxlength="15">
                                    </div>
                                    <div class="form-group">
                                        <input name="celular" type="text" class="form-control" id="celular" placeholder="Ingrese su numero de celular" onkeydown="return numeros(event)" maxlength="15">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required class="form-control" id="direccion" name="direccion" placeholder="Ingrese su direccion donde vive actualmente">
                                    </div>
                                    <div class="form-group">
                                       
                                    </div> <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Registrar</button>
                                </form>
                            </div>
                        </div>  
                </section>
            



            <!--inicio de pie de pagina-->
             <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    Anything you want
                </div>
                <!-- Default to the left -->
                <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->


                <li><a href="#control-sidebar-settings-tab"  data-toggle="tab"><i class="fa fa-gears" ></i></a></li>

                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->

                    <!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Configuracion</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-times"></i>

                                <div class="menu-info">
                                    <a href="../procesos/cerrar.jsp"<h4 class="control-sidebar-subheading">Cerrar Secion</h4></a>

                                    <p>__________________________</	p>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                </div>
                <!-- /.tab-pane -->
                <!-- Stats tab content -->

                <!-- /.tab-pane -->
                <!-- Settings tab content -->

                <!-- /.tab-pane -->

            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 2.1.4 -->
        <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.5 -->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/app.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. Slimscroll is required when using the
             fixed layout. -->
    </body>
</html>
