<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportarPerdido.aspx.cs" Inherits="SistemaAdopcionMascotas.ReportarPerdido" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Reportar Mascota Perdida - Sistema de Adopción</title>
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
        
        .image-upload {
            border: 2px dashed #d1d3e2;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .image-upload:hover {
            border-color: var(--primary-color);
            background-color: rgba(78, 115, 223, 0.05);
        }
        
        .preview-image {
            max-width: 100%;
            max-height: 200px;
            border-radius: 8px;
            margin-top: 15px;
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
                        <h1 class="h3 mb-0">Reportar Mascota Perdida</h1>
                        <p class="mb-0">Ayúdanos a encontrar a tu mascota perdida</p>
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
                                <a href="ReportarPerdido.aspx" class="list-group-item list-group-item-action active">
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
                
                <!-- Form Content -->
                <div class="col-lg-9">
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-exclamation-triangle me-2"></i>Información de la Mascota Perdida</h5>
                        </div>
                        <div class="card-body">
                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <div class="alert alert-warning">
                                        <i class="bi bi-info-circle me-2"></i>
                                        <strong>Importante:</strong> Proporciona la mayor cantidad de detalles posibles para aumentar las posibilidades de encontrar a tu mascota.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="txtNombre" class="form-label">Nombre de la Mascota *</label>
                                        <input type="text" class="form-control" id="txtNombre" placeholder="Ej: Max, Luna, etc." />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="ddlTipoMascota" class="form-label">Tipo de Mascota *</label>
                                        <select class="form-select" id="ddlTipoMascota">
                                            <option selected disabled>Selecciona un tipo</option>
                                            <option value="perro">Perro</option>
                                            <option value="gato">Gato</option>
                                            <option value="ave">Ave</option>
                                            <option value="roedor">Roedor</option>
                                            <option value="otro">Otro</option>
                                        </select>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtRaza" class="form-label">Raza</label>
                                        <input type="text" class="form-control" id="txtRaza" placeholder="Ej: Labrador, Siames, etc." />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtColor" class="form-label">Color Principal *</label>
                                        <input type="text" class="form-control" id="txtColor" placeholder="Ej: Negro, Blanco, Marrón, etc." />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtEdad" class="form-label">Edad Aproximada</label>
                                        <input type="text" class="form-control" id="txtEdad" placeholder="Ej: 2 años, 6 meses, etc." />
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="txtFechaPerdida" class="form-label">Fecha en que se perdió *</label>
                                        <input type="date" class="form-control" id="txtFechaPerdida" />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtUbicacionPerdida" class="form-label">Última ubicación conocida *</label>
                                        <textarea class="form-control" id="txtUbicacionPerdida" rows="3" placeholder="Ej: Calle Principal #123, Colonia Centro, Ciudad"></textarea>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtCaracteristicas" class="form-label">Características distintivas</label>
                                        <textarea class="form-control" id="txtCaracteristicas" rows="3" placeholder="Ej: Tiene una mancha blanca en la pata derecha, usa collar rojo, etc."></textarea>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtContacto" class="form-label">Teléfono de contacto *</label>
                                        <input type="tel" class="form-control" id="txtContacto" placeholder="Ej: 555-123-4567" />
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="txtRecompensa" class="form-label">Recompensa ofrecida (opcional)</label>
                                        <input type="text" class="form-control" id="txtRecompensa" placeholder="Ej: $500" />
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Image Upload -->
                            <div class="row mt-4">
                                <div class="col-12">
                                    <label class="form-label">Foto de la mascota (opcional pero recomendado)</label>
                                    <div class="image-upload" id="imageUploadArea">
                                        <i class="bi bi-cloud-arrow-up fs-1 text-muted"></i>
                                        <p class="mt-2">Arrastra y suelta una imagen o haz clic para seleccionar</p>
                                        <p class="text-muted small">Formatos aceptados: JPG, PNG. Tamaño máximo: 5MB</p>
                                        <input type="file" id="fileUpload" class="d-none" accept="image/*" />
                                        <img id="preview" class="preview-image d-none" alt="Vista previa" />
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Form Actions -->
                            <div class="row mt-4">
                                <div class="col-12 text-end">
                                    <button type="button" class="btn btn-outline-secondary me-2">
                                        <i class="bi bi-x-circle me-1"></i>Cancelar
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        <i class="bi bi-send me-1"></i>Reportar Mascota Perdida
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Tips -->
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-lightbulb me-2"></i>Consejos para encontrar a tu mascota</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="bi bi-search text-primary fs-4"></i>
                                        </div>
                                        <div>
                                            <h6>Busca en el área</h6>
                                            <p class="small text-muted mb-0">Revisa parques, patios y calles aledañas. Las mascotas suelen esconderse cerca.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="bi bi-megaphone text-primary fs-4"></i>
                                        </div>
                                        <div>
                                            <h6>Informa a vecinos</h6>
                                            <p class="small text-muted mb-0">Pregunta a tus vecinos si han visto a tu mascota y déjales tu información de contacto.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="bi bi-printer text-primary fs-4"></i>
                                        </div>
                                        <div>
                                            <h6>Distribuye volantes</h6>
                                            <p class="small text-muted mb-0">Crea volantes con la foto de tu mascota y distribúyelos en la zona donde se perdió.</p>
                                        </div>
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
        // Image upload functionality
        document.addEventListener('DOMContentLoaded', function() {
            const imageUploadArea = document.getElementById('imageUploadArea');
            const fileUpload = document.getElementById('fileUpload');
            const preview = document.getElementById('preview');
            
            imageUploadArea.addEventListener('click', function() {
                fileUpload.click();
            });
            
            fileUpload.addEventListener('change', function(e) {
                if (e.target.files.length > 0) {
                    const file = e.target.files[0];
                    const reader = new FileReader();
                    
                    reader.onload = function(event) {
                        preview.src = event.target.result;
                        preview.classList.remove('d-none');
                        imageUploadArea.querySelector('p').textContent = 'Haz clic para cambiar la imagen';
                    };
                    
                    reader.readAsDataURL(file);
                }
            });
            
            // Drag and drop functionality
            imageUploadArea.addEventListener('dragover', function(e) {
                e.preventDefault();
                imageUploadArea.style.borderColor = '#4e73df';
                imageUploadArea.style.backgroundColor = 'rgba(78, 115, 223, 0.1)';
            });
            
            imageUploadArea.addEventListener('dragleave', function(e) {
                e.preventDefault();
                imageUploadArea.style.borderColor = '#d1d3e2';
                imageUploadArea.style.backgroundColor = '';
            });
            
            imageUploadArea.addEventListener('drop', function(e) {
                e.preventDefault();
                imageUploadArea.style.borderColor = '#d1d3e2';
                imageUploadArea.style.backgroundColor = '';
                
                if (e.dataTransfer.files.length > 0) {
                    fileUpload.files = e.dataTransfer.files;
                    const event = new Event('change');
                    fileUpload.dispatchEvent(event);
                }
            });
        });
    </script>
</body>
</html>
