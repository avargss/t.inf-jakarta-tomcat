package org.iesbelen.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.iesbelen.dao.UsuarioDAO;
import org.iesbelen.dao.UsuarioDAOImpl;
import org.iesbelen.model.Usuario;
import org.iesbelen.utilities.Util;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "usuariosServlet", value = "/tienda/usuarios/*")
public class UsuariosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * HTTP Method: GET
     * Paths:
     * /usuarios/
     * /usuarios/{id}
     * /usuarios/editar{id}
     * /usuarios/crear
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher;
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || "/".equals(pathInfo)) {
            UsuarioDAO userDAO = new UsuarioDAOImpl();

            List<Usuario> listaUsuario = userDAO.getAll();

            request.setAttribute("listaUsuario", listaUsuario);
            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");

        } else {
            // GET
            // 		/usuarios/{id}
            // 		/usuarios/{id}/
            // 		/usuarios/edit/{id}
            // 		/usuarios/edit/{id}/
            // 		/usuarios/crear
            // 		/usuarios/crear/
            //      /usuarios/login
            //      /usuarios/login

            pathInfo = pathInfo.replaceAll("/$", "");
            String[] pathParts = pathInfo.split("/");

            if (pathParts.length == 2 && "crear".equals(pathParts[1])) {

                // GET
                // /usuarios/crear


                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/crear-usuarios.jsp");

            } else if (pathParts.length == 2) {

                UsuarioDAO userDAO = new UsuarioDAOImpl();

                // GET
                // /usuarios/{id}

                try {
                    int id = Integer.parseInt(pathParts[1]); // almaceno la id
                    Optional<Usuario> usuario = userDAO.find(id);

                    request.setAttribute("usuario", usuario);
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/detalle-usuarios.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }
            } else if (pathParts.length == 3 && "editar".equals(pathParts[1])) {
                UsuarioDAO userDAO = new UsuarioDAOImpl();

                // GET
                // /usuarios/editar/{id}

                try {
                    request.setAttribute("usuario", userDAO.find(Integer.parseInt(pathParts[2])));
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/editar-usuarios.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }

            } else {
                System.out.println("Opción POST no soportada.");
                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
            }
        }

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher;
        String __method__ = request.getParameter("__method__");

        if (__method__ == null) {
            // Crear uno nuevo

            UsuarioDAO userDAO = new UsuarioDAOImpl();

            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");

            System.out.printf(usuario);

            Usuario nuevoUser = new Usuario();
            try {
                // Se hashea la contraseña antes de guardarla

                String hashedPassword = Util.hashPassword(password);
                nuevoUser.setPassword(hashedPassword);

                nuevoUser.setUsuario(usuario);
                nuevoUser.setRol(rol);
                userDAO.create(nuevoUser); // Añade el nuevo usuario con la contraseña ya hasheada

                System.out.printf(nuevoUser.toString());

            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }

        } else if (__method__ != null && "put".equalsIgnoreCase(__method__)) {
            // Actualizar uno existente
            // Dado que los forms de html solo soportan method GET y POST utilizo parámetro oculto para indicar la operación de actulización PUT.
            doPut(request, response);

        } else if (__method__ != null && "delete".equalsIgnoreCase(__method__)) {
            // Borrar uno existente
            // Dado que los forms de html solo soportan method GET y POST utilizo parámetro oculto para indicar la operación de actulización DELETE.
            doDelete(request, response);

        } else if (__method__ != null && "login".equalsIgnoreCase(__method__)) {
            // Login
            // Dado que los forms de html solo soportan method GET y POST utilizo parámetro oculto para indicar la operación de actulización DELETE.

            UsuarioDAO userDAO = new UsuarioDAOImpl();
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            try {
                String password2 = Util.hashPassword(password);
                Optional<Usuario> userOptional = userDAO.findLogin;


            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }



        } else {
            System.out.println("Opción POST no soportada.");
        }

        //response.sendRedirect("../../../tienda/usuarios");
        response.sendRedirect(request.getContextPath() + "/tienda/usuarios");

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        UsuarioDAO userDAO = new UsuarioDAOImpl();
        String idUsuario = request.getParameter("idUsuario");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");
        Usuario user = new Usuario();

        try {

            int id = Integer.parseInt(idUsuario);
            user.setIdUsuario(id);
            user.setUsuario(usuario);
            user.setPassword(Util.hashPassword(password));
            user.setRol(rol);
            userDAO.update(user);

        } catch (NumberFormatException | NoSuchAlgorithmException nfe) {
            nfe.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher;
        UsuarioDAO usuDAO = new UsuarioDAOImpl();
        String idUsuario = request.getParameter("idUsuario");

        try {

            int id = Integer.parseInt(idUsuario);
            usuDAO.delete(id);

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }
    }
}