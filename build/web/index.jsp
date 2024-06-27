<%-- 
    Document   : index
    Created on : 26 jun. 2024, 00:20:20
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .background-gradient {
                border-radius: 56px; 
                padding: 0.3rem; 
                background: linear-gradient(180deg, var(--bs-primary) 10%, rgba(33, 150, 243, 0) 30%);
            }
            .card-custom {
                border-radius: 53px;
            }
            .custom-background {
                background-color: #f8f9fa; 
            }
        </style>
    </head>
    <body class="custom-background">
    <div class="d-flex align-items-center justify-content-center vh-100 vw-100 overflow-hidden">
        <div class="d-flex flex-column align-items-center justify-content-center">   
            <div class="background-gradient">
                <div class="w-100 bg-white py-8 px-5 sm:px-8 card-custom">
                    <div class="text-center mb-5">
                        <img src="assets/logo.png" alt="Image" height="100" class="mt-5 mb-4">
                        <div class="text-dark display-6 mb-3">Bienvenid@ a Cevichería La Chinita!</div>
                        <span class="text-muted">Iniciar sesión para continuar</span>
                    </div>
                    <form action="login" method="POST">
                        <div>
                            <label for="usuario" class="form-label h5 mb-2">Usuario</label>
                            <input id="usuario" name="usuario" type="text" placeholder="usuario" class="form-control mb-5" style="padding:1rem">

                            <label for="contrasena" class="form-label h5 mb-2">Contraseña</label>
                            <input id="contrasena" name="contrasena" type="password" placeholder="contraseña" class="form-control mb-5" style="padding:1rem">

                            <button type="submit" class="btn btn-primary btn-lg w-100 mb-5">Iniciar sesión</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
