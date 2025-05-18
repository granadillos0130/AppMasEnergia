<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AppMasEnergia.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MasEnergia - Login Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2E7D32 0%, #4CAF50 25%, #66BB6A 50%, #FFA726 75%, #FF8F00 100%);
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
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 20%, rgba(76, 175, 80, 0.2) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 152, 0, 0.2) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(46, 125, 50, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 167, 38, 0.1) 0%, transparent 50%);
        }

        /* Partículas flotantes */
        .particle {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
            animation: float 6s infinite ease-in-out;
        }

        .particle:nth-child(1) { 
            width: 8px; height: 8px; 
            background: rgba(76, 175, 80, 0.3);
            top: 10%; left: 10%; 
            animation-delay: -2s;
        }
        .particle:nth-child(2) { 
            width: 12px; height: 12px; 
            background: rgba(255, 152, 0, 0.3);
            top: 20%; right: 20%; 
            animation-delay: -4s;
        }
        .particle:nth-child(3) { 
            width: 6px; height: 6px; 
            background: rgba(76, 175, 80, 0.4);
            bottom: 30%; left: 15%; 
            animation-delay: -1s;
        }
        .particle:nth-child(4) { 
            width: 10px; height: 10px; 
            background: rgba(255, 167, 38, 0.3);
            bottom: 10%; right: 10%; 
            animation-delay: -3s;
        }
        .particle:nth-child(5) { 
            width: 14px; height: 14px; 
            background: rgba(46, 125, 50, 0.2);
            top: 50%; left: 5%; 
            animation-delay: -5s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(120deg); }
            66% { transform: translateY(20px) rotate(240deg); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 50px 40px;
            border-radius: 25px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(255, 255, 255, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 480px;
            margin: 20px;
            position: relative;
            z-index: 10;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #4CAF50, #FF9800, #4CAF50);
            border-radius: 25px;
            z-index: -1;
            opacity: 0.1;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 35px;
        }

        .logo-image {
            width: 120px;
            height: auto;
            margin-bottom: 25px;
            filter: drop-shadow(0 5px 15px rgba(0, 0, 0, 0.1));
            transition: transform 0.3s ease;
        }

        .logo-image:hover {
            transform: scale(1.05);
        }

        .app-title {
            font-size: 32px;
            font-weight: 700;
            background: linear-gradient(135deg, #2E7D32, #4CAF50, #FF8F00);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .app-subtitle {
            font-size: 16px;
            color: #666;
            margin-bottom: 35px;
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
        }

        .form-label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #2E7D32;
            font-size: 15px;
        }

        .form-input {
            width: 100%;
            padding: 18px 25px 18px 55px;
            border: 2px solid #e8f5e9;
            border-radius: 15px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f9fbe7;
            color: #2E7D32;
        }

        .form-input:focus {
            outline: none;
            border-color: #4CAF50;
            background: white;
            box-shadow: 0 0 0 4px rgba(76, 175, 80, 0.1);
            transform: translateY(-2px);
        }

        .form-input::placeholder {
            color: #81C784;
        }

        /* Iconos en inputs */
        .form-group.document-icon::before {
            content: '📄';
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            z-index: 1;
        }

        .form-group.password-icon::before {
            content: '🔒';
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            z-index: 1;
        }

        .login-button {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #4CAF50, #66BB6A, #FF8F00);
            background-size: 200% 200%;
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .login-button:hover {
            background-position: 100% 0;
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(76, 175, 80, 0.4);
        }

        .login-button:hover::before {
            left: 100%;
        }

        .login-button:active {
            transform: translateY(-1px);
        }

        .error-message {
            color: #d32f2f;
            font-size: 14px;
            margin-top: 20px;
            padding: 15px 20px;
            background: linear-gradient(135deg, #ffebee, #fff3e0);
            border-radius: 12px;
            border-left: 4px solid #f44336;
            display: none;
            box-shadow: 0 5px 15px rgba(244, 67, 54, 0.1);
        }

        .error-message.show {
            display: block;
            animation: slideInBounce 0.5s ease;
        }

        @keyframes slideInBounce {
            from {
                opacity: 0;
                transform: translateY(-20px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .footer {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            color: rgba(255, 255, 255, 0.9);
            font-size: 14px;
            text-align: center;
            font-weight: 500;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }

        /* Responsive */
        @media (max-width: 480px) {
            .login-container {
                padding: 40px 25px;
                margin: 15px;
                border-radius: 20px;
            }
            
            .app-title {
                font-size: 28px;
            }
            
            .logo-image {
                width: 100px;
            }
            
            .form-input {
                padding: 15px 20px 15px 50px;
                font-size: 15px;
            }
            
            .login-button {
                padding: 15px;
                font-size: 16px;
            }
        }

        /* Animación de entrada */
        .login-container {
            animation: fadeInUp 0.8s ease;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Efecto de ondas en el fondo */
        .wave {
            position: absolute;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, rgba(76, 175, 80, 0.05), rgba(255, 152, 0, 0.05));
            animation: wave 10s infinite linear;
            border-radius: 50%;
        }

        .wave:nth-child(2) {
            animation-delay: -5s;
            opacity: 0.5;
        }

        @keyframes wave {
            0% { transform: rotate(0deg) translate(-50%, -50%) scale(1); }
            100% { transform: rotate(360deg) translate(-50%, -50%) scale(1.1); }
        }

        /* Mejora de accesibilidad */
        .form-input:focus,
        .login-button:focus {
            outline: 3px solid rgba(76, 175, 80, 0.3);
            outline-offset: 2px;
        }
    </style>
</head>
<body>
    <!-- Partículas de fondo -->
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>

    <!-- Ondas de fondo -->
    <div class="wave" style="top: 10%; left: 10%;"></div>
    <div class="wave" style="bottom: 10%; right: 10%;"></div>

    <form id="form1" runat="server">
        <div class="login-container">
            <div class="logo-container">
                <img src="Resources/Logo.png" alt="MasEnergia Logo" class="logo-image" />
                <h1 class="app-title">MasEnergia</h1>
                <p class="app-subtitle">Panel de Administración</p>
            </div>

            <div class="form-group document-icon">
                <asp:Label ID="lblDocumento" runat="server" Text="Documento" CssClass="form-label" />
                <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-input" placeholder="Ingrese su número de documento" />
            </div>

            <div class="form-group password-icon">
                <asp:Label ID="lblClave" runat="server" Text="Contraseña" CssClass="form-label" />
                <asp:TextBox ID="txtClave" runat="server" TextMode="Password" CssClass="form-input" placeholder="Ingrese su contraseña" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" CssClass="login-button" />
            
            <div id="errorContainer" class="error-message" runat="server">
                <asp:Label ID="lblMensaje" runat="server" />
            </div>
        </div>

        <div class="footer">
            &copy; 2025 MasEnergia. Todos los derechos reservados.
        </div>
    </form>

    <script type="text/javascript">
        // Mostrar mensaje de error con animación
        window.onload = function () {
            var errorContainer = document.getElementById('<%= lblMensaje.ClientID %>');
            if (errorContainer) {
                var errorText = errorContainer.innerText;
                var parentContainer = errorContainer.parentElement;
                
                if (errorText && errorText.trim() !== '') {
                    parentContainer.classList.add('show');
                }
            }
        };

        // Enfoque automático mejorado
        document.addEventListener('DOMContentLoaded', function() {
            var documentInput = document.getElementById('<%= txtDocumento.ClientID %>');
            if (documentInput && documentInput.value === '') {
                setTimeout(function () {
                    documentInput.focus();
                }, 800);
            }

            // Agregar efecto de escritura dinámica (opcional)
            var title = document.querySelector('.app-title');
            var text = title.textContent;
            title.textContent = '';
            var i = 0;
            var timer = setInterval(function () {
                if (i < text.length) {
                    title.textContent += text.charAt(i);
                    i++;
                } else {
                    clearInterval(timer);
                }
            }, 100);
        });

        // Efecto de paralaje sutil en el logo
        document.addEventListener('mousemove', function (e) {
            var logo = document.querySelector('.logo-image');
            var x = (e.clientX / window.innerWidth) - 0.5;
            var y = (e.clientY / window.innerHeight) - 0.5;

            logo.style.transform = `scale(1.05) translate(${x * 10}px, ${y * 10}px)`;
        });

        // Resetear posición del logo al salir el mouse
        document.addEventListener('mouseleave', function () {
            var logo = document.querySelector('.logo-image');
            logo.style.transform = 'scale(1.05) translate(0, 0)';
        });
    </script>
</body>
</html>