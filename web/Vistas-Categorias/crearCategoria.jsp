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
<!-- Para importar los datos de la clase Categoria -->
<jsp:useBean id="categoria" scope="session" class="Model.Categoria" />

<%
    String id = "";
    String nombre_cat = "";
    String estado_cat = "";
    if(request.getParameter("senal")!=null){
        /*String id = request.getParameter("id_c");
        String nombre_cat = request.getParameter("nombre_c");
        String estado_cat = request.getParameter("estado_c");*/
        id = request.getParameter("id_c");
        nombre_cat = request.getParameter("nombre_c");
        estado_cat = request.getParameter("estado_c");
    }else{
        id = String.valueOf(categoria.getId_categoria());    //Id predeterminado cero definido en el constructor
        nombre_cat = categoria.getNom_categoria();
        estado_cat = String.valueOf(categoria.getEstado_categoria());
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de Inventario</title>
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
        
        <script type="text/javascript">
            //Función para el botón regresar.
            function regresar(url){
                location.href = url;
            }
        </script>
    </head>
    <body>
        <%@include file="../WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        
      <div class="estilo_consulta">     
        <h3>Mantenimiento Categorias</h3>
        <form class="form-horizontal" id="frmCategoria" name="frmCategoria" action="<%= request.getContextPath() %>/categorias" method="post">
            <input type="hidden" name="id_categoria" value="<%= id %>" >
            
            <div class="form-group">
                <label for="txtNomCategoria" class="col-sm-2 control-label">Nombre:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtNomCategoria" value="<%= nombre_cat %>" required>
                </div>
            </div>
                
           <div class="form-group">
                <label for="txtEstadoCategoria" class="col-sm-2 control-label">Estado:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="txtEstadoCategoria" value="<%= estado_cat %>" required>
                </div>
            </div>
                
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <%
                        if(request.getParameter("senal")!=null){
                    %>
                    <input type="submit" class="btn btn-default btn-sm" name="btnModificar" value="Actualizar" />
                    <%
                        }else{   
                    %>    
                    <input type="submit" class="btn btn-success btn-sm" name="btnGuardar" value="Guardar" />
                    <%
                        }  
                    %> 
                    <input type="button" class="btn btn-info btn-sm" onclick="regresar('<%= request.getContextPath() %>/categorias?opcion=listar')" 
                           name="btnRegresar" value="Regresar" />
                </div>
            </div>   
        </form>
      </div>
         <%@include file="../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>
<%
            }
               //Aca puede ir un mensaje para informar que no se ha iniciado sesión.
            }catch(Exception e){

            }
%>
<!-- Autor: Prof. Manuel de Jesús Gámez López -->