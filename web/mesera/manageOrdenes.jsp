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
            margin-top: 180px;
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
                                    <a href="#"><i class="fa-solid fa-pen-to-square" style="color: blue;"></i></a>
                                </td>
                            </tr>
                            <tr>
                                <td>Chaufa de mariscos</td>
                                <td>2</td>
                                <td>25.00</td>
                                <td>
                                    <a href="#"><i class="fa-solid fa-trash" style="margin-right: 20px; color: red;"> </i></a>
                                    <a href="#"><i class="fa-solid fa-pen-to-square" style="color: blue;"></i></a>
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
                <p>ACÁ AÑADEN LO QUE FALTA XD</p>
            </div>
        </div>
    </div>



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
