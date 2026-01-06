<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerReportesPerdidos.aspx.cs" Inherits="SistemaAdopcionMascotas.VerReportesPerdidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Mascotas Perdidas - Sistema de Adopción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #858796;
            --success-color: #1cc88a;
            --info-color: #36b9cc;
            --warning-color: #f6c23e;
            --danger-color: #e74a3b;
            --light-color: #f8f9fc;
            --dark-color: #5a5c69;
        }
        
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .dashboard-header {
            background: linear-gradient(90deg, var(--primary-color) 0%, #2e59d9 100%);
            color: white;
            border-radius: 10px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-bottom: 30px;
        }
        
        .dashboard-card {
            border: 0;
            border-radius: 10px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-bottom: 25px;
        }
        
        .dashboard-card .card-header {
            border-radius: 10px 10px 0 0 !important;
            font-weight: 600;
        }
        
        .lost-pet-card {
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            border: 1px solid #e3e6f0;
            height: 100%;
        }
        
        .lost-pet-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .pet-image-container {
            height: 200px;
            overflow: hidden;
        }
        
        .pet-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .lost-pet-card:hover .pet-image {
            transform: scale(1.05);
        }
        
        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .status-lost {
            background-color: rgba(231, 74, 59, 0.2);
            color: #721c24;
        }
        
        .status-found {
            background-color: rgba(28, 200, 138, 0.2);
            color: #155724;
        }
        
        .btn-custom {
            border-radius: 8px;
            font-weight: 600;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        
        .search-box {
            position: relative;
        }
        
        .search-box .form-control {
            padding-left: 45px;
            border-radius: 8px;
        }
        
        .search-box .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            color: var(--secondary-color);
            border-top: 1px solid #e3e6f0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Header -->
            <div class="dashboard-header p-4 mb-4">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h1 class="h3 mb-0">Mascotas Reportadas como Perdidas</h1>
                        <p class="mb-0">Ayuda a reunir a las mascotas perdidas con sus familias</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <div class="d-inline-flex align-items-center">
                            <div class="me-3">
                                <asp:Label ID="lblUserName" runat="server" Text="Juan Pérez" CssClass="fw-bold"></asp:Label>
                            </div>
                            <div class="icon-circle bg-light">
                                <i class="bi bi-person-fill text-primary fs-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Main Content -->
            <div class="row">
                <!-- Sidebar Menu -->
                <div class="col-lg-3 mb-4">
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-menu-button-wide me-2"></i>Menú</h5>
                        </div>
                        <div class="card-body">
                            <div class="list-group list-group-flush">
                                <a href="AdopterDashboard.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-house-door me-2"></i>Dashboard
                                </a>
                                <a href="VerSolicitudes.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-clipboard-check me-2"></i>Ver Solicitudes
                                </a>
                                <a href="ReportarPerdido.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-exclamation-triangle me-2"></i>Reportar Perdido
                                </a>
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action active">
                                    <i class="bi bi-search me-2"></i>Ver Reportes Perdidos
                                </a>
                                <a href="Donar.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-heart me-2"></i>Donar
                                </a>
                                <a href="Perfil.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-person me-2"></i>Perfil
                                </a>
                                <a href="Logout.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-box-arrow-right me-2"></i>Cerrar Sesión
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Filter Sidebar -->
                    <div class="dashboard-card mt-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-funnel me-2"></i>Filtrar Resultados</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Tipo de Mascota</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="filterDog" checked />
                                    <label class="form-check-label" for="filterDog">
                                        Perros
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="filterCat" checked />
                                    <label class="form-check-label" for="filterCat">
                                        Gatos
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="filterOther" />
                                    <label class="form-check-label" for="filterOther">
                                        Otros
                                    </label>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Estado</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="filterLost" checked />
                                    <label class="form-check-label" for="filterLost">
                                        Perdido
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="filterFound" />
                                    <label class="form-check-label" for="filterFound">
                                        Encontrado
                                    </label>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="filterLocation" class="form-label">Ubicación</label>
                                <input type="text" class="form-control" id="filterLocation" placeholder="Ciudad, Colonia" />
                            </div>
                            
                            <div class="mb-3">
                                <label for="filterDate" class="form-label">Fecha de reporte</label>
                                <select class="form-select" id="filterDate">
                                    <option value="all">Cualquier fecha</option>
                                    <option value="today">Hoy</option>
                                    <option value="week">Esta semana</option>
                                    <option value="month">Este mes</option>
                                </select>
                            </div>
                            
                            <button type="button" class="btn btn-primary w-100">
                                <i class="bi bi-funnel me-1"></i>Aplicar Filtros
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Main Content -->
                <div class="col-lg-9">
                    <!-- Search and Stats -->
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <div class="search-box">
                                <i class="bi bi-search search-icon"></i>
                                <input type="text" class="form-control" placeholder="Buscar mascotas perdidas por nombre, raza, ubicación..." />
                            </div>
                        </div>
                        <div class="col-md-4 text-md-end">
                            <div class="d-inline-flex align-items-center bg-white p-3 rounded shadow-sm">
                                <div class="me-3">
                                    <i class="bi bi-exclamation-triangle text-warning fs-4"></i>
                                </div>
                                <div>
                                    <div class="fw-bold">12</div>
                                    <div class="small text-muted">Mascotas perdidas</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Lost Pets Grid -->
                    <div class="row">
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="lost-pet-card">
                                <div class="pet-image-container">
                                    <img src="https://images.unsplash.com/photo-1596492784531-6e6eb5ea9993?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" 
                                         class="pet-image" alt="Rocky" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div>
                                            <h5 class="mb-0">Rocky</h5>
                                            <p class="text-muted small mb-0">Bulldog, 3 años</p>
                                        </div>
                                        <span class="status-badge status-lost">Perdido</span>
                                    </div>
                                    <p class="small text-muted mb-2">
                                        <i class="bi bi-geo-alt me-1"></i>Colonia Centro, Ciudad
                                    </p>
                                    <p class="small text-muted mb-3">
                                        <i class="bi bi-calendar me-1"></i>Perdido el 05/07/2023
                                    </p>
                                    <p class="small mb-3">Se perdió cerca del parque central. Tiene un collar marrón con una chapita con su nombre.</p>
                                    <div class="d-flex justify-content-between">
                                        <button class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-eye me-1"></i>Ver detalles
                                        </button>
                                        <button class="btn btn-sm btn-outline-success">
                                            <i class="bi bi-telephone me-1"></i>Contactar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="lost-pet-card">
                                <div class="pet-image-container">
                                    <img src="https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" 
                                         class="pet-image" alt="Mimi" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div>
                                            <h5 class="mb-0">Mimi</h5>
                                            <p class="text-muted small mb-0">Gato persa, 2 años</p>
                                        </div>
                                        <span class="status-badge status-lost">Perdido</span>
                                    </div>
                                    <p class="small text-muted mb-2">
                                        <i class="bi bi-geo-alt me-1"></i>Zona Norte, Ciudad
                                    </p>
                                    <p class="small text-muted mb-3">
                                        <i class="bi bi-calendar me-1"></i>Perdido el 10/07/2023
                                    </p>
                                    <p class="small mb-3">Gato de color blanco con ojos azules. Muy tímido pero cariñoso con personas conocidas.</p>
                                    <div class="d-flex justify-content-between">
                                        <button class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-eye me-1"></i>Ver detalles
                                        </button>
                                        <button class="btn btn-sm btn-outline-success">
                                            <i class="bi bi-telephone me-1"></i>Contactar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="lost-pet-card">
                                <div class="pet-image-container">
                                    <img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" 
                                         class="pet-image" alt="Toby" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <div>
                                            <h5 class="mb-0">Toby</h5>
                                            <p class="text-muted small mb-0">Golden Retriever, 4 años</p>
                                        </div>
                                        <span class="status-badge status-found">Encontrado</span>
                                    </div>
                                    <p class="small text-muted mb-2">
                                        <i class="bi bi-geo-alt me-1"></i>Parque Industrial, Ciudad
                                    </p>
                                    <p class="small text-muted mb-3">
                                        <i class="bi bi-calendar me-1"></i>Encontrado el 12/07/2023
                                    </p>
                                    <p class="small mb-3">Encontrado cerca del parque industrial. Es muy amigable y sabe comandos básicos.</p>
                                    <div class="d-flex justify-content-between">
                                        <button class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-eye me-1"></i>Ver detalles
                                        </button>
                                        <button class="btn btn-sm btn-outline-success">
                                            <i class="bi bi-telephone me-1"></i>Contactar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Anterior</a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Siguiente</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            
            <!-- Footer -->
            <div class="footer">
                <p class="mb-0">Sistema de Adopción de Mascotas &copy; 2023</p>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
