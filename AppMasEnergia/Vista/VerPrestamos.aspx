<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Maestra.Master" AutoEventWireup="true" CodeBehind="VerPrestamos.aspx.cs" Inherits="AppMasEnergia.Vista.VerPrestamos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Estilos específicos para la tabla de préstamos */
        .prestamos-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            border: 1px solid #E8F5E9;
        }

        .table-header {
            background: linear-gradient(135deg, #2E7D32, #4CAF50);
            color: white;
            padding: 25px 30px;
            border-bottom: 1px solid #E8F5E9;
        }

        .table-title {
            font-size: 24px;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }

        .table-subtitle {
            font-size: 14px;
            margin: 5px 0 0 0;
            opacity: 0.9;
            color: #C8E6C9;
        }

        .table-filters {
            background: #f8f9fa;
            padding: 20px 30px;
            border-bottom: 1px solid #E8F5E9;
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .filter-label {
            font-weight: 600;
            color: #2E7D32;
            font-size: 14px;
        }

        .filter-input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            min-width: 150px;
        }

        .filter-input:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.1);
        }

        .btn-filter {
            background: linear-gradient(135deg, #4CAF50, #66BB6A);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-filter:hover {
            background: linear-gradient(135deg, #388E3C, #4CAF50);
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(76, 175, 80, 0.3);
        }

        .table-container {
            padding: 30px;
            overflow-x: auto;
        }

        .prestamos-grid {
            width: 100%;
            min-width: 1200px;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            table-layout: fixed;
        }

        .prestamos-grid th {
            background: linear-gradient(135deg, #E8F5E9, #F1F8E9);
            color: #2E7D32;
            padding: 15px 12px;
            text-align: left;
            font-weight: 700;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #4CAF50;
            position: sticky;
            top: 0;
            z-index: 10;
            white-space: nowrap;
            overflow: hidden;
        }

        .prestamos-grid td {
            padding: 15px 12px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: top;
            font-size: 14px;
            color: #2c3e50;
            transition: background-color 0.3s ease;
            white-space: normal;
            overflow: hidden;
            text-overflow: ellipsis;
            font-weight: 500;
        }

        .prestamos-grid tr:hover td {
            background-color: #f8fffe;
        }

        .prestamos-grid tr:nth-child(even) td {
            background-color: #fafafa;
        }

        .prestamos-grid tr:nth-child(even):hover td {
            background-color: #f0f8ff;
        }

        /* Estilos para columnas específicas */
        .col-id {
            width: 80px;
            text-align: center;
            font-weight: 600;
            color: #2E7D32;
        }

        .col-empresa {
            width: 200px;
            font-weight: 600;
        }

        .col-productos {
            width: 200px;
            min-width: 150px;
            max-width: 200px;
            word-wrap: break-word;
            word-break: normal;
            white-space: normal;
            overflow: hidden;
        }

        .col-cantidad {
            width: 120px;
            text-align: center;
            font-weight: 600;
            color: #FF8F00;
        }

        .col-fecha {
            width: 130px;
            text-align: center;
        }

        .col-fecha-devolucion {
            width: 150px;
            text-align: center;
        }

        .col-estado {
            width: 120px;
            text-align: center;
        }

        .col-observaciones {
            width: 180px;
            min-width: 120px;
            max-width: 180px;
            word-wrap: break-word;
            word-break: normal;
            white-space: normal;
            overflow: hidden;
        }

        .col-acciones {
            width: 150px;
            text-align: center;
        }

        /* Estados de préstamo */
        .estado-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .estado-activo {
            background: #E8F5E9;
            color: #2E7D32;
            border: 1px solid #4CAF50;
        }

        .estado-vencido {
            background: #FFEBEE;
            color: #C62828;
            border: 1px solid #F44336;
        }

        .estado-devuelto {
            background: #E3F2FD;
            color: #1565C0;
            border: 1px solid #2196F3;
        }

        .estado-pendiente {
            background: #FFF3E0;
            color: #EF6C00;
            border: 1px solid #FF9800;
        }

        /* Botones de acción */
        .btn-actions {
            display: flex;
            gap: 8px;
            justify-content: center;
            align-items: center;
        }

        .btn-action {
            padding: 6px 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            color: white;
        }

        .btn-view {
            background: linear-gradient(135deg, #2196F3, #42A5F5);
        }

        .btn-view:hover {
            background: linear-gradient(135deg, #1976D2, #2196F3);
            transform: translateY(-1px);
            box-shadow: 0 3px 8px rgba(33, 150, 243, 0.3);
        }

        .btn-edit {
            background: linear-gradient(135deg, #FF9800, #FFB74D);
        }

        .btn-edit:hover {
            background: linear-gradient(135deg, #F57C00, #FF9800);
            transform: translateY(-1px);
            box-shadow: 0 3px 8px rgba(255, 152, 0, 0.3);
        }

        .btn-delete {
            background: linear-gradient(135deg, #F44336, #EF5350);
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #D32F2F, #F44336);
            transform: translateY(-1px);
            box-shadow: 0 3px 8px rgba(244, 67, 54, 0.3);
        }

        /* Mensaje cuando no hay datos */
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .no-data-icon {
            font-size: 48px;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .no-data-title {
            font-size: 20px;
            color: #2E7D32;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .no-data-subtitle {
            font-size: 14px;
            color: #666;
        }

        /* Información de paginación */
        .pagination-info {
            background: #f8f9fa;
            padding: 15px 30px;
            border-top: 1px solid #E8F5E9;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .pagination-summary {
            color: #666;
            font-size: 14px;
        }

        .pagination-controls {
            display: flex;
            gap: 10px;
        }

        .pagination-btn {
            padding: 6px 12px;
            border: 1px solid #ddd;
            background: white;
            color: #333;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .pagination-btn:hover {
            background: #4CAF50;
            color: white;
            border-color: #4CAF50;
        }

        .pagination-btn:disabled {
            background: #f5f5f5;
            color: #999;
            cursor: not-allowed;
        }

        /* Modal para ver detalles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            display: none;
            align-items: center;
            justify-content: center;
            opacity: 0;
            backdrop-filter: blur(8px);
            transition: opacity 0.3s ease;
        }

        .modal-overlay.show {
            display: flex;
            opacity: 1;
        }

        .modal-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            max-width: 700px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            transform: scale(0.9) translateY(20px);
            transition: transform 0.3s ease;
            border: 1px solid #E8F5E9;
        }

        .modal-overlay.show .modal-container {
            transform: scale(1) translateY(0);
        }

        .modal-header {
            background: linear-gradient(135deg, #2E7D32, #4CAF50);
            color: white;
            padding: 25px 30px;
            border-radius: 20px 20px 0 0;
            border-bottom: 1px solid #E8F5E9;
            position: relative;
        }

        .modal-title {
            font-size: 24px;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }

        .modal-subtitle {
            font-size: 14px;
            margin-top: 8px;
            color: #C8E6C9;
            opacity: 0.9;
        }

        .modal-close {
            position: absolute;
            top: 20px;
            right: 25px;
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .modal-close:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: rotate(90deg);
        }

        .modal-body {
            padding: 30px;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .detail-item {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 12px;
            border-left: 4px solid #4CAF50;
            transition: all 0.3s ease;
        }

        .detail-item:hover {
            background: #f0f8ff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .detail-label {
            font-size: 12px;
            font-weight: 700;
            color: #2E7D32;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .detail-value {
            font-size: 16px;
            font-weight: 600;
            color: #2c3e50;
            word-wrap: break-word;
            line-height: 1.5;
        }

        .detail-value.large {
            font-size: 18px;
            color: #2E7D32;
        }

        .detail-value.muted {
            color: #666;
            font-style: italic;
            font-weight: 400;
        }

        .modal-actions {
            background: #f8f9fa;
            padding: 20px 30px;
            border-radius: 0 0 20px 20px;
            border-top: 1px solid #E8F5E9;
            display: flex;
            gap: 15px;
            justify-content: flex-end;
        }

        .btn-modal {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            color: white;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-modal.primary {
            background: linear-gradient(135deg, #4CAF50, #66BB6A);
        }

        .btn-modal.primary:hover {
            background: linear-gradient(135deg, #388E3C, #4CAF50);
            transform: translateY(-1px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-modal.secondary {
            background: linear-gradient(135deg, #757575, #9E9E9E);
        }

        .btn-modal.secondary:hover {
            background: linear-gradient(135deg, #616161, #757575);
            transform: translateY(-1px);
            box-shadow: 0 5px 15px rgba(117, 117, 117, 0.3);
        }

        /* Responsive modal */
        @media (max-width: 768px) {
            .modal-container {
                width: 95%;
                max-height: 95vh;
            }

            .modal-header {
                padding: 20px 25px;
            }

            .modal-body {
                padding: 20px;
            }

            .detail-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }

            .modal-actions {
                padding: 15px 20px;
                flex-direction: column;
            }

            .btn-modal {
                width: 100%;
                justify-content: center;
            }
        }

        /* Animación de apertura */
        @keyframes modalFadeIn {
            from {
                opacity: 0;
                transform: scale(0.8) translateY(50px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .modal-container.opening {
            animation: modalFadeIn 0.4s ease;
        }
        @media (max-width: 768px) {
            .table-filters {
                flex-direction: column;
                align-items: stretch;
            }

            .filter-group {
                width: 100%;
                justify-content: space-between;
            }

            .filter-input {
                min-width: auto;
                flex: 1;
            }

            .table-container {
                padding: 15px;
            }

            .prestamos-grid {
                font-size: 12px;
            }

            .prestamos-grid th,
            .prestamos-grid td {
                padding: 10px 8px;
            }

            .btn-actions {
                flex-direction: column;
                gap: 4px;
            }

            .col-productos,
            .col-observaciones {
                max-width: 150px;
            }
        }

        /* Animaciones */
        .prestamos-container {
            animation: fadeInUp 0.6s ease;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Tooltip para campos largos */
        .tooltip {
            position: relative;
            cursor: help;
        }

        .tooltip:hover::after {
            content: attr(data-tooltip);
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            background: #333;
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 12px;
            white-space: nowrap;
            z-index: 1000;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .tooltip:hover::before {
            content: '';
            position: absolute;
            bottom: 100%;
            left: 50%;
            transform: translateX(-50%);
            border: 6px solid transparent;
            border-top-color: #333;
            z-index: 1000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
    <h1 style="color: #2E7D32; font-size: 28px; font-weight: 700; margin: 0;">Gestión de Préstamos</h1>
    <p style="color: #666; margin: 8px 0 0 0;">Administre y supervise todos los préstamos de equipos</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="prestamos-container">
        <!-- Header de la tabla -->
        <div class="table-header">
            <h2 class="table-title">📋 Lista de Préstamos</h2>
            <p class="table-subtitle">Visualice y gestione todos los préstamos registrados en el sistema</p>
        </div>

    <!-- Modal para ver detalles del préstamo -->
    <div class="modal-overlay" id="modalDetalles">
        <div class="modal-container">
            <div class="modal-header">
                <h3 class="modal-title">Detalles del Préstamo</h3>
                <p class="modal-subtitle">Información completa del préstamo seleccionado</p>
                <button type="button" class="modal-close" onclick="cerrarModal()">✕</button>
            </div>
            <div class="modal-body">
                <div class="detail-grid">
                    <div class="detail-item">
                        <div class="detail-label">ID del Préstamo</div>
                        <div class="detail-value large" id="detailPrestamoID">-</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Empresa</div>
                        <div class="detail-value large" id="detailEmpresa">-</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Estado</div>
                        <div class="detail-value" id="detailEstado">-</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Cantidad Total</div>
                        <div class="detail-value" id="detailCantidad">-</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Fecha de Préstamo</div>
                        <div class="detail-value" id="detailFechaPrestamo">-</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Fecha de Devolución</div>
                        <div class="detail-value" id="detailFechaDevolucion">-</div>
                    </div>
                </div>
                <div class="detail-item" style="grid-column: 1 / -1;">
                    <div class="detail-label">Productos</div>
                    <div class="detail-value" id="detailProductos">-</div>
                </div>
                <div class="detail-item" style="grid-column: 1 / -1;">
                    <div class="detail-label">Observaciones</div>
                    <div class="detail-value" id="detailObservaciones">-</div>
                </div>
            </div>
            <div class="modal-actions">
                <button type="button" class="btn-modal secondary" onclick="cerrarModal()">
                    🚪 Cerrar
                </button>
                <button type="button" class="btn-modal primary" onclick="editarPrestamo()">
                    ✏️ Editar Préstamo
                </button>
            </div>
        </div>
    </div>

        <!-- Filtros de búsqueda -->
        <div class="table-filters">
            <div class="filter-group">
                <span class="filter-label">Empresa:</span>
                <asp:TextBox ID="txtFiltroEmpresa" runat="server" CssClass="filter-input" placeholder="Buscar por empresa..." />
            </div>
            <div class="filter-group">
                <span class="filter-label">Estado:</span>
                <asp:DropDownList ID="ddlFiltroEstado" runat="server" CssClass="filter-input">
                    <asp:ListItem Text="Todos los estados" Value="" />
                    <asp:ListItem Text="Activo" Value="Activo" />
                    <asp:ListItem Text="Vencido" Value="Vencido" />
                    <asp:ListItem Text="Devuelto" Value="Devuelto" />
                    <asp:ListItem Text="Pendiente" Value="Pendiente" />
                </asp:DropDownList>
            </div>
            <div class="filter-group">
                <span class="filter-label">Fecha desde:</span>
                <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="filter-input" TextMode="Date" />
            </div>
            <div class="filter-group">
                <span class="filter-label">Fecha hasta:</span>
                <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="filter-input" TextMode="Date" />
            </div>
            <asp:Button ID="btnFiltrar" runat="server" Text="🔍 Filtrar" CssClass="btn-filter" />
            <asp:Button ID="btnLimpiar" runat="server" Text="🗑️ Limpiar" CssClass="btn-filter" 
                        style="background: linear-gradient(135deg, #757575, #9E9E9E);" />
        </div>

        <!-- Contenedor de la tabla -->
        <div class="table-container">
            <asp:GridView ID="gvPrestamos" runat="server" 
                          CssClass="prestamos-grid"
                          AutoGenerateColumns="false"
                          EmptyDataText="">
                <Columns>
                    <asp:BoundField DataField="PrestamoID" 
                                   HeaderText="ID"
                                   ItemStyle-CssClass="col-id"
                                   HeaderStyle-CssClass="col-id" />

                    <asp:BoundField DataField="Empresa" 
                                   HeaderText="Empresa"
                                   ItemStyle-CssClass="col-empresa"
                                   HeaderStyle-CssClass="col-empresa" />

                    <asp:TemplateField HeaderText="Productos" 
                                      ItemStyle-CssClass="col-productos"
                                      HeaderStyle-CssClass="col-productos">
                        <ItemTemplate>
                            <div class="tooltip" data-tooltip='<%# Eval("Productos") %>'>
                                <%# Eval("Productos").ToString().Length > 50 ? 
                                    Eval("Productos").ToString().Substring(0, 50) + "..." : 
                                    Eval("Productos") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="CantidadTotalPrestada" 
                                   HeaderText="Cantidad"
                                   ItemStyle-CssClass="col-cantidad"
                                   HeaderStyle-CssClass="col-cantidad"
                                   DataFormatString="{0:N0}" />

                    <asp:BoundField DataField="FechaPrestamo" 
                                   HeaderText="Fecha Préstamo"
                                   ItemStyle-CssClass="col-fecha"
                                   HeaderStyle-CssClass="col-fecha"
                                   DataFormatString="{0:dd/MM/yyyy}" />

                    <asp:TemplateField HeaderText="Fecha Devolución" 
                                      ItemStyle-CssClass="col-fecha-devolucion"
                                      HeaderStyle-CssClass="col-fecha-devolucion">
                        <ItemTemplate>
                            <%# Eval("FechaDevolucionPrevista") != null ? 
                                ((DateTime)Eval("FechaDevolucionPrevista")).ToString("dd/MM/yyyy") : 
                                "<span style='color: #999; font-style: italic;'>No definida</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Estado" 
                                      ItemStyle-CssClass="col-estado"
                                      HeaderStyle-CssClass="col-estado">
                        <ItemTemplate>
                            <span class='estado-badge <%# "estado-" + Eval("Estado").ToString().ToLower() %>'>
                                <%# Eval("Estado") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Observaciones" 
                                      ItemStyle-CssClass="col-observaciones"
                                      HeaderStyle-CssClass="col-observaciones">
                        <ItemTemplate>
                            <div class="tooltip" data-tooltip='<%# Eval("Observaciones") %>'>
                                <%# string.IsNullOrEmpty(Eval("Observaciones").ToString()) ? 
                                    "<span style='color: #999; font-style: italic;'>Sin observaciones</span>" :
                                    (Eval("Observaciones").ToString().Length > 30 ? 
                                     Eval("Observaciones").ToString().Substring(0, 30) + "..." : 
                                     Eval("Observaciones")) %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Acciones" 
                                      ItemStyle-CssClass="col-acciones"
                                      HeaderStyle-CssClass="col-acciones">
                        <ItemTemplate>
                            <div class="btn-actions">
                                <asp:LinkButton ID="btnVer" runat="server" 
                                              CssClass="btn-action btn-view"
                                              CommandArgument='<%# Eval("PrestamoID") %>'
                                              ToolTip="Ver detalles"
                                              OnClientClick='<%# "verDetalles(" + Eval("PrestamoID") + ", \"" + Eval("Empresa") + "\", \"" + Eval("Productos") + "\", " + Eval("CantidadTotalPrestada") + ", \"" + Eval("FechaPrestamo", "{0:dd/MM/yyyy}") + "\", \"" + (Eval("FechaDevolucionPrevista") != null ? Eval("FechaDevolucionPrevista", "{0:dd/MM/yyyy}") : "No definida") + "\", \"" + Eval("Estado") + "\", \"" + Eval("Observaciones") + "\"); return false;" %>'>
                                    👁️ Ver
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnEditar" runat="server" 
                                              CssClass="btn-action btn-edit"
                                              CommandArgument='<%# Eval("PrestamoID") %>'
                                              ToolTip="Editar préstamo">
                                    ✏️ Editar
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnEliminar" runat="server" 
                                              CssClass="btn-action btn-delete"
                                              CommandArgument='<%# Eval("PrestamoID") %>'
                                              ToolTip="Eliminar préstamo"
                                              OnClientClick="return confirm('¿Está seguro de que desea eliminar este préstamo?');">
                                    🗑️ Eliminar
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>


                <EmptyDataTemplate>
                    <div class="no-data">
                        <div class="no-data-icon">📋</div>
                        <div class="no-data-title">No se encontraron préstamos</div>
                        <div class="no-data-subtitle">
                            No hay préstamos registrados en el sistema o los filtros aplicados no coinciden con ningún registro.
                        </div>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <!-- Información de paginación -->
        <div class="pagination-info">
            <div class="pagination-summary">
                <asp:Label ID="lblTotalRegistros" runat="server" Text=""></asp:Label>
            </div>
            <div class="pagination-controls">
                <asp:Button ID="btnAnterior" runat="server" Text="← Anterior" CssClass="pagination-btn" />
                <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente →" CssClass="pagination-btn" />
            </div>
        </div>
    </div>

    <!-- Script para mejorar la experiencia del usuario -->
    <script type="text/javascript">
        // Configurar filtros automáticos
        document.addEventListener('DOMContentLoaded', function() {
            // Filtro en tiempo real para empresa
            const empresaInput = document.getElementById('<%= txtFiltroEmpresa.ClientID %>');
            if (empresaInput) {
                let timeout;
                empresaInput.addEventListener('input', function() {
                    clearTimeout(timeout);
                    timeout = setTimeout(function() {
                        // Aquí podrías implementar filtrado en tiempo real
                    }, 500);
                });
            }

            // Efectos de hover mejorados
            const rows = document.querySelectorAll('.prestamos-grid tbody tr');
            rows.forEach(row => {
                row.addEventListener('mouseenter', function() {
                    this.style.transform = 'scale(1.01)';
                    this.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.1)';
                    this.style.transition = 'all 0.3s ease';
                });
                
                row.addEventListener('mouseleave', function() {
                    this.style.transform = 'scale(1)';
                    this.style.boxShadow = 'none';
                });
            });

            // Actualizar contador de registros
            actualizarContadorRegistros();

            // Event listener para cerrar modal con ESC
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    cerrarModal();
                }
            });

            // Event listener para cerrar modal al hacer clic fuera
            const modalOverlay = document.getElementById('modalDetalles');
            modalOverlay.addEventListener('click', function(e) {
                if (e.target === modalOverlay) {
                    cerrarModal();
                }
            });
        });

        // Función para mostrar detalles del préstamo en modal
        function verDetalles(prestamoId, empresa, productos, cantidad, fechaPrestamo, fechaDevolucion, estado, observaciones) {
            // Llenar los campos del modal
            document.getElementById('detailPrestamoID').textContent = prestamoId;
            document.getElementById('detailEmpresa').textContent = empresa;
            document.getElementById('detailProductos').textContent = productos || 'No especificado';
            document.getElementById('detailCantidad').textContent = cantidad + ' unidades';
            document.getElementById('detailFechaPrestamo').textContent = fechaPrestamo;
            document.getElementById('detailFechaDevolucion').textContent = fechaDevolucion;
            
            // Establecer el estado con badge de color
            const estadoElement = document.getElementById('detailEstado');
            estadoElement.innerHTML = `<span class="estado-badge estado-${estado.toLowerCase()}">${estado}</span>`;
            
            // Observaciones
            document.getElementById('detailObservaciones').textContent = observaciones || 'Sin observaciones';
            document.getElementById('detailObservaciones').className = observaciones ? 'detail-value' : 'detail-value muted';

            // Mostrar el modal
            const modal = document.getElementById('modalDetalles');
            modal.classList.add('show');
            const container = modal.querySelector('.modal-container');
            container.classList.add('opening');
            
            // Remover la clase de animación después de que termine
            setTimeout(() => {
                container.classList.remove('opening');
            }, 400);

            // Prevenir scroll en el body
            document.body.style.overflow = 'hidden';
        }

        // Función para cerrar el modal
        function cerrarModal() {
            const modal = document.getElementById('modalDetalles');
            modal.classList.remove('show');
            
            // Restaurar scroll en el body
            document.body.style.overflow = 'auto';
        }

        // Función para editar préstamo (placeholder)
        function editarPrestamo() {
            const prestamoId = document.getElementById('detailPrestamoID').textContent;
            alert(`Función de editar préstamo ${prestamoId} - Por implementar`);
            // Aquí puedes redirigir a la página de edición
            // window.location.href = `EditarPrestamo.aspx?id=${prestamoId}`;
        }

        // Función para actualizar el contador de registros
        function actualizarContadorRegistros() {
            const grid = document.querySelector('.prestamos-grid');
            const label = document.getElementById('<%= lblTotalRegistros.ClientID %>');

            if (grid && label) {
                const rows = grid.querySelectorAll('tbody tr');
                const count = rows.length;

                if (count > 0) {
                    label.textContent = `Mostrando ${count} préstamo${count !== 1 ? 's' : ''} en total`;
                } else {
                    label.textContent = 'No hay préstamos para mostrar';
                }
            }
        }

        // Función para resaltar filtros activos
        function resaltarFiltrosActivos() {
            const filtros = document.querySelectorAll('.filter-input');
            filtros.forEach(filtro => {
                if (filtro.value && filtro.value.trim() !== '') {
                    filtro.style.borderColor = '#4CAF50';
                    filtro.style.boxShadow = '0 0 0 2px rgba(76, 175, 80, 0.1)';
                } else {
                    filtro.style.borderColor = '#ddd';
                    filtro.style.boxShadow = 'none';
                }
            });
        }

        // Función para formatear números
        function formatearNumero(numero) {
            return new Intl.NumberFormat('es-ES').format(numero);
        }

        // Función para formatear fechas
        function formatearFecha(fecha) {
            if (!fecha) return 'No definida';
            const options = {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                weekday: 'long'
            };
            return new Date(fecha).toLocaleDateString('es-ES', options);
        }

        // Ejecutar al cargar la página
        window.addEventListener('load', function () {
            resaltarFiltrosActivos();

            // Agregar evento de cambio a los filtros
            const filtros = document.querySelectorAll('.filter-input');
            filtros.forEach(filtro => {
                filtro.addEventListener('change', resaltarFiltrosActivos);
                filtro.addEventListener('input', resaltarFiltrosActivos);
            });

            // Agregar efectos visuales adicionales
            const cards = document.querySelectorAll('.detail-item');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function () {
                    this.style.borderLeftColor = '#FF8F00';
                });

                card.addEventListener('mouseleave', function () {
                    this.style.borderLeftColor = '#4CAF50';
                });
            });
        });

        // Función para imprimir detalles del préstamo (opcional)
        function imprimirDetalles() {
            const prestamoId = document.getElementById('detailPrestamoID').textContent;
            window.print();
        }

        // Función para exportar detalles (opcional)
        function exportarDetalles() {
            const prestamoId = document.getElementById('detailPrestamoID').textContent;
            alert(`Función de exportar préstamo ${prestamoId} - Por implementar`);
        }
    </script>
</asp:Content>