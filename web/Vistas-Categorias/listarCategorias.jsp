<%@page import="Model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
   try{
        HttpSession var_Session = request.getSession(false);
        String nombres = (String) var_Session.getAttribute("sessionNombres");
        String user = (String) var_Session.getAttribute("sessionUsuario");
        String tipo = (String) var_Session.getAttribute("sessionTipo");
        String correo = (String) var_Session.getAttribute("sessionEmail");
        if(user == null){
            response.sendRedirect("./");
        }else if(user!=null){
%>
<!DOCTYPE html>
<!-- El id debe ser el mismo que se le colocó de nombre a la sesión en el controlador -->
<jsp:useBean id="lista" scope="session" class="java.util.List" />
<html>
    <head>
        <title>Control de Inventario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
        
    </head>
    <body>
        
        <%@include file="../WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        
        <!-- Todo el contenido de la aplicación -->
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">       
                <div class="table-responsive">
                <!--<a href="#" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nueva categoria</a>-->
                <a href="<%= request.getContextPath() %>/categorias?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nueva categoria</a>
                <h3>Listado de Categorias Registradas</h3>
                <!--<div class="body center-block" style="width: 90%; text-align: center;">-->
                <table id="tablaClientes" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                    <thead>
                        <tr>
                            <th style="text-align: center;">|N°|</th>
                            <th style="text-align: center;">ID</th>
                            <th style="text-align: center;">NOMBRE</th>
                            <th style="text-align: center;">ESTADO</th>
                            <th style="text-align: center;">ACCION</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th style="text-align: center;">|N°|</th>
                            <th style="text-align: center;">ID</th>
                            <th style="text-align: center;">NOMBRE</th>
                            <th style="text-align: center;">ESTADO</th>
                            <th style="text-align: center;">ACCION</th>
                        </tr>
                    </tfoot>
                    <tbody id="employee_data">
                    <%
                        for(int i=0;i < lista.size(); i++){
                            Categoria categoria = new Categoria();
                            categoria = (Categoria)lista.get(i);
                        //}
                    %>

                    <tr>
                        <td style="text-align: center;"><% out.print(i+1); %></td>
                        <td style="text-align: center;"><%= categoria.getId_categoria() %></td>
                        <td style="text-align: center;"><%= categoria.getNom_categoria() %></td>
                        <td style="text-align: center;"><%= categoria.getEstado_categoria() %></td>

                        <td style="text-align: center;">
                            <!-- /Vistas-Categorias/crearCategoria.jsp -->
                            <a href="<%= request.getContextPath() %>/categorias?opcion=modificar&&id_cat=<%= categoria.getId_categoria() %>&&nombre_cat=<%= categoria.getNom_categoria() %>&&estado_cat=<%= categoria.getEstado_categoria() %>" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button" name="btnmodi">Editar</a>

                            <a href="<%= request.getContextPath() %>/categorias?opcion=eliminar&&id=<%= categoria.getId_categoria() %>" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                </div>
            </div>
        <div class="col-md-1"></div>
       </div>
            <!--</div>-->
        <!-- End content -->
        
        <%@include file="../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>

<script>
    $(document).ready(function(){
        $('#tablaClientes').DataTable();
    });
</script>

<%
            }
               //Aca puede ir un mensaje para informar que no se ha iniciado sesión.
            }catch(Exception e){

            }
%>
   
<!-- Autor: Prof. Manuel de Jesús Gámez López -->

