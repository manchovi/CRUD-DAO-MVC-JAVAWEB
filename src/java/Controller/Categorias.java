package Controller;

import DAO.CategoriaDAO;
import DAO.CategoriaDAOImplementar;
import Model.Categoria;
import Model.ResultadoJson;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Categorias extends HttpServlet {

    protected void listaCategorias(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Crear instancia a CategoriaDAO
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        //Crear instancia de sesión; se le da true para crear la sesión.
        HttpSession session = request.getSession(true);
        session.setAttribute("lista", categoria.Listar()); //lista es el nombre de la variable de sesión.
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/listarCategorias.jsp");
        dispatcher.forward(request, response);
        //response.sendRedirect("/index.jsp");
    }
    
    protected void borrarCategoria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        categoria.borrarCat(2);    //Se eliminará la categoria con id_categoria = 2;
        */
        
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/listarCategorias.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String parametro = request.getParameter("opcion");
        //Evaluar si el parámetro es crear o listar o cualquier otro.
        if(parametro.equals("crear")){
            //Vista o formulario para registrar nueva categoria.
            String pagina = "/Vistas-Categorias/crearCategoria.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
            dispatcher.forward(request, response);
            
            //response.sendRedirect(pagina);
            
        }else if(parametro.equals("listar")){
            this.listaCategorias(request, response);
            
        }else if(parametro.equals("modificar")){
            //Se efectua el casting o conversión de datos porque lo ingresado en el formulario es texto.
            int id_categoria = Integer.parseInt(request.getParameter("id_cat"));
            String nom_categoria = request.getParameter("nombre_cat");
            int estado_categoria = Integer.parseInt(request.getParameter("estado_cat"));
            
            String pagina = "/Vistas-Categorias/crearCategoria.jsp?id_c="+id_categoria+"&&nombre_c="+nom_categoria+"&&estado_c="+estado_categoria+"&&senal=1";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
            dispatcher.forward(request, response);
            
        }else if(parametro.equals("eliminar")){
            int del_id = Integer.parseInt(request.getParameter("id_cat"));
            CategoriaDAO categoria = new CategoriaDAOImplementar();
            categoria.borrarCat(del_id);
            this.listaCategorias(request, response);
            
            
            
            
            
            
            boolean resultado = categoria.borrarCat(del_id);
            ArrayList<ResultadoJson> lista=new ArrayList<ResultadoJson>();
            Gson gson=new Gson();
            if(resultado){
                //Actualizo la variable de sesión "lista" con los datos consultados en la
                //bd por medio: categoria.Listar(), esto permite actualizar los datos en la vista consulta categorias.
                HttpSession session = request.getSession(true);
                session.setAttribute("lista", categoria.Listar());
                //Aca mando al contructor los 3 datos del dialogo.
                //Título, icono, Contenido del Mensaje.
                lista.add(new ResultadoJson("MENSAJE!","success","Registro eliminado correctamente."));
            }else{
                lista.add(new ResultadoJson("Lo sentimos!","error","Error. No se pudo eliminar el registro."));
            }
            
            response.setContentType("application/json");
            //response.getWriter().write(json.toString());
            PrintWriter pw = response.getWriter();
            pw.println(gson.toJson(lista));
            pw.close(); 
        } 
        
        
        
        //processRequest(request, response);
        //Se captura el parámetro que se esta enviando.
        /*String parametro = request.getParameter("opcion");
        String id_cat = request.getParameter("id_cat");
        String nombre_cat = request.getParameter("nombre_cat");
        String estado_cat = request.getParameter("estado_cat");*/
        //System.out.println(parametro);
        
        /*response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println(parametro);
            System.out.println(id_cat);
            System.out.println(nombre_cat);
            System.out.println(estado_cat);
        }*/
        
        
       
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        /*
            CategoriaDAO categoria = new CategoriaDAOImplementar();
            Categoria guardar_cat = new Categoria();
            guardar_cat.setNom_categoria("Bebidas Naturales");
            guardar_cat.setId_categoria(5);               //Modificar la categoria registrada anteriormente.
            guardar_cat.setEstado_categoria(1);           //Estado 1.
            categoria.guardarCat(guardar_cat);
        */
        String status;
        
        Categoria categoria = new Categoria();
        //Se efectua el casting o conversión de datos porque lo ingresado en el formulario es texto.
        int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
        String nom_categoria = request.getParameter("txtNomCategoria");
        int estado_categoria = Integer.parseInt(request.getParameter("txtEstadoCategoria"));
        
        categoria.setId_categoria(id_categoria);
        categoria.setNom_categoria(nom_categoria);
        categoria.setEstado_categoria(estado_categoria);
        
        CategoriaDAO guardarCategoria = new CategoriaDAOImplementar();
        //guardarCategoria.guardarCat(categoria);
        //this.listaCategorias(request, response);
        
        boolean resultado = guardarCategoria.guardarCat(categoria);
        if(resultado){
            HttpSession session = request.getSession(true);
            session.setAttribute("lista", guardarCategoria.Listar());
            status = "ok";
        }else{
            status = "err";
        }
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(status);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //Autor: Prof. Manuel de Jesús Gámez López
}
