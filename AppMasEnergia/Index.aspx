<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AppMasEnergia.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px;margin:50px auto;">
            <h2>Iniciar Sesión</h2>
            <asp:Label ID="lblDocumento" runat="server" Text="Documento:" />
            <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" />
            <br />
            <asp:Label ID="lblClave" runat="server" Text="Contraseña:" />
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" CssClass="form-control" />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" />
            <br /><br />
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>
