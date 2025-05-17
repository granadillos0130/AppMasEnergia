<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AppMasEnergia.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Más Energía - Login Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Elementos decorativos de fondo */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><radialGradient id="a" cx="50%" cy="50%" r="50%"><stop offset="0%" style="stop-color:%23ffffff;stop-opacity:0.1" /><stop offset="100%" style="stop-color:%23ffffff;stop-opacity:0" /></radialGradient></defs><circle cx="200" cy="200" r="100" fill="url(%23a)" /><circle cx="800" cy="300" r="150" fill="url(%23a)" /><circle cx="400" cy="700" r="120" fill="url(%23a)" /><circle cx="700" cy="800" r="80" fill="url(%23a)" /></svg>') repeat;
            opacity: 0.3;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            position: relative;
            z-index: 1;
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .company-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .company-logo {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 25px rgba(240, 147, 251, 0.3);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .company-logo::before {
            content: '⚡';
            font-size: 35px;
            color: white;
        }

        .company-name {
            font-size: 28px;
            font-weight: bold;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 5px;
        }

        .company-subtitle {
            color: #666;
            font-size: 14px;
            font-weight: 300;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 300;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .input-container {
            position: relative;
        }

        .input-container::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            background-size: contain;
            opacity: 0.6;
        }

        .input-container.user::before {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" fill="%23667eea" viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>');
        }

        .input-container.password::before {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" fill="%23667eea" viewBox="0 0 24 24"><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM12 17c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zM15.1 8H8.9V6c0-1.71 1.39-3.1 3.1-3.1s3.1 1.39 3.1 3.1v2z"/></svg>');
        }

        .form-control {
            width: 100%;
            padding: 15px 20px 15px 45px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 16px;
            background: #f8f9fa;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-control:focus {
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .form-control:focus + label {
            color: #667eea;
        }

        .btn-login {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            position: relative;
            overflow: hidden;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .message-label {
            color: #e74c3c;
            text-align: center;
            font-size: 14px;
            margin-top: 15px;
            background: #ffebee;
            padding: 10px;
            border-radius: 8px;
            border-left: 4px solid #e74c3c;
            display: none;
        }

        .message-label.show {
            display: block;
            animation: slideIn 0.5s ease-out;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            color: #999;
            font-size: 12px;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .login-container {
                margin: 20px;
                padding: 30px 25px;
            }
            
            .company-name {
                font-size: 24px;
            }
        }

        /* Loading animation */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="company-header">
                <div class="company-logo"></div>
                <div class="company-name">MÁS ENERGÍA</div>
                <div class="company-subtitle">Sistema de Inventario y Préstamos</div>
            </div>
            
            <h2>Acceso de Administradores</h2>
            
            <div class="form-group">
                <div class="input-container user">
                    <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" 
                               placeholder="Ingrese su documento de identidad"></asp:TextBox>
                </div>
                <asp:Label ID="lblDocumento" runat="server" Text="Documento de Identidad"></asp:Label>
            </div>
            
            <div class="form-group">
                <div class="input-container password">
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control"
                               placeholder="Ingrese su contraseña"></asp:TextBox>
                </div>
                <asp:Label ID="lblContrasena" runat="server" Text="Contraseña"></asp:Label>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn-login" OnClick="btnLogin_Click" />
            
            <asp:Label ID="lblMensaje" runat="server" CssClass="message-label"></asp:Label>
            
            <div class="footer">
                © 2025 Más Energía - Todos los derechos reservados
            </div>
        </div>
    </form>

    <script>
        // Mostrar mensaje de error con animación
        function showMessage() {
            var messageLabel = document.getElementById('<%= lblMensaje.ClientID %>');
            if (messageLabel && messageLabel.innerHTML.trim() !== '') {
                messageLabel.classList.add('show');
            }
        }

        // Ejecutar al cargar la página
        window.onload = function() {
            showMessage();
        };

        // Agregar efecto de carga al botón
        document.getElementById('<%= btnLogin.ClientID %>').addEventListener('click', function() {
            this.innerHTML = '<span class="loading"></span> Verificando...';
            this.disabled = true;
        });

        // Efecto de focus en los inputs
        document.querySelectorAll('.form-control').forEach(function(input) {
            input.addEventListener('focus', function() {
                this.parentNode.parentNode.querySelector('label').style.color = '#667eea';
            });
            
            input.addEventListener('blur', function() {
                this.parentNode.parentNode.querySelector('label').style.color = '#555';
            });
        });
    </script>
</body>
</html>