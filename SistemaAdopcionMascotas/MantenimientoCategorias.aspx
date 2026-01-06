<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantenimientoCategorias.aspx.cs" Inherits="SistemaAdopcionMascotas.MantenimientoCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mantenimiento Categorías</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Mantenimiento de Categorías</h5>
                </div>
                <div class="card-body">
                    Nombre: <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control mb-2"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtNombre" ErrorMessage="Requerido" CssClass="text-danger" runat="server"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" CssClass="btn btn-primary me-2" />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" /><br />
                    <asp:GridView ID="gvCategorias" runat="server" CssClass="table table-striped mt-3" AutoGenerateColumns="False" OnSelectedIndexChanged="gvCategorias_SelectedIndexChanged" DataKeyNames="CategoriaID">
                        <Columns>
                            <asp:BoundField DataField="CategoriaID" HeaderText="ID" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-secondary btn-sm" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>