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
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
    </head>
    <body>
        
        <!-- Todo el contenido de la aplicación -->     
        <section class="container">
            <div class="col-md-1"></div>
            <div class="col-md-14"> 
                <div class="table-responsive">
                <!--<a href="#" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nueva categoria</a>-->
                <a href="<%= request.getContextPath() %>/categorias?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nueva categoria</a>
                <h3 style="text-align: center;">Listado de Categorias Registradas</h3>
                <!--<div class="body center-block" style="width: 90%; text-align: center;">-->
                <p class="statusMsg"></p>
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
                            <button class="btn btn-primary btn-sm glyphicon glyphicon-edit" data-toggle="modal" data-target="#ventanaCategorias" id="btnmodi" name="btnmodi" data-opcion="modificar" data-id="<%= categoria.getId_categoria() %>" data-nombre="<%= categoria.getNom_categoria() %>" data-estado="<%= categoria.getEstado_categoria() %>" > <i class="fa fa-pen"> Update</i></button>
                                    
                            <a href="javascript:void(0)" title="Borrar Registro" id="delete_categoria"
                               data-opcion="eliminar" data-id_categoria="<%= categoria.getId_categoria() %>" data-nom_categoria="<%= categoria.getNom_categoria() %>" 
                               data-est_categoria="<%= categoria.getEstado_categoria() %>" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button"><i class="fas fa-trash-alt"> Delete</i></a><!--<i class="fa fa-trash"> </i>-->
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
       <!--</section>-->
        <!-- End content -->
        
        
    <!-- Large modal -->
    <!--<button class="btn btn-primary" data-toggle="modal" data-target="#largeModal">Large modal</button>-->

    <!--<div id="ventanaCategorias" class="modal fade" tabindex="-1" role="dialog">-->
    <!--Le quite el atributo fade para que el modal se ocultara totalmente-->
    <div id="ventanaCategorias" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  >
        <!--<div class="modal-dialog modal-lg">-->
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div style="background-color: #ac2925;" class="modal-header">
                    <h5 class="modal-title text-white"><i class="glyphicon glyphicon-user"></i>ACTUALIZAR DATOS DE CATEGORIAS</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <!--<p class="statusMsg"></p>-->
                    <form>
                        <div class="form-group">
                            <label for="id-categoria" class="col-form-label">ID:</label>
                            <input type="text" readonly="true" class="form-control" id="id" name="id">
                            <input type="hidden" class="form-control" id="id1" name="id1">
                        </div>
                        <div class="form-group">
                            <label for="nombre-categoria" class="col-form-label"><strong>NOMBRE CATEGORIA:</strong></label>
                            <input type="text" autofocus="true" class="form-control" id="nombre" name="nombre" required>
                            <!--<textarea class="form-control" id="nombre"></textarea>-->
                        </div>
                        <div class="form-group">
                            <label for="estado-categoria"><strong><div id="actual_estado" name="actual_estado">ESTADO CATEGORIA: </div></strong></label>
                            <select class="form-control" id="estado" name="estado">
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                            </select>
                          </div>
                    </form>
                </div>
                <div style="background-color: #ac2925;" class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" data-backdrop="false" onclick="actualizarCategorias()">Actualizar</button>
                </div>
            </div>
        </div>
    </div>
        
    </section>
        
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



