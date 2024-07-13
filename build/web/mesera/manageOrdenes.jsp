<%-- 
    Document   : manageOrdenes
    Created on : 28 jun 2024, 0:27:06
    Author     : Erick Joeseth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cevicheria La Chinita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6c5d2463b9.js" crossorigin="anonymous"></script>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: #ffffff;
            border-bottom: 1px solid #dddddd;
            padding: 10px 20px;
            margin-bottom: 20px;
        }
        .header .navbar-brand {
            display: flex;
            align-items: center;
        }
        .no-entry {
            position: absolute;
            top: 5px;
            right: 5px;
            font-size: 1.2em;
        }
        .sidebar {
            background-color: #ffffff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: -250px;
            width: 250px;
            transition: left 0.3s ease;
            z-index: 1000;
            padding: 15px;
        }
        .sidebar-active {
            left: 0;
        }
        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 999;
        }
        .sidebar-overlay-active {
            display: block;
        }
        .navbar-nav .nav-link {
            padding-left: 0;
        }
    
        .table-responsive {
            margin-bottom: 20px;
        }
        
        .table thead tr:first-child th {
            background-color: #ddf6f8;
            font-weight: bold;
            border-top: none;
            border-bottom: 2px solid #bbbbbb;
        }

        .button-container {
            display:flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .button-container button {
            flex: 1;
            margin: 0 5px;
        }

        .btn-primary {
        background-color: #d5d6d8;
        border-color: #d5d6d8;
        color: #000000;
        }
        .btn-primary:hover{
            background-color: #adadad;
        }

         .btn-success {
        background-color: #2de157;
        border-color: #2de157;
        color: #000000;
        }
        .btn-success:hover {
            background-color: #19b53b;
        }
        
        .footer {
            margin-top: 380px;
        }

        
       
        .nav-link {
            color: #5a67d8;
        }
        .tab-content {
            padding: 20px;
        }
        
        
.menu {
    display: flex;
    gap: 20px;
}

.item {
    position: relative;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    cursor:pointer;
}

.item img {
    display: block;
    width: 200px;
    height: 150px;
    object-fit: cover;
}

.price {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: rgba(0, 0, 0, 0.7);
    color: #fff;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 14px;
}

.name {
    text-align: center;
    font-size: 16px;
    padding: 10px 0;
}

    </style>
</head>
<body>

    <div class="header">
        <nav class="navbar navbar-light">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation" onclick="toggleSidebar()">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand d-flex align-items-center ml-2">
                <img src="../assets/logo.png" width="40" height="40" class="d-inline-block align-top" alt="">
                <span class="ml-2">Cevicheria La Chinita</span>
            </a>
        </nav>
    </div>

    <div class="sidebar" id="sidebar">
        <div class="text-center">
            <img src="../assets/logo.png" alt="Logo" class="img-fluid">
            <button class="btn btn-link mt-3" onclick="toggleSidebar()">Salir</button>
        </div>
    </div>

    <div class="sidebar-overlay" id="sidebar-overlay" onclick="toggleSidebar()"></div>

    
    <div class="container-fluid main-content">
        <div class="row">
            
            <div class="col-md-8">
                
                <h2> <a href="#"><i class="fa-regular fa-circle-left" style="color: #5443eb;"></i></a> Mesa 1</h2>
                <div class="table-responsive">
                    <table id="tablaPlatillos" class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                                                  
                        </tbody>
                    </table>
                </div>
                <br>
                
                <div class="footer">
                    <div class="form-group">
                        <p style="text-align: right;"><b>Total: S/50.00</b></p>
                        
                        <textarea class="form-control" id="message" rows="3" placeholder="Escriba aqui un mensaje de impresión para la cocina"></textarea>
                    </div>
                    <div >
                        
                        <div class="button-container">
                            <button class="btn btn-primary"><i class="fa-solid fa-receipt"></i>
                                Pre - cuenta
                            </button>
                            <button class="btn btn-success"><i class="fa-solid fa-download"></i>
                                Guardar
                            </button>
                        </div>
                    </div>
                </div>
                
            </div>

            <div class="col-md-4">
                <div class="container mt-5">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="productos-tab" data-toggle="tab" href="#productos" role="tab" aria-controls="productos" aria-selected="true">
                <i class="fas fa-box"></i> Platillos
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pagos-tab" data-toggle="tab" href="#pagos" role="tab" aria-controls="pagos" aria-selected="false">
                <i class="fas fa-money-bill"></i> Pagos
            </a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="productos" role="tabpanel" aria-labelledby="productos-tab">
            <div class="row mt-3">
                <div class="col-md-12">
                    <button class="btn btn-primary mb-3">Todos</button>
                     <button class="btn btn-primary mb-3">Plato Principal</button>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search" aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                                <input type="date" id="fecha" class="form-control">
                        </div>
                        <div class="input-group-append">
                            <button id="cargarMenuButton" class="btn btn-outline-secondary" type="button">
                                <i class="fas fa-sync-alt"></i>
                            </button>
                        </div>
                    </div>
                    <div>
                        <div class="menu" id="menuContainer">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="pagos" role="tabpanel" aria-labelledby="pagos-tab">
            <div class="row mt-3">
                <div class="col-md-12">
                    <label for="info">Información</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button class="btn btn-outline-secondary" type="button">
                                <i class="fab fa-whatsapp"></i>
                            </button>
                             <button class="btn btn-outline-secondary" type="button">
                                <i class="fa-solid fa-envelope"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control" placeholder="Enviar a..." aria-label="Enviar a">
                    </div>
                    <label for="boleta">Pagos</label>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Cliente" aria-label="Cliente">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="DNI" aria-label="DNI">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="total">Total</label>
                        <p style="text-align: right;"><b></b></p>
                    </div>
                    <button class="btn btn-danger btn-block">Finalizar</button>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
        </div>
    </div>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        var platillos = [];

     

       // Función para cargar platillos desde el servidor
        function loadMenu(fecha) {
            $.ajax({
                url: '../gestionarMenu',
                method: 'GET',
                data: { fecha: fecha },
                dataType: 'json',
                success: function(data) {
                    platillos = data;
                    showPage(); // Esta función debería actualizar la página con los datos de los platillos
                },
                error: function(xhr, status, error) {
                    console.error('Error al cargar los platillos:', error);
                }
            });
        }
        
                $(document).ready(function() {
            $('#cargarMenuButton').on('click', function() {
                var fecha = $('#fecha').val();
                if (fecha) {
                    loadMenu(fecha);
                } else {
                    alert('Por favor, seleccione una fecha.');
                }
            });
        });



           function showPage() {
        var menuContainer = $('#menuContainer');
        menuContainer.empty();

        $.each(platillos, function(index, platillo) {
            console.log(platillo);
             if (!platillo.precioUnitario || !platillo.imagenUrl || !platillo.nombre) {
            console.warn('Propiedad faltante en platillo:', platillo);
        }
         var item = $('<div class="item">');
        item.append('<div class="price">S/ ' + platillo.precioUnitario + '</div>');
        item.append('<img src="' + platillo.imagenUrl + '" alt="' + platillo.nombre + '">');
        item.append('<div class="name">' + platillo.nombre + '</div>');

        // Añadir evento de clic al div item
         item.click(function() {
             agregarPlatillo(platillo);
         });
        menuContainer.append(item);
        });
    }
    
    
    
    
        // Función para agregar platillo a la tabla
        function agregarPlatillo(platillo) {
            var tablaPlatillos = $('#tablaPlatillos');
            var encontrado = false;

            // Recorrer las filas existentes para verificar si ya existe el platillo
            tablaPlatillos.find('tbody tr').each(function() {
                var nombrePlatillo = $(this).find('td:eq(0)').text().trim();
                if (nombrePlatillo === platillo.nombre) {
                    var cantidad = parseInt($(this).find('td:eq(1)').text().trim()) + 1;
                    $(this).find('td:eq(1)').text(cantidad);
                    encontrado = true;
                    return false; // Terminar el bucle si ya se encontró el platillo
                }
            });

            if (!encontrado) {
                // Si el platillo no existe en la tabla, agregar una nueva fila
                var nuevaFila = $('<tr>');
                nuevaFila.append('<td>' + platillo.nombre + '</td>');
                nuevaFila.append('<td>1</td>'); // Iniciar cantidad en 1
                nuevaFila.append('<td>' + platillo.precioUnitario.toFixed(2) + '</td>'); // Formatear precio
                nuevaFila.append('<td><a href="#" class="eliminarPlatillo"><i class="fa-solid fa-trash" style="margin-right: 20px; color: red;"></i></a></td>');
                tablaPlatillos.find('tbody').append(nuevaFila);
            }
            var cantidad = parseInt($(this).find('td:eq(1)').text().trim()) + 1;
$(this).find('td:eq(1)').text(cantidad);

  // Agregar evento para eliminar platillo
    tablaPlatillos.find('.eliminarPlatillo').off('click').on('click', function(e) {
        e.preventDefault();
        $(this).closest('tr').remove();
    });
        }
    
    });
</script>

    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('sidebar');
            var overlay = document.getElementById('sidebar-overlay');
            if (sidebar.classList.contains('sidebar-active')) {
                sidebar.classList.remove('sidebar-active');
                overlay.classList.remove('sidebar-overlay-active');
            } else {
                sidebar.classList.add('sidebar-active');
                overlay.classList.add('sidebar-overlay-active');
            }
        }
    </script>

</body>
</html>
