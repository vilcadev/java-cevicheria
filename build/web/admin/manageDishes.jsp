<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<style>
    img {
        width: 60px;
    }
</style>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Gestionar Platillos</h1>
    <div class="mb-3">
        <button class="btn btn-success" data-toggle="modal" data-target="#addDisheModal">Agregar Platillo</button>
    </div>
    <table id="platillosTable" class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>Nombre</th>
            <th>ImagenUrl</th>
            <th>Categoria</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>

    <!-- Paginación -->
    <nav id="pagination" aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled" id="prevPage">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Anterior</a>
            </li>
            <li class="page-item active"><a class="page-link" href="#" data-page="1">1</a></li>
            <li class="page-item"><a class="page-link" href="#" data-page="2">2</a></li>
            <li class="page-item"><a class="page-link" href="#" data-page="3">3</a></li>
            <li class="page-item" id="nextPage">
                <a class="page-link" href="#">Siguiente</a>
            </li>
        </ul>
    </nav>
</div>

<!-- Modal Agregar Platillo -->
<div class="modal fade" id="addDisheModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryModalLabel">Nuevo Platillo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addPlatilloForm">
                    <div class="form-group">
                        <label for="platilloName">Nombre:</label>
                        <input type="text" class="form-control" id="Nombre" name="Nombre">
                    </div>
                    <div class="form-group">
                        <label for="platilloImageUrl">Imagen URL:</label>
                        <input type="text" class="form-control" id="imagenUrl" name="imagenUrl">
                    </div>
                    <div class="form-group">
                        <label for="platilloCategory">Categoría:</label>
                        <select class="form-control" id="CategoriaId" name="CategoriaId">
                            <!-- Options se llenarán mediante AJAX -->
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" id="addPlatilloBtn">Agregar Platillo</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Editar Platillo -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar Platillo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editPlatilloForm">
                    <input type="hidden" id="editPlatilloId" name="Id">
                    <div class="form-group">
                        <label for="editPlatilloName">Nombre:</label>
                        <input type="text" class="form-control" id="editPlatilloName" name="Nombre">
                    </div>
                    <div class="form-group">
                        <label for="editPlatilloImageUrl">Imagen URL:</label>
                        <input type="text" class="form-control" id="editPlatilloImageUrl" name="imagenUrl">
                    </div>
                    <div class="form-group">
                        <label for="editPlatilloCategory">Categoría:</label>
                        <select class="form-control" id="editPlatilloCategory" name="CategoriaId">
                            <!-- Options se llenarán mediante AJAX -->
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="saveEditBtn">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Eliminar Platillo -->
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


<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
    $(document).ready(function() {
        var currentPage = 1;
        var pageSize = 10;
        var platillos = [];

        // Función para cargar categorías desde el servidor
        function loadCategorias(selectElement, selectedCategoriaId) {
            $.ajax({
                url: '../listarCategorias', // Asegúrate de que esta URL sea correcta
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    var categoriaSelect = selectElement || $('#editPlatilloCategory');
                    categoriaSelect.empty();
                    $.each(data, function(index, categoria) {
                        categoriaSelect.append($('<option>', {
                            value: categoria.id,
                            text: categoria.nombre
                        }));
                    });
                    if (selectedCategoriaId) {
                        categoriaSelect.val(selectedCategoriaId);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al cargar las categorías:', error);
                }
            });
        }

        // Cargar categorías cuando se abre el modal de agregar
        $('#addDisheModal').on('show.bs.modal', function() {
            loadCategorias($('#CategoriaId'));
        });

        // Función para cargar platillos desde el servidor
        function loadPlatillos() {
            $.ajax({
                url: '../listarPlatillos', // Asegúrate de que esta URL sea correcta
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    platillos = data;
                    showPage(currentPage);
                },
                error: function(xhr, status, error) {
                    console.error('Error al cargar los platillos:', error);
                }
            });
        }

        // Función para mostrar una página específica
        function showPage(page) {
            var start = (page - 1) * pageSize;
            var end = start + pageSize;
            var pagePlatillos = platillos.slice(start, end);

            var tbody = $('#platillosTable tbody');
            tbody.empty();

            $.each(pagePlatillos, function(index, platillo) {
                var tr = $('<tr>');
                tr.append('<td>' + platillo.nombre + '</td>');
                tr.append('<td><img src="' + platillo.imagenUrl + '"></td>');
                tr.append('<td>' + platillo.categoriaId + '</td>');
                tr.append('<td><button class="btn btn-primary btn-sm editBtn" data-id="' + platillo.id + '"><i class="fas fa-pencil-alt"></i></button></td>');
                tr.append('<td><button class="btn btn-danger btn-sm deleteBtn" ><i class="fas fa-trash-alt"></i></button></td>');
                tbody.append(tr);
            });

            updatePagination(page);
        }

        // Función para actualizar la paginación
        function updatePagination(page) {
            currentPage = page;
            var totalPages = Math.ceil(platillos.length / pageSize);

            $('#pagination .page-item').removeClass('active');
            $('#pagination .page-item[data-page="' + page + '"]').addClass('active');

            if (page <= 1) {
                $('#prevPage').addClass('disabled');
            } else {
                $('#prevPage').removeClass('disabled');
            }

            if (page >= totalPages) {
                $('#nextPage').addClass('disabled');
            } else {
                $('#nextPage').removeClass('disabled');
            }

            // Actualizar los botones de página
            var paginationItems = $('#pagination .page-item').not('#prevPage, #nextPage');
            paginationItems.remove();

            for (var i = 1; i <= totalPages; i++) {
                var pageItem = $('<li class="page-item" data-page="' + i + '"><a class="page-link" href="#">' + i + '</a></li>');
                $('#nextPage').before(pageItem);
            }
        }

        // Eventos de paginación
        $('#pagination').on('click', '.page-link', function(e) {
            e.preventDefault();
            var page = $(this).parent().data('page');
            if (page && page !== currentPage) {
                showPage(page);
            }
        });

        // Cargar los platillos cuando se carga la página
        loadPlatillos();

        // Agregar Platillo
        $('#addPlatilloBtn').click(function() {
            var formData = $('#addPlatilloForm').serialize();
            formData += '&action=create';
            $.ajax({
                url: '../listarPlatillos',
                method: 'POST',
                data: formData,
                success: function(response) {
                    $('#addDisheModal').modal('hide');
                    loadPlatillos();
                },
                error: function(xhr, status, error) {
                    console.error('Error al agregar el platillo:', error);
                }
            });
        });

        // Configurar modal de edición
        function setEditModalData(id, nombre, imagenUrl, categoriaId) {
            $('#editPlatilloId').val(id);
            $('#editPlatilloName').val(nombre);
            $('#editPlatilloImageUrl').val(imagenUrl);
            $('#editPlatilloCategory').val(categoriaId);
        }

        // Evento para abrir modal de edición
        $('#platillosTable').on('click', '.editBtn', function() {
            var platilloId = $(this).data('id');
            var platillo = platillos.find(p => p.id === platilloId);
            if (platillo) {
                // Capturar la URL de la imagen del platillo
                var imagenUrl = $(this).closest('tr').find('img').attr('src');
                setEditModalData(platillo.id, platillo.nombre, imagenUrl, platillo.categoriaId);
                loadCategorias($('#editPlatilloCategory'), platillo.categoriaId); // Cargar categorías en el select de edición y seleccionar la categoría correcta
                $('#editModal').modal('show');
            }
        });

        // Evento para guardar los cambios de edición
        $('#saveEditBtn').on('click', function() {
            var formData = $('#editPlatilloForm').serialize();
            formData += '&action=update';

            $.ajax({
                url: '../listarPlatillos',
                method: 'POST',
                data: formData,
                success: function(response) {
                    $('#editModal').modal('hide');
                    loadPlatillos();
                },
                error: function(xhr, status, error) {
                    console.error('Error al actualizar el platillo:', error);
                }
            });
        });

         // Evento para abrir modal de eliminación
    $('#platillosTable').on('click', '.deleteBtn', function() {
        var platilloId = $(this).data('id');
        $('#confirmDeleteBtn').data('id', platilloId); // Guardar el id en el botón de confirmación
        $('#deleteModal').modal('show');
    });
    
      // Evento para confirmar la eliminación
    $('#confirmDeleteBtn').on('click', function() {
        var platilloId = $(this).data('id');
        $.ajax({
            url: '../listarPlatillos',
            method: 'POST',
            data: { Id: platilloId, action: 'delete' },
            success: function(response) {
                $('#deleteModal').modal('hide');
                loadPlatillos();
            },
            error: function(xhr, status, error) {
                console.error('Error al eliminar el platillo:', error);
            }
        });
    });
    });
</script>
</body>
</html>
