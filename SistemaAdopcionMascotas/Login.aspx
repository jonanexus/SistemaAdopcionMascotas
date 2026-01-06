<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaAdopcionMascotas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-body">
                    <h5 class="card-title text-center text-primary">Iniciar Sesión</h5>
                    Usuario: <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtUsuario" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    Contraseña: <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtPass" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" CssClass="btn btn-primary w-100" />
                    <div class="text-center mt-3">
                        <asp:LinkButton ID="lnkRegistro" runat="server" OnClick="lnkRegistro_Click" CssClass="text-decoration-none">Registrarse</asp:LinkButton><br />
                        <asp:LinkButton ID="lnkOlvide" runat="server" OnClick="lnkOlvide_Click" CssClass="text-decoration-none">Olvidé Contraseña</asp:LinkButton>
                    </div>
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger d-block text-center mt-2"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>