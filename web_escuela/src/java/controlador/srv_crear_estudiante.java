/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Estudiante;

@WebServlet(name = "srv_crear_estudiante", urlPatterns = {"/srv_crear_estudiante"})
public class srv_crear_estudiante extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        Estudiante estudiante = new Estudiante();
        
        try {
            String carnet = request.getParameter("carnet");
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            int idTipoSangre = Integer.parseInt(request.getParameter("tipoSangre")); 
            String fechaNacimiento = request.getParameter("fechaNacimiento");
            
            estudiante.setCarnet(carnet);
            estudiante.setNombres(nombres);
            estudiante.setApellidos(apellidos);
            estudiante.setDireccion(direccion);
            estudiante.setTelefono(telefono);
            estudiante.setCorreo_electronico(correo);
            estudiante.setId_sangre(idTipoSangre);
            estudiante.setFecha_nacimiento(fechaNacimiento);
            
            int registrosInsertados = estudiante.crear();
            
            if (registrosInsertados > 0) {
                response.sendRedirect("estudiantes.jsp?alerta=success");
            } else {
                response.sendRedirect("estudiantes.jsp?alerta=error&mensaje=Fallo al insertar el registro.");
            }
            
        } catch (NumberFormatException e) {
            System.err.println("Error al parsear el ID de Tipo Sangre: " + e.getMessage());
            response.sendRedirect("estudiantes.jsp?alerta=error&mensaje=Error de datos. El ID de tipo de sangre no es válido.");
        } catch (Exception e) {
            System.err.println("Error en el Servlet al crear Estudiante: " + e.getMessage());
            response.sendRedirect("estudiantes.jsp?alerta=error&mensaje=Error del sistema: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para la creación de nuevos estudiantes";
    }

}