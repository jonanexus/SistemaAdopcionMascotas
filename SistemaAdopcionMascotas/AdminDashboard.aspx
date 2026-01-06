<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SistemaAdopcionMascotas.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Admin Dashboard</h5>
                </div>
                <div class="card-body">
                    <asp:Menu ID="menuAdmin" runat="server" CssClass="nav nav-pills flex-column">
                        <Items>
                            <asp:MenuItem Text="Mantenimiento Usuarios" NavigateUrl="MantenimientoUsuarios.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Mantenimiento Categorías" NavigateUrl="MantenimientoCategorias.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Mantenimiento Razas" NavigateUrl="MantenimientoRazas.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Mantenimiento Mascotas" NavigateUrl="MantenimientoMascotas.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Mantenimiento Refugios" NavigateUrl="MantenimientoRefugios.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Mantenimiento Donantes" NavigateUrl="MantenimientoDonantes.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Ver Solicitudes" NavigateUrl="VerSolicitudes.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Ver Reportes Perdidos" NavigateUrl="VerReportesPerdidos.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Perfil" NavigateUrl="Perfil.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Logout" NavigateUrl="Logout.aspx"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                </div>
            </div>
        </div>
    </form>
</body>
</html>