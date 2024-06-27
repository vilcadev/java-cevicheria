<%-- 
    Document   : manageOrders
    Created on : 26 jun. 2024, 00:26:38
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordenes por Atender</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .estado-recibido {
            background-color: #4CAF50; /* Verde */
            display: inline-block;
            padding: 0 5px;
            border-radius: 3px;
        }
        .estado-preparacion {
            background-color: #FFCC80; /* Amarillo */
            display: inline-block;
            padding: 0 5px;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Ordenes por Atender</h1>
        <h2>Platillos</h2>
        <table id="ordenesTable" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Nro Orden</th>
                    <th>Estado</th>
                    <th>Hora Pedido</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1234</td>
                    <td class="estado-recibido">Recibido</td>
                    <td>14:30</td>
                    <td>
                        <button class="btn btn-primary terminar-orden-btn" data-toggle="modal" data-target="#detalleOrdenModal">Terminar Orden</button>
                    </td>
                </tr>
                <tr>
                    <td>5678</td>
                    <td class="estado-preparacion">En preparación</td>
                    <td>15:15</td>
                    <td>
                        <button class="btn btn-primary terminar-orden-btn" data-toggle="modal" data-target="#detalleOrdenModal">Terminar Orden</button>
                    </td>
                </tr>
                <tr>
                    <td>9012</td>
                    <td class="estado-preparacion">En preparación</td>
                    <td>16:00</td>
                    <td>
                        <button class="btn btn-primary terminar-orden-btn" data-toggle="modal" data-target="#detalleOrdenModal">Terminar Orden</button>
                    </td>
                </tr>
                <tr>
                    <td>3456</td>
                    <td class="estado-recibido">Recibido</td>
                    <td>16:45</td>
                    <td>
                        <button class="btn btn-primary terminar-orden-btn" data-toggle="modal" data-target="#detalleOrdenModal">Terminar Orden</button>
                    </td>
                </tr>
                <tr>
                    <td>7890</td>
                    <td class="estado-recibido">Recibido</td>
                    <td>17:00</td>
                    <td>
                        <button class="btn btn-primary terminar-orden-btn" data-toggle="modal" data-target="#detalleOrdenModal">Terminar Orden</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Modal Detalle Orden -->
    <div class="modal fade" id="detalleOrdenModal" tabindex="-1" role="dialog" aria-labelledby="detalleOrdenModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detalleOrdenModalLabel">Detalle Orden</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Nro Orden: <span id="detalleNroOrden"></span></p>
                    <p>Estado: <span id="detalleEstado"></span></p>
                    <p>Hora Pedido: <span id="detalleHoraPedido"></span></p>
                    <h3>Platos Elegidos</h3>
                    <ul id="platosElegidos">
                        <li>2 arroz chaufa</li>
                        <li>3 sopa de marisco</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary">Preparar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('.terminar-orden-btn').click(function() {
                // Example data for modal
                var nroOrden = $(this).closest('tr').find('td:first').text();
                var estado = $(this).closest('tr').find('td:nth-child(2)').text();
                var horaPedido = $(this).closest('tr').find('td:nth-child(3)').text();

                $('#detalleNroOrden').text(nroOrden);
                $('#detalleEstado').text(estado);
                $('#detalleHoraPedido').text(horaPedido);
            });
        });
    </script>
</body>
</html>

