<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerSolicitudes.aspx.cs" Inherits="SistemaAdopcionMascotas.VerSolicitudes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Mis Solicitudes - Sistema de Adopción</title>
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
            transition: all 0.3s;
            margin-bottom: 25px;
        }
        
        .dashboard-card .card-header {
            border-radius: 10px 10px 0 0 !important;
            font-weight: 600;
        }
        
        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .status-pending {
            background-color: rgba(246, 194, 62, 0.2);
            color: #856404;
        }
        
        .status-approved {
            background-color: rgba(28, 200, 138, 0.2);
            color: #155724;
        }
        
        .status-rejected {
            background-color: rgba(231, 74, 59, 0.2);
            color: #721c24;
        }
        
        .status-review {
            background-color: rgba(54, 185, 204, 0.2);
            color: #0c5460;
        }
        
        .pet-card {
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            border: 1px solid #e3e6f0;
        }
        
        .pet-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .pet-image {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }
        
        .btn-custom {
            border-radius: 8px;
            font-weight: 600;
            padding: 10px 20px;
            transition: all 0.3s;
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
                        <h1 class="h3 mb-0">Mis Solicitudes de Adopción</h1>
                        <p class="mb-0">Revisa el estado de tus solicitudes de adopción</p>
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
                                <a href="VerSolicitudes.aspx" class="list-group-item list-group-item-action active">
                                    <i class="bi bi-clipboard-check me-2"></i>Ver Solicitudes
                                </a>
                                <a href="ReportarPerdido.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-exclamation-triangle me-2"></i>Reportar Perdido
                                </a>
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action">
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
                </div>
                
                <!-- Main Content -->
                <div class="col-lg-9">
                    <!-- Filter and Stats -->
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-outline-primary active">Todas</button>
                                <button type="button" class="btn btn-outline-primary">Pendientes</button>
                                <button type="button" class="btn btn-outline-primary">Aprobadas</button>
                                <button type="button" class="btn btn-outline-primary">Rechazadas</button>
                            </div>
                        </div>
                        <div class="col-md-4 text-md-end">
                            <a href="#" class="btn btn-primary">
                                <i class="bi bi-plus-circle me-1"></i>Nueva Solicitud
                            </a>
                        </div>
                    </div>
                    
                    <!-- Application List -->
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-list-ul me-2"></i>Solicitudes de Adopción</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Mascota</th>
                                            <th>Fecha Solicitud</th>
                                            <th>Estado</th>
                                            <th>Última Actualización</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="me-3">
                                                        <div class="rounded-circle overflow-hidden" style="width: 50px; height: 50px;">
                                                            <img src="https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" 
                                                                 class="img-fluid" alt="Max" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <h6 class="mb-0">Max</h6>
                                                        <small class="text-muted">Labrador, 2 años</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>15/06/2023</td>
                                            <td>
                                                <span class="status-badge status-approved">Aprobada</span>
                                            </td>
                                            <td>20/06/2023</td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary">
                                                    <i class="bi bi-eye"></i> Ver
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="me-3">
                                                        <div class="rounded-circle overflow-hidden" style="width: 50px; height: 50px;">
                                                            <img src="https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" 
                                                                 class="img-fluid" alt="Luna" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <h6 class="mb-0">Luna</h6>
                                                        <small class="text-muted">Gato siamés, 1 año</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>10/07/2023</td>
                                            <td>
                                                <span class="status-badge status-review">En Revisión</span>
                                            </td>
                                            <td>12/07/2023</td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary">
                                                    <i class="bi bi-eye"></i> Ver
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="me-3">
                                                        <div class="rounded-circle overflow-hidden" style="width: 50px; height: 50px;">
                                                            <img src="https://images.unsplash.com/photo-1596492784531-6e6eb5ea9993?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=100&q=80" 
                                                                 class="img-fluid" alt="Rocky" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <h6 class="mb-0">Rocky</h6>
                                                        <small class="text-muted">Bulldog, 3 años</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>01/06/2023</td>
                                            <td>
                                                <span class="status-badge status-rejected">Rechazada</span>
                                            </td>
                                            <td>05/06/2023</td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary">
                                                    <i class="bi bi-eye"></i> Ver
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <!-- Empty State -->
                            <div class="text-center py-5 d-none">
                                <div class="mb-3">
                                    <i class="bi bi-clipboard-x text-muted" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="text-muted">No tienes solicitudes de adopción</h4>
                                <p class="text-muted">Comienza buscando una mascota para adoptar</p>
                                <a href="#" class="btn btn-primary">
                                    <i class="bi bi-search me-1"></i>Buscar Mascotas
                                </a>
                            </div>
                        </div>
                    </div>
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
