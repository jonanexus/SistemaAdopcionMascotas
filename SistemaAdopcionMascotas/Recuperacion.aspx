<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperacion.aspx.cs" Inherits="SistemaAdopcionMascotas.Recuperacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recuperación de Contraseña</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card mx-auto" style="max-width: 400px;">
                <div class="card-body">
                    <h5 class="card-title text-center text-primary">Recuperar Contraseña</h5>
                    Email: <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnRecuperar" runat="server" Text="Enviar Clave Temporal" OnClick="btnRecuperar_Click" CssClass="btn btn-primary w-100" />
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success d-block text-center mt-2"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>