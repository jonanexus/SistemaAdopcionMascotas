<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Intro.aspx.cs" Inherits="SistemaAdopcionMascotas.Intro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Introducción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @keyframes fadeIn { from {opacity: 0;} to {opacity: 1;} }
        .intro { animation: fadeIn 2s; text-align: center; margin-top: 200px; background-color: #f8f9fa; padding: 20px; border-radius: 10px; }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="intro container">
            <h1 class="text-primary">Bienvenido al Sistema de Adopción de Mascotas</h1>
            <p class="lead">Ayudamos a encontrar hogares para mascotas necesitadas.</p>
            <asp:Button ID="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary btn-lg" />
        </div>
    </form>
</body>
</html>