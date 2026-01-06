<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donar.aspx.cs" Inherits="SistemaAdopcionMascotas.Donar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Donaciones - Sistema de Adopción</title>
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
        
        .donation-amount {
            border: 2px solid #e3e6f0;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .donation-amount:hover, .donation-amount.selected {
            border-color: var(--primary-color);
            background-color: rgba(78, 115, 223, 0.05);
        }
        
        .donation-amount .amount {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--dark-color);
        }
        
        .donation-amount.selected .amount {
            color: var(--primary-color);
        }
        
        .donation-amount .description {
            font-size: 0.9rem;
            color: var(--secondary-color);
            margin-top: 5px;
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
        
        .impact-card {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: white;
            border: 1px solid #e3e6f0;
            height: 100%;
        }
        
        .impact-card .icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 1.5rem;
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
                        <h1 class="h3 mb-0">Apoya Nuestra Causa</h1>
                        <p class="mb-0">Tu donación ayuda a salvar y mejorar la vida de mascotas necesitadas</p>
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
                                <a href="VerReportesPerdidos.aspx" class="list-group-item list-group-item-action">
                                    <i class="bi bi-search me-2"></i>Ver Reportes Perdidos
                                </a>
                                <a href="Donar.aspx" class="list-group-item list-group-item-action active">
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
                    
                    <!-- Donation Summary -->
                    <div class="dashboard-card mt-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-graph-up me-2"></i>Tu Contribución</h5>
                        </div>
                        <div class="card-body">
                            <div class="text-center mb-4">
                                <div class="display-6 text-success fw-bold">$150</div>
                                <p class="text-muted small">Total donado</p>
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between mb-1">
                                    <span class="small">Última donación</span>
                                    <span class="small fw-bold">$50</span>
                                </div>
                                <div class="progress" style="height: 6px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%"></div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between mb-1">
                                    <span class="small">Donaciones este año</span>
                                    <span class="small fw-bold">3</span>
                                </div>
                                <div class="progress" style="height: 6px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 60%"></div>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <p class="small text-muted mb-0">
                                    <i class="bi bi-award me-1"></i>Eres un donante frecuente
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Donation Content -->
                <div class="col-lg-9">
                    <!-- Impact Section -->
                    <div class="dashboard-card mb-4">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-heart-fill me-2"></i>El Impacto de tu Donación</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <div class="impact-card">
                                        <div class="icon bg-primary bg-opacity-10 text-primary">
                                            <i class="bi bi-capsule"></i>
                                        </div>
                                        <h5>Medicinas</h5>
                                        <p class="small text-muted mb-0">$50 cubre el tratamiento médico para una mascota enferma</p>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="impact-card">
                                        <div class="icon bg-success bg-opacity-10 text-success">
                                            <i class="bi bi-basket"></i>
                                        </div>
                                        <h5>Alimento</h5>
                                        <p class="small text-muted mb-0">$30 proporciona alimento para 10 mascotas por un día</p>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="impact-card">
                                        <div class="icon bg-warning bg-opacity-10 text-warning">
                                            <i class="bi bi-house-heart"></i>
                                        </div>
                                        <h5>Refugio</h5>
                                        <p class="small text-muted mb-0">$100 ayuda a mantener el refugio para 5 mascotas por una semana</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Donation Form -->
                    <div class="dashboard-card">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 text-primary"><i class="bi bi-credit-card me-2"></i>Realizar una Donación</h5>
                        </div>
                        <div class="card-body">
                            <!-- Amount Selection -->
                            <div class="mb-4">
                                <label class="form-label mb-3">Selecciona el monto de tu donación</label>
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <div class="donation-amount" data-amount="10">
                                            <div class="amount">$10</div>
                                            <div class="description">Ayuda básica</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="donation-amount selected" data-amount="25">
                                            <div class="amount">$25</div>
                                            <div class="description">Donación estándar</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="donation-amount" data-amount="50">
                                            <div class="amount">$50</div>
                                            <div class="description">Gran ayuda</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="donation-amount" data-amount="100">
                                            <div class="amount">$100</div>
                                            <div class="description">Contribución significativa</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="donation-amount" data-amount="250">
                                            <div class="amount">$250</div>
                                            <div class="description">Donación generosa</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="donation-amount" data-amount="custom">
                                            <div class="amount">Otro monto</div>
                                            <div class="description">Especifica la cantidad</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Custom Amount -->
                                <div class="row mt-4 d-none" id="customAmountSection">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control" id="customAmount" placeholder="Ingresa el monto" min="1" step="0.01" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Donation Type -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <label class="form-label">Tipo de donación</label>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="donationType" id="oneTime" checked />
                                        <label class="form-check-label" for="oneTime">
                                            Donación única
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="donationType" id="monthly" />
                                        <label class="form-check-label" for="monthly">
                                            Donación mensual recurrente
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="donationPurpose" class="form-label">Destino de la donación (opcional)</label>
                                    <select class="form-select" id="donationPurpose">
                                        <option value="">Donación general</option>
                                        <option value="medical">Fondo médico</option>
                                        <option value="food">Alimento para mascotas</option>
                                        <option value="shelter">Mantenimiento del refugio</option>
                                        <option value="adoption">Programa de adopciones</option>
                                    </select>
                                </div>
                            </div>
                            
                            <!-- Payment Information -->
                            <div class="mb-4">
                                <h6 class="border-bottom pb-2 mb-3">Información de pago</h6>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="cardName" class="form-label">Nombre en la tarjeta *</label>
                                        <input type="text" class="form-control" id="cardName" placeholder="Como aparece en la tarjeta" />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="cardNumber" class="form-label">Número de tarjeta *</label>
                                        <input type="text" class="form-control" id="cardNumber" placeholder="1234 5678 9012 3456" />
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="cardExpiry" class="form-label">Fecha de expiración *</label>
                                        <input type="text" class="form-control" id="cardExpiry" placeholder="MM/AA" />
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="cardCVC" class="form-label">CVC *</label>
                                        <input type="text" class="form-control" id="cardCVC" placeholder="123" />
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="cardZip" class="form-label">Código postal *</label>
                                        <input type="text" class="form-control" id="cardZip" placeholder="12345" />
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Donor Information -->
                            <div class="mb-4">
                                <h6 class="border-bottom pb-2 mb-3">Información del donante</h6>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="donorEmail" class="form-label">Correo electrónico *</label>
                                        <input type="email" class="form-control" id="donorEmail" placeholder="tucorreo@ejemplo.com" />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="donorPhone" class="form-label">Teléfono (opcional)</label>
                                        <input type="tel" class="form-control" id="donorPhone" placeholder="555-123-4567" />
                                    </div>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="anonymousDonation" />
                                    <label class="form-check-label" for="anonymousDonation">
                                        Hacer donación anónima
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="receiveUpdates" checked />
                                    <label class="form-check-label" for="receiveUpdates">
                                        Recibir actualizaciones sobre el impacto de mi donación
                                    </label>
                                </div>
                            </div>
                            
                            <!-- Form Actions -->
                            <div class="row mt-4">
                                <div class="col-12 text-end">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="text-start">
                                            <div class="fw-bold fs-5">Total a donar: <span id="totalAmount">$25</span></div>
                                            <small class="text-muted">Tu donación es 100% deducible de impuestos</small>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-outline-secondary me-2">
                                                <i class="bi bi-x-circle me-1"></i>Cancelar
                                            </button>
                                            <button type="button" class="btn btn-success">
                                                <i class="bi bi-lock me-1"></i>Donar ahora de forma segura
                                            </button>
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
        document.addEventListener('DOMContentLoaded', function() {
            const donationAmounts = document.querySelectorAll('.donation-amount');
            const customAmountSection = document.getElementById('customAmountSection');
            const customAmountInput = document.getElementById('customAmount');
            const totalAmountElement = document.getElementById('totalAmount');
            
            let selectedAmount = 25;
            
            // Handle donation amount selection
            donationAmounts.forEach(amount => {
                amount.addEventListener('click', function() {
                    // Remove selected class from all amounts
                    donationAmounts.forEach(a => a.classList.remove('selected'));
                    
                    // Add selected class to clicked amount
                    this.classList.add('selected');
                    
                    // Show/hide custom amount input
                    const amountValue = this.getAttribute('data-amount');
                    if (amountValue === 'custom') {
                        customAmountSection.classList.remove('d-none');
                        selectedAmount = customAmountInput.value || 0;
                    } else {
                        customAmountSection.classList.add('d-none');
                        selectedAmount = parseInt(amountValue);
                        updateTotalAmount();
                    }
                });
            });
            
            // Update total when custom amount changes
            customAmountInput.addEventListener('input', function() {
                selectedAmount = parseFloat(this.value) || 0;
                updateTotalAmount();
            });
            
            function updateTotalAmount() {
                totalAmountElement.textContent = '$' + selectedAmount.toFixed(2);
            }
        });
    </script>
</body>
</html>
