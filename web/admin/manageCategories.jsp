<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Categorías Platillos</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Gestionar Categorías Platillos</h1>
        <div class="mb-3">
            <button class="btn btn-success" data-toggle="modal" data-target="#addCategoryModal">Agregar Categoría</button>
        </div>
        <table id="platillosTable" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>
                        Platillo
                        <button class="btn btn-link p-0 ml-2" onclick="sortTable(0)">
                            <i class="fas fa-sort"></i>
                        </button>
                    </th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <!-- Filas de ejemplo -->
                <tr>
                    <td>Ejemplo Platillo 1</td>
                    <td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>
                </tr>
                <tr>
                    <td>Ejemplo Platillo 2</td>
                    <td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>
                </tr>
                <tr>
                    <td>Ejemplo Platillo 3</td>
                    <td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>
                </tr>
                <tr>
                    <td>Ejemplo Platillo 4</td>
                    <td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>
                </tr>
                <tr>
                    <td>Ejemplo Platillo 5</td>
                    <td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>
                    <td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>
                </tr>
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

    <!-- Modal Agregar Categoría -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCategoryModalLabel">Nueva Categoría</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="categoryName">Nombre:</label>
                            <input type="text" class="form-control" id="categoryName">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success">Agregar Categoría</button>
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
                    <form>
                        <div class="form-group">
                            <label for="editPlatilloName">Nombre:</label>
                            <input type="text" class="form-control" id="editPlatilloName">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
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
                    <button type="button" class="btn btn-danger">Sí</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        $(document).ready(function() {
            // Páginas de datos simulados (puedes cargar desde una fuente de datos real)
            var dataPages = [
                [
                    { platillo: "Ejemplo Platillo 1" },
                    { platillo: "Ejemplo Platillo 2" },
                    { platillo: "Ejemplo Platillo 3" },
                    { platillo: "Ejemplo Platillo 4" },
                    { platillo: "Ejemplo Platillo 5" }
                ],
                [
                    { platillo: "Ejemplo Platillo 6" },
                    { platillo: "Ejemplo Platillo 7" },
                    { platillo: "Ejemplo Platillo 8" },
                    { platillo: "Ejemplo Platillo 9" },
                    { platillo: "Ejemplo Platillo 10" }
                ],
                [
                    { platillo: "Ejemplo Platillo 11" },
                    { platillo: "Ejemplo Platillo 12" },
                    { platillo: "Ejemplo Platillo 13" },
                    { platillo: "Ejemplo Platillo 14" },
                    { platillo: "Ejemplo Platillo 15" }
                ]
            ];

            var currentPage = 1;
            var rowsPerPage = 5;
            var totalPages = Math.ceil(dataPages.length);

            // Función para mostrar los platillos en la tabla según la página actual
            function showPlatillos(page) {
                var startIndex = (page - 1) * rowsPerPage;
                var endIndex = startIndex + rowsPerPage;
                var platillos = dataPages[page - 1];

                var tbody = $('#platillosTable tbody');
                tbody.empty();

                $.each(platillos, function(index, platillo) {
                    var tr = $('<tr>');
                    tr.append('<td>' + platillo.platillo + '</td>');
                    tr.append('<td><button class="btn btn-primary btn-sm editBtn"><i class="fas fa-pencil-alt"></i></button></td>');
                    tr.append('<td><button class="btn btn-danger btn-sm deleteBtn"><i class="fas fa-trash-alt"></i></button></td>');
                    tbody.append(tr);
                });
            }

            // Mostrar la primera página al cargar la página
            showPlatillos(currentPage);

            // Función para actualizar la paginación
            function updatePagination() {
                $('#pagination .page-item').removeClass('active');
                $('#pagination .page-item').removeClass('disabled');

                if (currentPage === 1) {
                    $('#prevPage').addClass('disabled');
                }

                if (currentPage === totalPages) {
                    $('#nextPage').addClass('disabled');
                }

                $('#pagination').find('[data-page="' + currentPage + '"]').parent().addClass('active');
            }

            // Evento de click para cambiar de página
            $('#pagination .page-link').on('click', function(e) {
                e.preventDefault();
                var page = parseInt($(this).attr('data-page'));
                if (page !== currentPage && page >= 1 && page <= totalPages) {
                    currentPage = page;
                    showPlatillos(currentPage);
                    updatePagination();
                }
            });

            // Evento de click para página anterior
            $('#prevPage').on('click', function(e) {
                e.preventDefault();
                if (currentPage > 1) {
                    currentPage--;
                    showPlatillos(currentPage);
                    updatePagination();
                }
            });

            // Evento de click para página siguiente
            $('#nextPage').on('click', function(e) {
                e.preventDefault();
                if (currentPage < totalPages) {
                    currentPage++;
                    showPlatillos(currentPage);
                    updatePagination();
                }
            });

            // Lógica para ordenar la tabla
            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("platillosTable");
                switching = true;
                dir = "asc";
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        switchcount++;
                    } else {
                        if (switchcount == 0 && dir == "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }

            // Configurar modal de edición
            function setEditModalData(name) {
                $('#editPlatilloName').val(name);
            }

            // Evento para abrir modal de edición
            $('#platillosTable').on('click', '.editBtn', function() {
                var platilloName = $(this).closest('tr').find('td:first').text();
                setEditModalData(platilloName);
                $('#editModal').modal('show');
            });

            // Evento para abrir modal de eliminación
            $('#platillosTable').on('click', '.deleteBtn', function() {
                $('#deleteModal').modal('show');
            });
        });
    </script>
</body>
</html>
