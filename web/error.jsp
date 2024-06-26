<%-- 
    Document   : error
    Created on : 26 jun. 2024, 13:13:12
    Author     : sande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .background-gradient {
                border-radius: 56px; 
                padding: 0.3rem; 
                background: linear-gradient(180deg, var(--bs-danger) 10%, rgba(33, 150, 243, 0) 30%);
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
                <img src="assets/logo.png" alt="Cevicheria logo" class="mb-5 w-6rem flex-shrink-0" height="100">
                <div class="background-gradient">
                    <div class="w-100 bg-white py-8 px-5 sm:px-8 card-custom">
                        <div class="text-center mb-5">
                            <img src="assets/error.png" alt="Image" height="50" class="mt-5 mb-4">
                            <h1 class="text-900 font-bold text-5xl mb-2">Se ha producido un error</h1>
                            <p class="text-muted">El recurso solicitado no está disponible.</p>
                            
                            <img src="assets/asset-error.svg" alt="Error" class="mb-5" style="width: 80%;">
                            <a href="/cevicheriaweb/" class="btn btn btn-light btn-lg mb-5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0"/>
                                </svg>
                                Go to Dashboard
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
