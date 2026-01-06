<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantenimientoUsuarios.aspx.cs" Inherits="SistemaAdopcionMascotas.MantenimientoUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mantenimiento Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Mantenimiento de Usuarios</h5>
                </div>
                <div class="card-body">
                    Nombre Usuario: <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control mb-2"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtNombreUsuario" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    Email: <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2"></asp:TextBox><asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    Rol: <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select mb-2"><asp:ListItem>Admin</asp:ListItem><asp:ListItem>Staff</asp:ListItem><asp:ListItem>Adopter</asp:ListItem></asp:DropDownList><br />
                    Contraseña: <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control mb-2"></asp:TextBox><br />
                    Foto: <asp:FileUpload ID="fuFoto" runat="server" CssClass="form-control mb-2" /><br />
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" CssClass="btn btn-primary me-2" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" /><br />
                    <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-striped mt-3" AutoGenerateColumns="False" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged" DataKeyNames="UsuarioID">
                        <Columns>
                            <asp:BoundField DataField="UsuarioID" HeaderText="ID" />
                            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Rol" HeaderText="Rol" />
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-secondary btn-sm" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>