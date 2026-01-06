<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdopterDashboard.aspx.cs" Inherits="SistemaAdopcionMascotas.AdopterDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard - Adoptante</title>
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
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.2);
        }
        
        .dashboard-card .card-header {
            border-radius: 10px 10px 0 0 !important;
            font-weight: 600;
        }
        
        .menu-link {
            border-radius: 8px;
            margin-bottom: 10px;
            transition: all 0.3s;
            border-left: 4px solid transparent;
        }
        
        .menu-link:hover {
            background-color: rgba(78, 115, 223, 0.1);
            border-left-color: var(--primary-color);
            transform: translateX(5px);
        }
        
        .menu-link.active {
            background-color: rgba(78, 115, 223, 0.15);
            border-left-color: var(--primary-color);
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .icon-circle {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .stats-card {
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .stats-card .number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stats-card .label {
            font-size: 0.9rem;
            opacity: 0.9;
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
                        <h1 class="h3 mb-0">Panel del Adoptante</h1>
                        <p class="mb-0">Bienvenido al sistema de adopción de mascotas</p>
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
                <div class="col-lg-4 mb-4">
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-menu-button-wide me-2"></i>Menú de Navegación</h5>
                        </div>
                        <div class="card-body">
                            <div class="list-group list-group-flush">
                                <a href="AdopterDashboard.aspx" class="list-group-item list-group-item-action menu-link active">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-primary bg-opacity-10">
                                            <i class="bi bi-house-door text-primary"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Dashboard</h6>
                                            <small class="text-muted">Resumen de actividades</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="VerSolicitudes.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-info bg-opacity-10">
                                            <i class="bi bi-clipboard-check text-info"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Ver Solicitudes</h6>
                                            <small class="text-muted">Estado de tus solicitudes</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="ReportarPerdido.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-warning bg-opacity-10">
                                            <i class="bi bi-exclamation-triangle text-warning"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Reportar Perdido</h6>
                                            <small class="text-muted">Reportar mascota perdida</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-danger bg-opacity-10">
                                            <i class="bi bi-search text-danger"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Ver Reportes Perdidos</h6>
                                            <small class="text-muted">Mascotas reportadas como perdidas</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="Donar.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-success bg-opacity-10">
                                            <i class="bi bi-heart text-success"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Donar</h6>
                                            <small class="text-muted">Apoya nuestra causa</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="Perfil.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-secondary bg-opacity-10">
                                            <i class="bi bi-person text-secondary"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Perfil</h6>
                                            <small class="text-muted">Administra tu cuenta</small>
                                        </div>
                                    </div>
                                </a>
                                <a href="Logout.aspx" class="list-group-item list-group-item-action menu-link">
                                    <div class="d-flex align-items-center">
                                        <div class="icon-circle bg-dark bg-opacity-10">
                                            <i class="bi bi-box-arrow-right text-dark"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Cerrar Sesión</h6>
                                            <small class="text-muted">Salir del sistema</small>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Main Dashboard Content -->
                <div class="col-lg-8">
                    <!-- Stats Cards -->
                    <div class="row mb-4">
                        <div class="col-md-6 col-lg-3">
                            <div class="stats-card bg-primary">
                                <div class="number">2</div>
                                <div class="label">Solicitudes Activas</div>
                                <i class="bi bi-clipboard-check mt-2 fs-4"></i>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="stats-card bg-success">
                                <div class="number">1</div>
                                <div class="label">Adopciones Completadas</div>
                                <i class="bi bi-check-circle mt-2 fs-4"></i>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="stats-card bg-info">
                                <div class="number">0</div>
                                <div class="label">Reportes Activos</div>
                                <i class="bi bi-exclamation-triangle mt-2 fs-4"></i>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="stats-card bg-warning">
                                <div class="number">$150</div>
                                <div class="label">Donaciones Totales</div>
                                <i class="bi bi-currency-dollar mt-2 fs-4"></i>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Recent Activity -->
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-activity me-2"></i>Actividad Reciente</h5>
                        </div>
                        <div class="card-body">
                            <div class="timeline">
                                <div class="d-flex mb-3">
                                    <div class="icon-circle bg-primary bg-opacity-10 me-3">
                                        <i class="bi bi-clipboard-check text-primary"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1">Solicitud de adopción aprobada</h6>
                                        <p class="mb-0 text-muted">Tu solicitud para adoptar a "Max" ha sido aprobada. ¡Felicidades!</p>
                                        <small class="text-muted">Hace 2 días</small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <div class="icon-circle bg-success bg-opacity-10 me-3">
                                        <i class="bi bi-heart text-success"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1">Donación realizada</h6>
                                        <p class="mb-0 text-muted">Has realizado una donación de $50. ¡Gracias por tu apoyo!</p>
                                        <small class="text-muted">Hace 5 días</small>
                                    </div>
                                </div>
                                <div class="d-flex mb-3">
                                    <div class="icon-circle bg-info bg-opacity-10 me-3">
                                        <i class="bi bi-clipboard-plus text-info"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1">Nueva solicitud enviada</h6>
                                        <p class="mb-0 text-muted">Has enviado una solicitud para adoptar a "Luna".</p>
                                        <small class="text-muted">Hace 1 semana</small>
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="icon-circle bg-warning bg-opacity-10 me-3">
                                        <i class="bi bi-person-check text-warning"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-1">Perfil actualizado</h6>
                                        <p class="mb-0 text-muted">Has actualizado la información de tu perfil.</p>
                                        <small class="text-muted">Hace 2 semanas</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Footer -->
            <div class="footer">
                <p class="mb-0">Sistema de Adopción de Mascotas &copy; 2023 - Todos los derechos reservados</p>
                <small>Plataforma diseñada para facilitar el proceso de adopción responsable</small>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Activar el elemento del menú correspondiente
        document.addEventListener('DOMContentLoaded', function() {
            const currentPage = window.location.pathname.split('/').pop();
            const menuLinks = document.querySelectorAll('.menu-link');
            
            menuLinks.forEach(link => {
                const linkHref = link.getAttribute('href');
                if (linkHref === currentPage) {
                    link.classList.add('active');
                } else {
                    link.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>
