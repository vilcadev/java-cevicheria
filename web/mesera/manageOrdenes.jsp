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
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí van los elementos de la tabla -->
                            <tr>
                                <td>Ceviche</td>
                                <td>1</td>
                                <td>25.00</td>
                                <td>
                                    <a href="#"><i class="fa-solid fa-trash" style="margin-right: 20px; color: red;"> </i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Chaufa de mariscos</td>
                                <td>2</td>
                                <td>25.00</td>
                                <td>
                                    <a href="#"><i class="fa-solid fa-trash" style="margin-right: 20px; color: red;"> </i></a>
                                </td>
                            </tr>
                            
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
                            <button class="btn btn-outline-secondary" type="button">
                                <i class="fas fa-sync-alt"></i>
                            </button>
                        </div>
                    </div>
                    <div>
                        <div class="menu">
                            <div class="item">
                                <div class="price">S/ 25</div>
                                <img src="https://www.elespectador.com/resizer/tyGJPN_YmWpagQFeXq_YYOxAKjY=/arc-anglerfish-arc2-prod-elespectador/public/2AVD5Z6Y2ZFWHETPQGCPLMNK4A.jpg" alt="ceviche">
                                <div class="name">ceviche</div>
                            </div>
                            <div class="item">
                                <div class="price">S/ 25</div>
                                <img src="https://buenazo.cronosmedia.glr.pe/original/2021/09/16/6143e231d4bfcf3c4448e32e.jpg" alt="arroz chaufa">
                                <div class="name">Chaufa de mariscos</div>
                            </div>
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
                    <label for="boleta">Boleta</label>
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
                        <p style="text-align: right;"><b>Total: S/50.00</b></p>
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
