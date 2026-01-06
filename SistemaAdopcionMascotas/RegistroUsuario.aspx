<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" 
    Inherits="TuNamespace.RegistroUsuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Usuario</title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <h2>Registro de Usuario</h2>
            
            <!-- Corrección de atributos XHTML5 -->
            <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" required="required"></asp:TextBox>
            <br />
            
            <asp:Label ID="lblPassword" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="required"></asp:TextBox>
            <br />
            
            <asp:Label ID="lblConfirmarPassword" runat="server" Text="Confirmar Contraseña:"></asp:Label>
            <asp:TextBox ID="txtConfirmarPassword" runat="server" TextMode="Password" required="required"></asp:TextBox>
            <br />
            
            <asp:Label ID="lblFoto" runat="server" Text="Foto de Perfil:"></asp:Label>
            <asp:FileUpload ID="fuFoto" runat="server" accept="image/*" />
            <br />
            
            <!-- Mensaje de validación de password -->
            <asp:Label ID="PasswordMensaje" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <br />
            
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            
            <!-- Más controles con atributos corregidos -->
            <input type="checkbox" id="chkTerminos" runat="server" checked="checked" />
            <select id="ddlPais" runat="server">
                <option value="1" selected="selected">México</option>
                <option value="2">España</option>
            </select>
        </div>
    </form>
</body>
</html>
