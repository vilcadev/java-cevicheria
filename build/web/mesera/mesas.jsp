<%-- 
    Document   : mesas
    Created on : 27 jun 2024, 0:16:52
    Author     : Erick Joeseth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cevicheria La Chinita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
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

        .card {
            background-color: rgb(233, 233, 233);
            width: 200px;
            padding-top: 180px;
            border: 3px solid rgb(228, 227, 227);
            position: relative;
            /* Asegura que el contenido no sobresalga */
        }

        .card-mesa2 {
            background-color: rgb(233, 233, 233);
            width: 200px;
            padding-top: 180px;
            border: 3px solid rgb(70, 255, 101);
            border-radius: 6px;
            position: relative;
        }

        .card-mesa2:hover {
            filter: brightness(0.9);
        }

        .card-mesa3 {
            background-color: rgb(255, 246, 226);
            width: 200px;
            padding-top: 180px;
            border: 3px solid rgb(255, 190, 70);
            border-radius: 6px;
            position: relative;
        }

        .card-mesa3:hover {
            filter: brightness(0.9);
        }

        .card-body {
            position: absolute;
            /* Coloca el contenido en la parte superior */
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card:hover {
            filter: brightness(0.9);
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
            <a href="../index.jsp"><button class="btn btn-link mt-3" >Salir</button></a> 
        </div>
    </div>

    <div class="sidebar-overlay" id="sidebar-overlay" onclick="toggleSidebar()"></div>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-3 mb-4">
                <a href="manageOrdenes.jsp" style="text-decoration: none;">
                    <div class="card">
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h5 class="card-title">Mesa 1</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">

                <a  href="manageOrdenes.jsp" style="text-decoration: none;">

                    <div class="card-mesa2" style="color: black;">

                        <div class="card-body d-flex align-items-center justify-content-center"
                            style="background-color: rgb(222, 255, 230);">
                            <h5 class="card-title">Mesa 2</h5>
                        </div>
                    </div>
                </a>



            </div>
            <div class="col-md-3 mb-4">
                <a  href="manageOrdenes.jsp"style="text-decoration: none;">
                    <div class="card-mesa3" style="color: black;">
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h5 class="card-title">Mesa 3</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a  href="manageOrdenes.jsp" style="text-decoration: none;">
                    <div class="card">
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h5 class="card-title">Mesa 4</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a  href="manageOrdenes.jsp" style="text-decoration: none;">
                    <div class="card">
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h5 class="card-title">Mesa 5</h5>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a  href="manageOrdenes.jsp" style="text-decoration: none;">
                    <div class="card">
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <h5 class="card-title">Mesa 6</h5>
                        </div>
                    </div>
                </a>
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
