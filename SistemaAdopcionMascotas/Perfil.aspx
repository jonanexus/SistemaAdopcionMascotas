<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="SistemaAdopcionMascotas.Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Mi Perfil - Sistema de Adopción</title>
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
        
        .profile-header {
            position: relative;
            border-radius: 10px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--primary-color) 0%, #2e59d9 100%);
            color: white;
            padding: 30px;
            margin-bottom: 30px;
        }
        
        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
        }
        
        .profile-stats {
            display: flex;
            justify-content: space-around;
            text-align: center;
            margin-top: 20px;
        }
        
        .profile-stat {
            padding: 15px;
        }
        
        .profile-stat .number {
            font-size: 1.5rem;
            font-weight: 700;
            display: block;
        }
        
        .profile-stat .label {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #d1d3e2;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
        }
        
        .btn-custom {
            border-radius: 8px;
            font-weight: 600;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        
        .nav-tabs .nav-link {
            border-radius: 8px 8px 0 0;
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            border-color: #dee2e6 #dee2e6 #fff;
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
                        <h1 class="h3 mb-0">Mi Perfil</h1>
                        <p class="mb-0">Administra tu información personal y configuración de cuenta</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <div class="d-inline-flex align-items-center">
                            <div class="me-3">
                                <asp:Label ID="lblNombreUsuario" runat="server" Text="Juan Pérez" CssClass="fw-bold"></asp:Label>
                            </div>
                            <div class="icon-circle bg-light">
                                <i class="bi bi-person-fill text-primary fs-4"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Mensajes existentes -->
            <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="alert alert-info" />
            <asp:Label ID="lblPasswordMensaje" runat="server" Visible="false" CssClass="alert alert-info" />

            <!-- Controles ocultos añadidos para compatibilidad con Perfil.aspx.cs -->
            <asp:Label ID="lblRol" runat="server" Visible="false" />
            <asp:Label ID="lblTotalSolicitudes" runat="server" Visible="false" />

            <!-- Etiquetas de solo lectura usadas por el code-behind (ocultas para mantener UI intacta) -->
            <asp:Label ID="lblNombreCompleto" runat="server" Visible="false" />
            <asp:Label ID="lblTelefono" runat="server" Visible="false" />
            <asp:Label ID="lblDireccion" runat="server" Visible="false" />
            <asp:Label ID="lblCiudad" runat="server" Visible="false" />
            <asp:Label ID="lblEstado" runat="server" Visible="false" />
            <asp:Label ID="lblCodigoPostal" runat="server" Visible="false" />
            <asp:Label ID="lblFechaNacimiento" runat="server" Visible="false" />
            <asp:Label ID="lblAcercaDeMi" runat="server" Visible="false" />
            <asp:Label ID="lblTipoVivienda" runat="server" Visible="false" />
            <asp:Label ID="lblTieneOtrasMascotas" runat="server" Visible="false" />
            <asp:Label ID="lblDescripcionOtrasMascotas" runat="server" Visible="false" />
            <asp:Label ID="lblTieneNinos" runat="server" Visible="false" />
            <asp:Label ID="lblExperienciaMascotas" runat="server" Visible="false" />
            <asp:Label ID="lblHorasSolaMascota" runat="server" Visible="false" />
            <asp:Label ID="lblFotoPerfil" runat="server" Visible="false" />
            
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
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-search me-2"></i>Ver Reportes Perdidos
                                </a>
                                <a href="Donar.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-heart me-2"></i>Donar
                                </a>
                                <a href="Perfil.aspx" class="list-group-item list-group-item-action active">
                                    <i class="bi bi-person me-2"></i>Perfil
                                </a>
                                <a href="Logout.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-box-arrow-right me-2"></i>Cerrar Sesión
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Quick Actions -->
                    <div class="dashboard-card mt-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-lightning me-2"></i>Acciones Rápidas</h5>
                        </div>
                        <div class="card-body">
                            <asp:Button ID="btnEditarPerfil" runat="server" CssClass="btn btn-outline-primary w-100 mb-2" Text="Editar Perfil" />
                            <asp:Button ID="btnAbrirCambiarPassword" runat="server" CssClass="btn btn-outline-secondary w-100 mb-2" Text="Cambiar Contraseña" />
                            <button class="btn btn-outline-info w-100 mb-2" type="button">
                                <i class="bi bi-bell me-1"></i>Preferencias de Notificación
                            </button>
                            <button class="btn btn-outline-warning w-100" type="button">
                                <i class="bi bi-download me-1"></i>Exportar Mis Datos
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Profile Content -->
                <div class="col-lg-9">
                    <!-- Profile Header -->
                    <div class="profile-header">
                        <div class="row align-items-center">
                            <div class="col-md-3 text-center">
                                <asp:Image ID="imgFotoPerfil" runat="server" CssClass="profile-avatar" ImageUrl="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=200&q=80" AlternateText="Foto de perfil" />
                                <div class="mt-3">
                                    <asp:Button ID="btnCambiarFoto" runat="server" CssClass="btn btn-light btn-sm" Text="Cambiar foto" />
                                    <asp:FileUpload ID="fileFotoPerfil" runat="server" CssClass="form-control mt-2" />
                                </div>
                            </div>
                            <div class="col-md-9">
                                <h2 class="mb-1"><asp:Label ID="lblNombreCompletoHeader" runat="server" Text="Juan Pérez" /></h2>
                                <p class="mb-2">
                                    <i class="bi bi-geo-alt me-1"></i><asp:Label ID="lblCiudadHeader" runat="server" Text="Ciudad de México, México" />
                                </p>
                                <p class="mb-3">Miembro desde: <asp:Label ID="lblFechaRegistro" runat="server" Text="Enero 2023" /></p>
                                
                                <div class="profile-stats">
                                    <div class="profile-stat">
                                        <span class="number"><asp:Label ID="lblTotalAdopciones" runat="server" Text="0" /></span>
                                        <span class="label">Adopciones</span>
                                    </div>
                                    <div class="profile-stat">
                                        <span class="number"><asp:Label ID="lblTotalDonaciones" runat="server" Text="0" /></span>
                                        <span class="label">Donaciones</span>
                                    </div>
                                    <div class="profile-stat">
                                        <span class="number"> <asp:Label ID="lblPuntos" runat="server" Text="0" /> </span>
                                        <span class="label">Puntos</span>
                                    </div>
                                    <div class="profile-stat">
                                        <span class="number"><asp:Label ID="lblTotalReportes" runat="server" Text="0" /></span>
                                        <span class="label">Reseñas</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Profile Tabs -->
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-bs-toggle="tab" href="#personalInfo">Información Personal</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#adoptionInfo">Información de Adopción</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#accountSettings">Configuración de Cuenta</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#activity">Actividad</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content">
                                <!-- Personal Information Tab -->
                                <div class="tab-pane fade show active" id="personalInfo">
                                    <h5 class="mb-4">Información Personal</h5>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblNombreLabel" runat="server" Text="Nombre Completo *" CssClass="form-label" />
                                            <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblEmailLabel" runat="server" Text="Correo Electrónico *" CssClass="form-label" />
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblTelefonoLabel" runat="server" Text="Teléfono *" CssClass="form-label" />
                                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblFechaNacLabel" runat="server" Text="Fecha de Nacimiento" CssClass="form-label" />
                                            <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date" />
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <asp:Label ID="lblDireccionLabel" runat="server" Text="Dirección" CssClass="form-label" />
                                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblCiudadLabel" runat="server" Text="Ciudad" CssClass="form-label" />
                                            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <asp:Label ID="lblEstadoLabel" runat="server" Text="Estado" CssClass="form-label" />
                                            <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <asp:Label ID="lblCPLabel" runat="server" Text="Código Postal" CssClass="form-label" />
                                            <asp:TextBox ID="txtCodigoPostal" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <asp:Label ID="lblAcercaDeMiLabel" runat="server" Text="Acerca de mí" CssClass="form-label" />
                                            <asp:TextBox ID="txtAcercaDeMi" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                                        </div>
                                    </div>
                                    
                                    <div class="text-end">
                                        <asp:Button ID="btnGuardarPerfil" runat="server" CssClass="btn btn-primary" Text="Guardar Cambios" OnClick="btnGuardarPerfil_Click" />
                                        <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-secondary ms-2" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    </div>
                                </div>
                                
                                <!-- Adoption Information Tab -->
                                <div class="tab-pane fade" id="adoptionInfo">
                                    <h5 class="mb-4">Información para Adopción</h5>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblTipoViviendaLabel" runat="server" Text="Tipo de Vivienda *" CssClass="form-label" />
                                            <asp:DropDownList ID="ddlTipoVivienda" runat="server" CssClass="form-select" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblTieneOtrasMascotasLabel" runat="server" Text="¿Tienes otras mascotas?" CssClass="form-label" />
                                            <asp:DropDownList ID="ddlTieneOtrasMascotas" runat="server" CssClass="form-select" />
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <asp:Label ID="lblDescripcionOtrasMascotasLabel" runat="server" Text="Si tienes otras mascotas, describe cuáles" CssClass="form-label" />
                                            <asp:TextBox ID="txtDescripcionOtrasMascotas" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblTieneNinosLabel" runat="server" Text="¿Tienes niños en casa?" CssClass="form-label" />
                                            <asp:DropDownList ID="ddlTieneNinos" runat="server" CssClass="form-select" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <asp:Label ID="lblExperienciaMascotasLabel" runat="server" Text="Experiencia previa con mascotas" CssClass="form-label" />
                                            <asp:DropDownList ID="ddlExperienciaMascotas" runat="server" CssClass="form-select" />
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <asp:Label ID="lblHorasSolaLabel" runat="server" Text="¿Cuántas horas al día estará sola la mascota?" CssClass="form-label" />
                                            <asp:DropDownList ID="ddlHorasSolaMascota" runat="server" CssClass="form-select" />
                                        </div>
                                    </div>
                                    
                                    <div class="alert alert-info">
                                        <i class="bi bi-info-circle me-2"></i>
                                        Esta información nos ayuda a encontrar la mascota más adecuada para tu hogar y estilo de vida.
                                    </div>
                                    
                                    <div class="text-end">
                                        <asp:Button ID="btnGuardarAdoption" runat="server" CssClass="btn btn-primary" Text="Guardar Cambios" OnClick="btnGuardarPerfil_Click" />
                                    </div>
                                </div>
                                
                                <!-- Account Settings Tab -->
                                <div class="tab-pane fade" id="accountSettings">
                                    <h5 class="mb-4">Configuración de Cuenta</h5>
                                    
                                    <div class="mb-4">
                                        <h6 class="border-bottom pb-2">Seguridad</h6>
                                        <div class="row mt-3">
                                            <div class="col-md-8">
                                                <asp:Label ID="lblCambiarClaveLabel" runat="server" Text="Cambiar Contraseña" CssClass="form-label" />
                                                <p class="small text-muted">Se recomienda cambiar tu contraseña regularmente para mantener segura tu cuenta.</p>
                                            </div>
                                            <div class="col-md-4 text-end">
                                                <asp:Button ID="btnMostrarCambiarPassword" runat="server" CssClass="btn btn-outline-primary" Text="Cambiar Contraseña" OnClick="btnAbrirCambiarPassword_Click" />
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-3">
                                            <div class="col-md-4">
                                                <asp:Label ID="lblCurrentPasswordLabel" runat="server" Text="Contraseña actual" CssClass="form-label" />
                                                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label ID="lblNewPasswordLabel" runat="server" Text="Nueva contraseña" CssClass="form-label" />
                                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Label ID="lblConfirmPasswordLabel" runat="server" Text="Confirmar nueva contraseña" CssClass="form-label" />
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                                            </div>
                                        </div>

                                        <div class="mt-3 text-end">
                                            <asp:Button ID="btnCambiarContraseña" runat="server" CssClass="btn btn-primary" Text="Cambiar contraseña" OnClick="btnCambiarContraseña_Click" />
                                        </div>
                                    </div>
                                    
                                    <div class="mb-4">
                                        <h6 class="border-bottom pb-2">Privacidad</h6>
                                        <div class="form-check mt-3">
                                            <input class="form-check-input" type="checkbox" id="profileVisibility" checked />
                                            <label class="form-check-label" for="profileVisibility">
                                                Hacer mi perfil visible para otros usuarios
                                            </label>
                                        </div>
                                        <div class="form-check mt-2">
                                            <input class="form-check-input" type="checkbox" id="showAdoptions" checked />
                                            <label class="form-check-label" for="showAdoptions">
                                                Mostrar mis adopciones en mi perfil público
                                            </label>
                                        </div>
                                        <div class="form-check mt-2">
                                            <input class="form-check-input" type="checkbox" id="emailNotifications" checked />
                                            <label class="form-check-label" for="emailNotifications">
                                                Recibir notificaciones por correo electrónico
                                            </label>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-4">
                                        <h6 class="border-bottom pb-2">Preferencias de Comunicación</h6>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="form-label">Frecuencia de boletines</label>
                                                <select class="form-select">
                                                    <option selected>Semanal</option>
                                                    <option>Quincenal</option>
                                                    <option>Mensual</option>
                                                    <option>Nunca</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Tipo de notificaciones</label>
                                                <select class="form-select">
                                                    <option selected>Todas las notificaciones</option>
                                                    <option>Solo importantes</option>
                                                    <option>Solo adopciones</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                
                                <!-- Activity Tab -->
                                <div class="tab-pane fade" id="activity">
                                    <h5 class="mb-4">Actividad Reciente</h5>
                                    
                                    <div class="timeline">
                                        <div class="d-flex mb-3">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-primary bg-opacity-10 p-2">
                                                    <i class="bi bi-clipboard-check text-primary"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h6 class="mb-1">Solicitud de adopción aprobada</h6>
                                                <p class="mb-0 text-muted">Tu solicitud para adoptar a "Max" ha sido aprobada.</p>
                                                <small class="text-muted">Hace 2 días</small>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex mb-3">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-success bg-opacity-10 p-2">
                                                    <i class="bi bi-heart text-success"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h6 class="mb-1">Donación realizada</h6>
                                                <p class="mb-0 text-muted">Has realizado una donación de $50.</p>
                                                <small class="text-muted">Hace 5 días</small>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex mb-3">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-info bg-opacity-10 p-2">
                                                    <i class="bi bi-clipboard-plus text-info"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h6 class="mb-1">Nueva solicitud enviada</h6>
                                                <p class="mb-0 text-muted">Has enviado una solicitud para adoptar a "Luna".</p>
                                                <small class="text-muted">Hace 1 semana</small>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex mb-3">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-warning bg-opacity-10 p-2">
                                                    <i class="bi bi-person-check text-warning"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h6 class="mb-1">Perfil actualizado</h6>
                                                <p class="mb-0 text-muted">Has actualizado tu información personal.</p>
                                                <small class="text-muted">Hace 2 semanas</small>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex">
                                            <div class="flex-shrink-0">
                                                <div class="rounded-circle bg-secondary bg-opacity-10 p-2">
                                                    <i class="bi bi-chat-dots text-secondary"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <h6 class="mb-1">Reseña enviada</h6>
                                                <p class="mb-0 text-muted">Has enviado una reseña sobre tu experiencia de adopción.</p>
                                                <small class="text-muted">Hace 3 semanas</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="text-center mt-4">
                                        <button class="btn btn-outline-primary">
                                            <i class="bi bi-clock-history me-1"></i>Cargar más actividad
                                        </button>
                                    </div>
                                </div>
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
    <script>
        // Initialize Bootstrap tabs
        document.addEventListener('DOMContentLoaded', function() {
            const triggerTabList = [].slice.call(document.querySelectorAll('a[data-bs-toggle="tab"]'));
            triggerTabList.forEach(function (triggerEl) {
                const tabTrigger = new bootstrap.Tab(triggerEl);
                
                triggerEl.addEventListener('click', function (event) {
                    event.preventDefault();
                    tabTrigger.show();
                });
            });
        });
    </script>
</body>
</html>
