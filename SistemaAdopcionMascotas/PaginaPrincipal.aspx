<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs"
    Inherits="SistemaAdopcionMascotas.PaginaPrincipal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Centro de Adopción de Mascotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #2196F3;
            --accent-color: #FF9800;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        
        /* Header Styles */
        .main-header {
            background: linear-gradient(rgba(76, 175, 80, 0.9), rgba(76, 175, 80, 0.8)), 
                        url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 0 40px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        
        .logo-container {
            margin-bottom: 30px;
        }
        
        .logo-icon {
            font-size: 4rem;
            color: white;
            margin-bottom: 15px;
            filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.3));
        }
        
        .site-title {
            font-size: 3.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            margin-bottom: 10px;
        }
        
        .site-subtitle {
            font-size: 1.3rem;
            opacity: 0.9;
            margin-bottom: 30px;
        }
        
        /* Main Content */
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .card-custom {
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 25px;
            overflow: hidden;
        }
        
        .card-custom:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, var(--primary-color), #45a049);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        /* Search Section */
        .search-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .search-box {
            position: relative;
        }
        
        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 5;
        }
        
        /* Login Form */
        .login-section {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        .login-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .form-control-custom {
            border-radius: 10px;
            padding: 12px 20px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
        
        .form-control-custom:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
        }
        
        .btn-custom {
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
        }
        
        .btn-primary-custom {
            background: linear-gradient(135deg, var(--primary-color), #45a049);
            color: white;
        }
        
        .btn-primary-custom:hover {
            background: linear-gradient(135deg, #45a049, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }
        
        .btn-secondary-custom {
            background: linear-gradient(135deg, #6c757d, #5a6268);
            color: white;
        }
        
        /* Social Media */
        .social-section {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .social-icon {
            font-size: 1.5rem;
            margin-right: 10px;
        }
        
        .social-btn {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            margin-bottom: 15px;
            border-radius: 10px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            width: 100%;
        }
        
        .social-btn:hover {
            transform: translateX(5px);
            text-decoration: none;
            color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .social-fb { background: linear-gradient(135deg, #3b5998, #8b9dc3); }
        .social-yt { background: linear-gradient(135deg, #ff0000, #ff6b6b); }
        .social-tt { background: linear-gradient(135deg, #000000, #4a4a4a); }
        .social-ig { background: linear-gradient(135deg, #E1306C, #fd79a8); }
        
        /* Results Grid */
        .results-grid {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .grid-header {
            background: linear-gradient(135deg, var(--secondary-color), #1976D2);
            color: white;
            border-radius: 10px 10px 0 0;
            padding: 15px;
            font-weight: 600;
        }
        
        /* Footer */
        .main-footer {
            background: linear-gradient(135deg, var(--dark-color), #212529);
            color: white;
            padding: 60px 0 30px;
            margin-top: 50px;
        }
        
        .footer-title {
            color: white;
            font-size: 1.3rem;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .contact-info {
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .contact-icon {
            font-size: 1.5rem;
            color: var(--accent-color);
            margin-right: 10px;
        }
        
        .map-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            margin: 20px 0;
        }
        
        .map-container iframe {
            width: 100%;
            height: 300px;
            border: none;
        }
        
        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 20px;
            margin-top: 30px;
            text-align: center;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .main-header {
                padding: 40px 0 20px;
            }
            
            .site-title {
                font-size: 2.5rem;
            }
            
            .logo-icon {
                font-size: 3rem;
            }
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .fade-in {
            animation: fadeIn 0.8s ease-out;
        }
        
        /* Pet Cards */
        .pet-card {
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
        }
        
        .pet-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .pet-image {
            height: 180px;
            object-fit: cover;
            width: 100%;
        }
        
        /* Stats */
        .stats-box {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 5px;
        }
        
        .stats-label {
            font-size: 0.9rem;
            color: #6c757d;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="main-header text-center fade-in">
            <div class="container">
                <div class="logo-container">
                    <i class="bi bi-heart-fill logo-icon"></i>
                    <h1 class="site-title">Centro de Adopción de Mascotas</h1>
                    <p class="site-subtitle">Un hogar lleno de amor para cada mascota</p>
                </div>
                
                <!-- Stats Section -->
                <div class="row justify-content-center mb-4">
                    <div class="col-md-2 col-6">
                        <div class="stats-box">
                            <div class="stats-number" id="lblTotalMascotas" runat="server">150+</div>
                            <div class="stats-label">Mascotas</div>
                        </div>
                    </div>
                    <div class="col-md-2 col-6">
                        <div class="stats-box">
                            <div class="stats-number" id="lblAdopciones" runat="server">89</div>
                            <div class="stats-label">Adopciones</div>
                        </div>
                    </div>
                    <div class="col-md-2 col-6">
                        <div class="stats-box">
                            <div class="stats-number" id="lblVoluntarios" runat="server">25</div>
                            <div class="stats-label">Voluntarios</div>
                        </div>
                    </div>
                    <div class="col-md-2 col-6">
                        <div class="stats-box">
                            <div class="stats-number" id="lblAnios" runat="server">5+</div>
                            <div class="stats-label">Años</div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="main-container">
            <div class="row">
                <!-- Left Column: Social Media & Quick Links -->
                <div class="col-lg-4 mb-4">
                    <!-- Social Media Section -->
                    <div class="social-section fade-in">
                        <h4 class="card-header-custom mb-4 text-center">
                            <i class="bi bi-share-fill me-2"></i>Síguenos
                        </h4>
                        <a href="https://www.facebook.com" class="social-btn social-fb" target="_blank">
                            <i class="bi bi-facebook social-icon"></i>
                            Facebook
                        </a>
                        <a href="https://www.youtube.com" class="social-btn social-yt" target="_blank">
                            <i class="bi bi-youtube social-icon"></i>
                            YouTube
                        </a>
                        <a href="https://www.tiktok.com" class="social-btn social-tt" target="_blank">
                            <i class="bi bi-tiktok social-icon"></i>
                            TikTok
                        </a>
                        <a href="https://www.instagram.com" class="social-btn social-ig" target="_blank">
                            <i class="bi bi-instagram social-icon"></i>
                            Instagram
                        </a>
                    </div>

                    <!-- Quick Links -->
                    <div class="card-custom mt-4">
                        <div class="card-header-custom">
                            <i class="bi bi-lightning-fill me-2"></i>Acceso Rápido
                        </div>
                        <div class="card-body">
                            <div class="list-group list-group-flush">
                                <a href="VerSolicitudes.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-clipboard-check me-2 text-primary"></i>Ver Adopciones
                                </a>
                                <a href="Donar.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-heart me-2 text-danger"></i>Hacer una Donación
                                </a>
                                <a href="ReportarPerdido.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-exclamation-triangle me-2 text-warning"></i>Reportar Perdido
                                </a>
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-search me-2 text-info"></i>Mascotas Perdidas
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Main Content -->
                <div class="col-lg-8">
                    <!-- Search Section -->
                    <div class="search-section fade-in">
                        <h3 class="text-center mb-4" style="color: var(--primary-color);">
                            <i class="bi bi-search me-2"></i>Encuentra a tu compañero perfecto
                        </h3>
                        <div class="row align-items-center">
                            <div class="col-md-8 mb-3 mb-md-0">
                                <div class="search-box">
                                    <i class="bi bi-search search-icon"></i>
                                    <asp:TextBox ID="txtBuscar" runat="server" 
                                        CssClass="form-control form-control-custom ps-5" 
                                        Placeholder="Buscar por nombre, tipo o raza (ej. perro labrador, gato siamés)">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnBuscar" runat="server" 
                                    Text="Buscar Mascotas" 
                                    CssClass="btn btn-primary-custom btn-custom w-100"
                                    OnClick="btnBuscar_Click" />
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="d-flex flex-wrap justify-content-center">
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Perros</span>
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Gatos</span>
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Cachorros</span>
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Adultos</span>
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Juguetones</span>
                                    <span class="badge bg-secondary me-2 mb-2 p-2">Tranquilos</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Results Section -->
                    <div class="results-grid fade-in">
                        <h4 class="mb-4" style="color: var(--secondary-color);">
                            <i class="bi bi-list-ul me-2"></i>Mascotas Disponibles
                        </h4>
                        
                        <!-- Featured Pets -->
                        <div class="row mb-4">
                            <div class="col-md-4 mb-3">
                                <div class="pet-card">
                                    <img src="https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" 
                                         class="pet-image" alt="Max" />
                                    <div class="p-3">
                                        <h5>Max</h5>
                                        <p class="text-muted small">Labrador, 2 años</p>
                                        <span class="badge bg-success">Disponible</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="pet-card">
                                    <img src="https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" 
                                         class="pet-image" alt="Luna" />
                                    <div class="p-3">
                                        <h5>Luna</h5>
                                        <p class="text-muted small">Gato Siamés, 1 año</p>
                                        <span class="badge bg-success">Disponible</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="pet-card">
                                    <img src="https://images.unsplash.com/photo-1514888286974-6d03bdeacba8?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" 
                                         class="pet-image" alt="Simba" />
                                    <div class="p-3">
                                        <h5>Simba</h5>
                                        <p class="text-muted small">Persa, 3 años</p>
                                        <span class="badge bg-warning">En proceso</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Results GridView -->
                        <asp:GridView ID="gvResultados" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="table table-hover" 
                            GridLines="None">
                            <HeaderStyle CssClass="grid-header" />
                            <Columns>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="Edad" HeaderText="Edad" />
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <span class="badge bg-success">Disponible</span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        
                        <!-- Empty State -->
                        <div id="divNoResults" runat="server" class="text-center py-5" visible="false">
                            <i class="bi bi-search display-4 text-muted mb-3"></i>
                            <h4 class="text-muted">No se encontraron resultados</h4>
                            <p class="text-muted">Intenta con otros términos de búsqueda</p>
                        </div>
                    </div>

                    <!-- Login Section -->
                    <div class="login-section fade-in">
                        <div class="row">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <div class="text-center mb-4">
                                    <i class="bi bi-person-circle login-icon"></i>
                                    <h3>Iniciar Sesión</h3>
                                    <p class="text-muted">Accede a tu cuenta para gestionar adopciones</p>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Nombre de Usuario</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-person"></i>
                                        </span>
                                        <asp:TextBox ID="txtUsuario" runat="server" 
                                            CssClass="form-control form-control-custom" 
                                            Placeholder="Ingresa tu usuario">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label class="form-label">Contraseña</label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-lock"></i>
                                        </span>
                                        <asp:TextBox ID="txtContraseña" runat="server" 
                                            TextMode="Password" 
                                            CssClass="form-control form-control-custom" 
                                            Placeholder="Ingresa tu contraseña">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                
                                <asp:Button ID="btnLogin" runat="server" 
                                    Text="Iniciar Sesión" 
                                    CssClass="btn btn-primary-custom btn-custom w-100 mb-3"
                                    OnClick="btnLogin_Click" />
                                
                                <div class="text-center">
                                    <asp:LinkButton ID="lnkOlvide" runat="server" 
                                        CssClass="text-decoration-none me-3"
                                        OnClick="lnkOlvide_Click">
                                        <i class="bi bi-key me-1"></i>¿Olvidaste tu contraseña?
                                    </asp:LinkButton>
                                    <br class="d-block d-sm-none" />
                                    <asp:LinkButton ID="lnkRegistro" runat="server" 
                                        CssClass="text-decoration-none"
                                        OnClick="lnkRegistro_Click">
                                        <i class="bi bi-person-plus me-1"></i>Crear cuenta
                                    </asp:LinkButton>
                                </div>
                                
                                <div class="mt-3">
                                    <asp:Label ID="lblMensaje" runat="server" 
                                        CssClass="alert alert-danger d-none" 
                                        Visible="false">
                                    </asp:Label>
                                </div>
                            </div>
                            
                            <div class="col-lg-6">
                                <div class="h-100 d-flex flex-column justify-content-center">
                                    <h4 class="mb-4" style="color: var(--primary-color);">
                                        <i class="bi bi-info-circle me-2"></i>¿Por qué registrarse?
                                    </h4>
                                    <div class="mb-3">
                                        <div class="d-flex align-items-start mb-3">
                                            <div class="me-3">
                                                <i class="bi bi-check-circle-fill text-success fs-4"></i>
                                            </div>
                                            <div>
                                                <h6>Solicitar adopciones</h6>
                                                <p class="small text-muted mb-0">Puedes solicitar la adopción de tus mascotas favoritas</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start mb-3">
                                            <div class="me-3">
                                                <i class="bi bi-check-circle-fill text-success fs-4"></i>
                                            </div>
                                            <div>
                                                <h6>Reportar mascotas perdidas</h6>
                                                <p class="small text-muted mb-0">Ayuda a reunir mascotas perdidas con sus familias</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start mb-3">
                                            <div class="me-3">
                                                <i class="bi bi-check-circle-fill text-success fs-4"></i>
                                            </div>
                                            <div>
                                                <h6>Seguimiento de solicitudes</h6>
                                                <p class="small text-muted mb-0">Revisa el estado de tus solicitudes de adopción</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-start">
                                            <div class="me-3">
                                                <i class="bi bi-check-circle-fill text-success fs-4"></i>
                                            </div>
                                            <div>
                                                <h6>Realizar donaciones</h6>
                                                <p class="small text-muted mb-0">Apoya nuestra causa con donaciones seguras</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert alert-info mt-3">
                                        <i class="bi bi-shield-check me-2"></i>
                                        <strong>Seguridad garantizada:</strong> Tus datos están protegidos con cifrado AES-256
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="main-footer fade-in">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <h4 class="footer-title">
                            <i class="bi bi-geo-alt me-2"></i>Contacto
                        </h4>
                        <div class="contact-info">
                            <div class="d-flex align-items-start mb-3">
                                <i class="bi bi-geo-alt-fill contact-icon"></i>
                                <div>
                                    <h6 class="mb-1">Dirección</h6>
                                    <asp:Label ID="lblDireccion" runat="server" 
                                        Text="Cerca del Estadio de Pisuli, Quito, Ecuador">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="d-flex align-items-start mb-3">
                                <i class="bi bi-telephone-fill contact-icon"></i>
                                <div>
                                    <h6 class="mb-1">Teléfono</h6>
                                    <asp:Label ID="lblTelefono" runat="server" 
                                        Text="(02) 123-4567">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="d-flex align-items-start">
                                <i class="bi bi-envelope-fill contact-icon"></i>
                                <div>
                                    <h6 class="mb-1">Email</h6>
                                    <span>info@adopcionmascotas.com</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 mb-4">
                        <h4 class="footer-title">
                            <i class="bi bi-clock me-2"></i>Horarios
                        </h4>
                        <div class="contact-info">
                            <div class="mb-2">
                                <strong>Lunes a Viernes:</strong> 9:00 AM - 6:00 PM
                            </div>
                            <div class="mb-2">
                                <strong>Sábados:</strong> 10:00 AM - 4:00 PM
                            </div>
                            <div>
                                <strong>Domingos:</strong> 10:00 AM - 2:00 PM
                            </div>
                            <div class="mt-3">
                                <small class="text-muted">* Horario de atención al público</small>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 mb-4">
                        <h4 class="footer-title">
                            <i class="bi bi-map me-2"></i>Ubicación
                        </h4>
                        <div class="map-container">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.123456789!2d-78.5!3d-0.2!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMDDCsDEyJzAwLjAiUyA3OMKwMzAnMDAuMCJX!5e0!3m2!1sen!2sec!4v1234567890"
                                allowfullscreen="" loading="lazy">
                            </iframe>
                        </div>
                        <div class="text-center mt-3">
                            <a href="https://www.google.com/maps/search/?api=1&query=Estadio+de+Pisuli,+Quito,+Ecuador" 
                               class="btn btn-outline-light btn-custom" 
                               target="_blank">
                                <i class="bi bi-google me-2"></i>Abrir en Google Maps
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="footer-bottom">
                    <div class="row">
                        <div class="col-md-6 text-md-start mb-2 mb-md-0">
                            <p class="mb-0">© 2023 Centro de Adopción de Mascotas. Todos los derechos reservados.</p>
                        </div>
                        <div class="col-md-6 text-md-end">
                            <a href="#" class="text-white me-3 text-decoration-none">Términos y condiciones</a>
                            <a href="#" class="text-white me-3 text-decoration-none">Política de privacidad</a>
                            <a href="#" class="text-white text-decoration-none">Aviso legal</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Mostrar mensajes de login
        document.addEventListener('DOMContentLoaded', function() {
            const lblMensaje = document.getElementById('<%= lblMensaje.ClientID %>');
            if (lblMensaje && lblMensaje.innerText.trim() !== '') {
                lblMensaje.classList.remove('d-none');
                lblMensaje.classList.add('d-block');
                
                // Ocultar mensaje después de 5 segundos
                setTimeout(function() {
                    lblMensaje.classList.remove('d-block');
                    lblMensaje.classList.add('d-none');
                }, 5000);
            }
        });
        
        // Animación suave para enlaces
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
