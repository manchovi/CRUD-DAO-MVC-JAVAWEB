<%@page import="Model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- El id debe ser el mismo que se le colocó de nombre a la sesión en el controlador -->
<jsp:useBean id="lista" scope="session" class="java.util.List" />
<html>
    <head>
        <title>Control de Inventario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
        <link type="text/css" rel="stylesheet" href="./css/estilo.css" />
        <!-- Bootstrap Core Css -->
        <link href="./plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
        <!-- Waves Effect Css -->
        <link href="./plugins/node-waves/waves.css" rel="stylesheet" />
        <!-- Animation Css -->
        <link href="./plugins/animate-css/animate.css" rel="stylesheet" />
        <!-- JQuery DataTable Css -->
        <link href="./plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" />
        <!-- Custom Css -->
        <link href="./css/style.css" rel="stylesheet" />
        <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
        <!--<link href="./css/themes/all-themes.css" rel="stylesheet" />-->
	
	<link href="./css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="./css/main.css"  rel="stylesheet" />
        
    </head>
    <body>
       
        <!-- Todo el contenido de la aplicación -->
       <div class="container">
        <div class="table-responsive">
        <table id="tabla" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th><th>NOMBRE</th><th>ESTADO</th><th>ACCION</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th><th>NOMBRE</th><th>ESTADO</th><th>ACCION</th>
                    </tr>
                </tfoot>
               
                <tbody>
                <tr>
                    <td>Juan</td>
                    <td>Luis</td>
                    <td>Carlos</td>
                    
                    <td>
                        <!-- /Vistas-Categorias/crearCategoria.jsp -->
                        <a href="#" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button" name="btnmodi">Editar</a>
                        
                        <a href="#" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button">Eliminar</a>
                    </td>
                </tr>
                
                <tr>
                    <td>Ana</td>
                    <td>Brenda</td>
                    <td>Mario</td>
                    
                    <td>
                        <!-- /Vistas-Categorias/crearCategoria.jsp -->
                        <a href="#" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button" name="btnmodi">Editar</a>
                        
                        <a href="#" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button">Eliminar</a>
                    </td>
                </tr>

                </tbody>
            </table>
            </div>
        </div>
        <!--</div>-->
        <!-- End content -->
        
        <!--====== Scripts -->
	<!-- <script src="./js/jquery-3.1.1.min.js"></script> -->
	<script src="./plugins/jquery/jquery.min.js"></script>
	<script src="./js/sweetalert2.min.js"></script>
	<!-- <script src="./js/bootstrap.min.js"></script> -->
	<script src="./plugins/bootstrap/js/bootstrap.js"></script>
	<script src="./js/material.min.js"></script>
	

	<!-- Jquery Core Js -->
    <!-- <script src="./plugins/jquery/jquery.min.js"></script> -->
    <!-- Bootstrap Core Js -->
    <!-- <script src="./plugins/bootstrap/js/bootstrap.js"></script> -->
    <!-- Select Plugin Js -->
    <script src="./plugins/bootstrap-select/js/bootstrap-select.js"></script>
    <!-- Slimscroll Plugin Js -->
    <script src="./plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- Waves Effect Plugin Js -->
    <script src="./plugins/node-waves/waves.js"></script>
    <!-- Jquery DataTable Plugin Js -->
    <script src="./plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="./plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="./plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
    <!-- Custom Js -->
    
    <script src="./js/pages/tables/jquery-datatable.js"></script>
    <!-- Demo Js -->
    <script src="./js/demo.js"></script>


	<script src="./js/ripples.min.js"></script>
	<script src="./js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="./js/main.js"></script>
	<!-- <script>
		$.material.init();
	</script> -->
	<script>
          $(document).ready(function(){
              $('#tabla').DataTable();
          });
      </script>
        
    </body>
</html>

<!-- Autor: Prof. Manuel de Jesús Gámez López -->

