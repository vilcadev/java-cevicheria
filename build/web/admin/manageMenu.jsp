<%-- 
    Document   : manageMenu
    Created on : 30 jun. 2024, 03:04:21
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Gestionar Menú</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>
    <body>
         <div class="container mt-4">
        <h1 class="mb-4">Gestionar Menú</h1>
        <div class="row mb-3">
            <div class="col-md-5">
                <label for="platillos">Platillos</label>
                <select id="platillos" class="form-control">
                    <!-- Aquí se cargarán las opciones de platillos -->
                </select>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col">
                        <label for="fecha">Fecha</label>
                        <input type="date" id="fecha" class="form-control">
                    </div>
                    <div class="col align-self-end">
                        <button class="btn btn-primary" id="guardarBtn">Guardar Menú</button>
                    </div>
                </div>
            </div>
        </div>
        <h2>Platillos Seleccionados</h2>
        <table id="platillosSeleccionados" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aquí se cargarán los platillos seleccionados -->
            </tbody>
        </table>
    </div>

    <!-- Modal Eliminar Platillo -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">¿Estás seguro?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Sí</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        // Función para cargar platillos en el select
        function loadPlatillos() {
            $.ajax({
                url: '../listarPlatillos', // Asegúrate de que esta URL sea correcta
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var platilloSelect = $('#platillos');
                    platilloSelect.empty();
                    $.each(data, function(index, platillo) {
                        platilloSelect.append($('<option>', {
                            value: platillo.id,
                            text: platillo.nombre
                        }));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Error al cargar los platillos:', error);
                }
            });
        }

        // Evento al cambiar el select de platillos
        $('#platillos').change(function() {
            var platilloId = $(this).val();
            var platilloNombre = $(this).find('option:selected').text();
            var tr = $('<tr>');
            tr.append('<td>' + platilloNombre + '</td>');
            tr.append('<td><input type="number" class="form-control precioInput" step="0.01"></td>');
            tr.append('<td><button class="btn btn-danger btn-sm deleteBtn" data-id="' + platilloId + '"><i class="fas fa-trash-alt"></i></button></td>');
            $('#platillosSeleccionados tbody').append(tr);
        });

        // Evento para eliminar platillo seleccionado
        $('#platillosSeleccionados').on('click', '.deleteBtn', function() {
            $(this).closest('tr').remove();
        });

        // Guardar menú
        $('#guardarBtn').click(function() {
            var menuItems = [];
            $('#platillosSeleccionados tbody tr').each(function(index, row) {
                var platilloId = $(row).find('.deleteBtn').data('id');
                var precio = $(row).find('.precioInput').val();
                menuItems.push({ id: platilloId, precio: parseFloat(precio) });
            });

            var fecha = $('#fecha').val();

            $.ajax({
                url: '/cevicheriaweb/gestionarMenu',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ fecha: fecha, platillos: menuItems }),
                success: function(response) {
                    alert('Menú guardado exitosamente');
                    // Puedes limpiar el formulario o hacer otras acciones después de guardar
                },
                error: function(xhr, status, error) {
                    console.error('Error al guardar el menú:', error);
                }
            });
        });

        loadPlatillos();
    });
    </script>
    </body>
</html>
