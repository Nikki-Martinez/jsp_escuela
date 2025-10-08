<%-- 
    Document   : modalCrearEstudiante
    Created on : 7/10/2025, 10:22:14 p. m.
    Author     : guich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.TipoSangre" %>
<%@page  import="java.util.HashMap" %>
<!DOCTYPE html>
<div class="modal fade" id="modalCrearEstudiante" tabindex="-1" aria-labelledby="modalCrearEstudianteLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="modalCrearEstudianteLabel">
                    <i class="bi bi-person-plus-fill me-2"></i> Nuevo Registro de Estudiante
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            
            <div class="modal-body px-4">
                <form id="formNuevoEstudiante" method="POST" action="srv_crear_estudiante" class="row g-3 needs-validation" novalidate>
                    
                    <h4 class="col-12 mb-4 text-primary border-bottom pb-2">Datos Personales del Estudiante</h4>

                    <div class="col-md-6">
                        <label for="inputCarnet" class="form-label">Carnet</label>
                        <input 
                            type="text" 
                            class="form-control" 
                            id="inputCarnet" 
                            name="carnet" 
                            placeholder="Ej: E123" 
                            required 
                            maxlength="4"
                            pattern="E[0-9]{3}" 
                        >
                        <div class="invalid-feedback">
                            El campo Carnet es obligatorio.
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputNombres" class="form-label">Nombres</label>
                        <input type="text" class="form-control" id="inputNombres" name="nombres" placeholder="Escriba los nombres" required>
                        <div class="invalid-feedback">
                            El campo Nombres es obligatorio.
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="inputApellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="inputApellidos" name="apellidos" placeholder="Escriba los apellidos" required>
                        <div class="invalid-feedback">
                            El campo Apellidos es obligatorio.
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputDireccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="inputDireccion" name="direccion" placeholder="Escriba la dirección" required>
                        <div class="invalid-feedback">
                            El campo Dirección es obligatorio.
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="inputTelefono" class="form-label">Teléfono</label>
                        <input type="tel" class="form-control" id="inputTelefono" name="telefono" placeholder="Escriba el teléfono" required>
                        <div class="invalid-feedback">
                            El campo Teléfono es obligatorio.
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputCorreo" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="inputCorreo" name="correo" placeholder="Escriba el correo electrónico" required>
                        <div class="invalid-feedback">
                            El campo está vacío o el correo no es válido.
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="selectTipoSangre" class="form-label">Tipo de Sangre</label>
                        <select class="form-select" id="selectTipoSangre" name="tipoSangre" required>
                            <option value="" disabled selected>Seleccione un tipo...</option>
                             
                                <%
                                  TipoSangre sangre = new TipoSangre();
                                  HashMap<String,String> drop = sangre.leer();
                                  for(String i:drop.keySet()){
                                    out.println("<option value='"+ i +"'>"+ drop.get(i)+"</option>");
                                    }

                                %>
                        </select>
                        <div class="invalid-feedback">
                            Debe seleccionar un tipo de sangre.
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="inputFechaNac" class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" id="inputFechaNac" name="fechaNacimiento" required>
                        <div class="invalid-feedback">
                            La fecha de nacimiento es obligatoria.
                        </div>
                    </div>

                </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="bi bi-x-circle me-1"></i> Cancelar
                </button>
                <button type="submit" class="btn btn-success" form="formNuevoEstudiante">
                    <i class="bi bi-check-circle-fill me-1"></i> Crear Registro
                </button>
            </div>
            
        </div>
    </div>
</div>

<script>
(function () {
  'use strict'

  var forms = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>