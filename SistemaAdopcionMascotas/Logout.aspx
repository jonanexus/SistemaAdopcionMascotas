<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="SistemaAdopcionMascotas.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cerrar Sesión - Sistema de Adopción</title>
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
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logout-container {
            max-width: 500px;
            width: 100%;
            padding: 20px;
        }
        
        .logout-card {
            border: 0;
            border-radius: 15px;
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.15);
            overflow: hidden;
        }
        
        .logout-header {
            background: linear-gradient(90deg, var(--primary-color) 0%, #2e59d9 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .logout-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        
        .logout-body {
            padding: 40px;
            background-color: white;
        }
        
        .btn-custom {
            border-radius: 8px;
            font-weight: 600;
            padding: 12px 24px;
            transition: all 0.3s;
        }
        
        .countdown {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-container">
            <div class="logout-card">
                <div class="logout-header">
                    <div class="logout-icon">
                        <i class="bi bi-box-arrow-right"></i>
                    </div>
                    <h2 class="mb-2">¿Estás seguro?</h2>
                    <p class="mb-0">Vas a cerrar tu sesión en el sistema</p>
                </div>
                <div class="logout-body">
                    <div class="text-center mb-4">
                        <p>Si cierras sesión, tendrás que volver a iniciar sesión para acceder a tu cuenta.</p>
                        
                        <div class="countdown" id="countdown">10</div>
                        
                        <p class="text-muted small">Serás redirigido automáticamente a la página de inicio en <span id="seconds">10</span> segundos.</p>
                    </div>
                    
                    <div class="d-grid gap-3">
                        <button type="button" class="btn btn-primary btn-custom" id="btnLogout">
                            <i class="bi bi-box-arrow-right me-2"></i>Sí, cerrar sesión
                        </button>
                        <button type="button" class="btn btn-outline-secondary btn-custom" id="btnCancel">
                            <i class="bi bi-x-circle me-2"></i>Cancelar y volver
                        </button>
                    </div>
                    
                    <div class="text-center mt-4">
                        <p class="small text-muted mb-0">
                            <i class="bi bi-shield-check me-1"></i>
                            Tu información de sesión será eliminada de forma segura
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const countdownElement = document.getElementById('countdown');
            const secondsElement = document.getElementById('seconds');
            const btnLogout = document.getElementById('btnLogout');
            const btnCancel = document.getElementById('btnCancel');
            
            let seconds = 10;
            let countdownInterval;
            
            // Start countdown
            function startCountdown() {
                countdownInterval = setInterval(function() {
                    seconds--;
                    countdownElement.textContent = seconds;
                    secondsElement.textContent = seconds;
                    
                    if (seconds <= 0) {
                        clearInterval(countdownInterval);
                        performLogout();
                    }
                }, 1000);
            }
            
            // Perform logout action
            function performLogout() {
                // In a real application, this would submit the form or make an AJAX call
                // For demonstration, we'll just show a message and redirect
                btnLogout.innerHTML = '<i class="bi bi-check-circle me-2"></i>Sesión cerrada';
                btnLogout.classList.remove('btn-primary');
                btnLogout.classList.add('btn-success');
                btnLogout.disabled = true;
                
                // Show success message
                const logoutHeader = document.querySelector('.logout-header');
                logoutHeader.innerHTML = `
                    <div class="logout-icon">
                        <i class="bi bi-check-circle"></i>
                    </div>
                    <h2 class="mb-2">¡Sesión cerrada!</h2>
                    <p class="mb-0">Has cerrado sesión correctamente</p>
                `;
                logoutHeader.style.background = 'linear-gradient(90deg, #1cc88a 0%, #17a673 100%)';
                
                // Redirect to login page after 2 seconds
                setTimeout(function() {
                    window.location.href = 'Login.aspx'; // Change to your actual login page
                }, 2000);
            }
            
            // Cancel logout
            function cancelLogout() {
                clearInterval(countdownInterval);
                window.location.href = 'AdopterDashboard.aspx';
            }
            
            // Event listeners
            btnLogout.addEventListener('click', performLogout);
            btnCancel.addEventListener('click', cancelLogout);
            
            // Start the countdown on page load
            startCountdown();
        });
    </script>
</body>
</html>
