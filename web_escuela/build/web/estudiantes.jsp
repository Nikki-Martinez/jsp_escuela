<%-- 
    Document   : estudiantes
    Created on : 7/10/2025, 11:11:00 a. m.
    Author     : guich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Estudiante" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Estudiantes | Escuela</title>
        <link rel="icon" href="img/logo.png" type="image/png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">

        <style>
            /* Estilos personalizados para el sidebar */
            .sidebar {
                position: fixed; /* Fija el sidebar a la izquierda */
                top: 0;
                left: 0;
                bottom: 0;
                z-index: 1000; /* Asegura que esté por encima del contenido */
                padding: 1rem;
                width: 250px; /* Ancho fijo para el sidebar */
                background-color: #343a40; /* Color oscuro como un navbar */
                color: white;
                display: flex;
                flex-direction: column; /* Para colocar el contenido del nav y el footer interno */
            }

            /* Ajuste para el contenido principal para que no quede detrás del sidebar */
            .main-content-wrapper {
                margin-left: 250px; /* Deja espacio para el sidebar */
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* Para asegurar que el contenido use toda la altura del viewport */
            }

            /* Contenedor principal de la página */
            .page-content {
                flex-grow: 1; /* Hace que el contenido principal ocupe todo el espacio disponible */
                padding: 20px;
                padding-bottom: 70px; /* Espacio para que el footer fijo no oculte el contenido */
            }

            /* Estilos para el footer fijo en el contenido */
            .content-footer {
                position: fixed; /* Fija el footer */
                bottom: 0;
                left: 250px; /* Se alinea con el inicio del contenido principal */
                right: 0;
                height: 50px; /* Altura del footer */
                background-color: #f8f9fa;
                border-top: 1px solid #e9ecef;
                z-index: 1030; /* Puede ser más alto que el sidebar si es necesario */
                padding: 15px;
                text-align: center;
            }

            /* Estilo para el nombre de la escuela */
            .school-brand {
                font-size: 1.25rem;
                font-weight: 700;
                color: #fff;
                padding-bottom: 1rem;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                text-align: center;
            }

            /* Para empujar los elementos de Perfil y Cerrar Sesión hacia abajo */
            .bottom-links {
                margin-top: auto;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                padding-top: 1rem;
            }
        </style>
    </head>
    <body>

        <nav class="sidebar">
            <div class="school-brand mb-4">
                <img src="img/logo.png" alt="Logo de la Escuela UMG" class="img-fluid mb-2" style="max-height: 80px;">
                <h1 class="fs-4 fw-bold text-uppercase m-0">Escuela UMG</h1> 
            </div>

            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="index.jsp">
                        <i class="bi bi-house-door-fill me-2"></i>Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">
                        <i class="bi bi-people-fill me-2"></i>Estudiantes
                    </a>
                </li>
            </ul>

            <ul class="nav flex-column bottom-links">
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">
                        <i class="bi bi-person-circle me-2"></i>Perfil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">
                        <i class="bi bi-box-arrow-right me-2"></i>Cerrar Sesión
                    </a>
                </li>
            </ul>
        </nav>

        <div class="main-content-wrapper">

            <main class="page-content">
                <div class="container-fluid mb-5">

                    <h2 class="mb-4">Administración Estudiantes</h2>
                    <div class="card shadow">
                    
                    <div class="card-header d-flex justify-content-between align-items-center border-bottom">
                        <h3 class="card-title">
                            Detalle de Estudiantes
                        </h3>
                        <a href="#" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#modalCrearEstudiante">
                            <i class="bi bi-plus-circle me-1"></i> Nuevo Estudiante
                        </a>
                    </div>
                    
                    <div class="card-body">

                        <table id="tablaEstudiantes" class="table table-striped table-bordered" style="width:100%">

                            <thead>
                                <tr>
                                    <th>Carnet</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Direccion</th>
                                    <th>Teléfono</th>
                                    <th>Correo Electronico</th>
                                    <th>Tipo de Sangre</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                            
                                <% 
                                    Estudiante estudiante = new Estudiante(); 
                                    DefaultTableModel tabla = new DefaultTableModel();

                                    tabla = estudiante.leer();

                                    for(int t=0; t < tabla.getRowCount(); t++){

                                        out.println("<tr data-id=\""+ tabla.getValueAt(t, 0) +"\" data-idts=\""+ tabla.getValueAt(t, 9) +"\" >");

                                        out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>"); 
                                        out.println("<td>"+ tabla.getValueAt(t, 8) +"</td>"); 

                                        out.println("<td>");
                                        out.println("  <button type='button' class='btn btn-warning btn-sm btn-editar' data-bs-toggle='modal' data-bs-target='#modalEditarEstudiante'>");
                                        out.println("    <i class='bi bi-pencil-square'></i>");
                                        out.println("  </button>");
                                        out.println("  <button type='button' class='btn btn-danger btn-sm btn-borrar'>");
                                        out.println("    <i class='bi bi-trash-fill'></i>");
                                        out.println("  </button>");
                                        out.println("</td>");

                                        out.println("</tr>");  
                                    }
                                %>
                            </tbody>    
                            

                            <tfoot>
                               
                            </tfoot>
                        </table>

                    </div>
                </div>
                    
                </div>
            </main>

            <footer class="content-footer">
                <small class="text-muted">© 2025 Escuela UMG | Derechos Reservados.</small>
            </footer>

        </div>
        <jsp:include page="modalCrearEstudiante.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>
        <script>
            $(document).ready(function() {
                $('#tablaEstudiantes').DataTable({
                    // Configuración de DataTables
                    paging: true, 
                    searching: true,
                    ordering: true,
                    info: true,
                    responsive: true,
                    lengthMenu: [5, 10, 25, 50, 100],

                    // ⭐ TRADUCCIÓN AL ESPAÑOL ⭐
                    language: {
                        url: 'https://cdn.datatables.net/plug-ins/2.0.8/i18n/es-ES.json',
                    }
                });
            });
        </script>
    </body>
</html>


                