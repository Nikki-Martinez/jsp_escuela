<%-- 
    Document   : index
    Created on : 7/10/2025, 9:47:39 a. m.
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
    <title>Inicio | Escuela</title>
    <link rel="icon" href="img/logo.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css">
    
    <style>
        
        .sidebar {
            position: fixed; 
            top: 0;
            left: 0;
            bottom: 0;
            z-index: 1000; 
            padding: 1rem;
            width: 250px; 
            background-color: #343a40; 
            color: white;
            display: flex;
            flex-direction: column; 
        } /* <-- LLAVE DE CIERRE CORREGIDA */
        
        .main-content-wrapper {
            margin-left: 250px; 
            display: flex;
            flex-direction: column;
            min-height: 100vh; 
        }
        
        
        .page-content {
            flex-grow: 1; 
            padding: 20px;
            padding-bottom: 70px; 
        }

        
        .content-footer {
            position: fixed; 
            bottom: 0;
            left: 250px; 
            right: 0;
            height: 50px; 
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
            z-index: 1030; 
            padding: 15px;
            text-align: center;
        }

        
        .school-brand {
            font-size: 1.25rem;
            font-weight: 700;
            color: #fff;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            text-align: center;
        }

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
            <h1 class="fs-4 fw-bold text-uppercase m-0">
                Escuela UMG
            </h1>
        </div>

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active text-white" aria-current="page" href="#">
                    <i class="bi bi-house-door-fill me-2"></i>Inicio
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="estudiantes.jsp">
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
    
            <h2 class="mb-4">Pagina Principal</h2>

            <div class="card shadow">
                <div class="card-body">

                    <table id="tablaEstudiantes" class="table table-striped table-bordered" style="width:100%">

                        <thead>
                            <tr>
                                <th class="text-center">Carnet</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Direccion</th>
                                <th class="text-center">Teléfono</th>
                                <th>Correo Electronico</th>
                                <th class="text-center">Tipo de Sangre</th>
                                <th class="text-center">Fecha de Nacimiento</th>
                                </tr>
                        </thead>
                            
                        <tbody>
                            <% 
                                Estudiante estudiante = new Estudiante(); 
                                DefaultTableModel tabla = new DefaultTableModel();

                                tabla = estudiante.leer();

                                for(int t=0; t < tabla.getRowCount(); t++){

                                    out.println("<tr data-id=\""+ tabla.getValueAt(t, 0) +"\" data-idts=\""+ tabla.getValueAt(t, 9) +"\" >");

                                    // Centrado: Carnet
                                    out.println("<td class='text-center'>"+ tabla.getValueAt(t, 1) +"</td>"); 
                                    // Sin Centrado: Nombres
                                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>"); 
                                    // Sin Centrado: Apellidos
                                    out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>"); 
                                    // Sin Centrado: Dirección
                                    out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>"); 
                                    // Centrado: Teléfono
                                    out.println("<td class='text-center'>"+ tabla.getValueAt(t, 5) +"</td>"); 
                                    // Sin Centrado: Correo
                                    out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>"); 
                                    // Centrado: Tipo de Sangre
                                    out.println("<td class='text-center'>"+ tabla.getValueAt(t, 7) +"</td>"); 
                                    // Centrado: Fecha de Nacimiento
                                    out.println("<td class='text-center'>"+ tabla.getValueAt(t, 8) +"</td>"); 

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

                language: {
                    url: 'https://cdn.datatables.net/plug-ins/2.0.8/i18n/es-ES.json',
                }
            });
        });
    </script>
</body>
</html>
