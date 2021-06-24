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
        <div id="load-categorias"></div>
        
        
        <!--<div id="statusMsg"></div>-->
        
        <!--<div id="load-categorias1"style="background-color: rgb(163, 228, 215);
            color: rgb(0, 0, 0);border: 2px solid rgb(7, 108, 151);height: 500px;">
        </div>-->
        
        <!-- End content -->
        
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

