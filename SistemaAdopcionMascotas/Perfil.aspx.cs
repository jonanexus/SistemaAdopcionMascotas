using System;
using System.Web;
using System.Web.UI.WebControls;
using Capa_Negocio.Models;
using Capa_Negocio.Services;

namespace SistemaAdopcionMascotas
{
    public partial class Perfil : System.Web.UI.Page
    {
        private UsuarioService _usuarioService;
        private int _usuarioId;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Obtener ID del usuario desde la sesión
            if (Session["UsuarioID"] != null)
            {
                _usuarioId = Convert.ToInt32(Session["UsuarioID"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Inicializar servicio
            _usuarioService = new UsuarioService();

            if (!IsPostBack)
            {
                LoadUserProfile();
                InitializeFormControls();
            }
        }

        private void LoadUserProfile()
        {
            try
            {
                var perfil = _usuarioService.GetPerfilViewModel(_usuarioId);

                if (perfil != null)
                {
                    // Cargar datos en los controles de solo lectura
                    lblNombreUsuario.Text = perfil.NombreUsuario;
                    lblEmail.Text = perfil.Email;
                    lblRol.Text = perfil.Rol;
                    lblFechaRegistro.Text = perfil.FechaRegistro.ToString("dd/MM/yyyy");

                    // Cargar foto de perfil si existe
                    if (!string.IsNullOrEmpty(perfil.FotoPerfilBase64))
                    {
                        imgFotoPerfil.ImageUrl = $"data:image/jpeg;base64,{perfil.FotoPerfilBase64}";
                        imgFotoPerfil.Visible = true;
                    }

                    // Cargar estadísticas
                    lblTotalAdopciones.Text = perfil.TotalAdopciones.ToString();
                    lblTotalDonaciones.Text = perfil.TotalDonaciones.ToString();
                    lblTotalSolicitudes.Text = perfil.TotalSolicitudes.ToString();
                    lblTotalReportes.Text = perfil.TotalReportes.ToString();

                    // Cargar información personal en labels
                    lblNombreCompleto.Text = string.IsNullOrEmpty(perfil.NombreCompleto) ?
                        "No especificado" : perfil.NombreCompleto;

                    lblTelefono.Text = string.IsNullOrEmpty(perfil.Telefono) ?
                        "No especificado" : perfil.Telefono;

                    lblDireccion.Text = string.IsNullOrEmpty(perfil.Direccion) ?
                        "No especificado" : perfil.Direccion;

                    lblCiudad.Text = string.IsNullOrEmpty(perfil.Ciudad) ?
                        "No especificado" : perfil.Ciudad;

                    lblEstado.Text = string.IsNullOrEmpty(perfil.Estado) ?
                        "No especificado" : perfil.Estado;

                    lblCodigoPostal.Text = string.IsNullOrEmpty(perfil.CodigoPostal) ?
                        "No especificado" : perfil.CodigoPostal;

                    lblFechaNacimiento.Text = perfil.FechaNacimiento.HasValue ?
                        perfil.FechaNacimiento.Value.ToString("dd/MM/yyyy") : "No especificado";

                    lblAcercaDeMi.Text = string.IsNullOrEmpty(perfil.AcercaDeMi) ?
                        "No hay información" : perfil.AcercaDeMi;

                    // Cargar información de adopción
                    lblTipoVivienda.Text = string.IsNullOrEmpty(perfil.TipoVivienda) ?
                        "No especificado" : perfil.TipoVivienda;

                    lblTieneOtrasMascotas.Text = perfil.TieneOtrasMascotas.HasValue ?
                        (perfil.TieneOtrasMascotas.Value ? "Sí" : "No") : "No especificado";

                    lblDescripcionOtrasMascotas.Text = string.IsNullOrEmpty(perfil.DescripcionOtrasMascotas) ?
                        "No hay información" : perfil.DescripcionOtrasMascotas;

                    lblTieneNinos.Text = perfil.TieneNinos.HasValue ?
                        (perfil.TieneNinos.Value ? "Sí" : "No") : "No especificado";

                    lblExperienciaMascotas.Text = string.IsNullOrEmpty(perfil.ExperienciaMascotas) ?
                        "No especificado" : perfil.ExperienciaMascotas;

                    lblHorasSolaMascota.Text = string.IsNullOrEmpty(perfil.HorasSolaMascota) ?
                        "No especificado" : perfil.HorasSolaMascota;

                    // Cargar valores en los controles de edición
                    txtNombreCompleto.Text = perfil.NombreCompleto;
                    txtTelefono.Text = perfil.Telefono;
                    txtDireccion.Text = perfil.Direccion;
                    txtCiudad.Text = perfil.Ciudad;
                    txtEstado.Text = perfil.Estado;
                    txtCodigoPostal.Text = perfil.CodigoPostal;
                    txtFechaNacimiento.Text = perfil.FechaNacimiento.HasValue ?
                        perfil.FechaNacimiento.Value.ToString("yyyy-MM-dd") : "";
                    txtAcercaDeMi.Text = perfil.AcercaDeMi;

                    // Seleccionar valores en dropdowns
                    if (!string.IsNullOrEmpty(perfil.TipoVivienda))
                        ddlTipoVivienda.SelectedValue = perfil.TipoVivienda;

                    if (perfil.TieneOtrasMascotas.HasValue)
                        ddlTieneOtrasMascotas.SelectedValue = perfil.TieneOtrasMascotas.Value.ToString().ToLower();

                    txtDescripcionOtrasMascotas.Text = perfil.DescripcionOtrasMascotas;

                    if (perfil.TieneNinos.HasValue)
                        ddlTieneNinos.SelectedValue = perfil.TieneNinos.Value.ToString().ToLower();

                    if (!string.IsNullOrEmpty(perfil.ExperienciaMascotas))
                        ddlExperienciaMascotas.SelectedValue = perfil.ExperienciaMascotas;

                    if (!string.IsNullOrEmpty(perfil.HorasSolaMascota))
                        ddlHorasSolaMascota.SelectedValue = perfil.HorasSolaMascota;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error al cargar el perfil: {ex.Message}", "danger");
            }
        }

        private void InitializeFormControls()
        {
            // Inicializar dropdowns si es necesario
            if (!IsPostBack)
            {
                // Tipo de vivienda
                ddlTipoVivienda.Items.Add(new ListItem("Seleccione", ""));
                ddlTipoVivienda.Items.Add(new ListItem("Casa con patio", "Casa con patio"));
                ddlTipoVivienda.Items.Add(new ListItem("Departamento", "Departamento"));
                ddlTipoVivienda.Items.Add(new ListItem("Casa sin patio", "Casa sin patio"));
                ddlTipoVivienda.Items.Add(new ListItem("Casa con jardín grande", "Casa con jardín grande"));

                // Sí/No dropdowns
                ddlTieneOtrasMascotas.Items.Add(new ListItem("Seleccione", ""));
                ddlTieneOtrasMascotas.Items.Add(new ListItem("Sí", "true"));
                ddlTieneOtrasMascotas.Items.Add(new ListItem("No", "false"));

                ddlTieneNinos.Items.Add(new ListItem("Seleccione", ""));
                ddlTieneNinos.Items.Add(new ListItem("Sí", "true"));
                ddlTieneNinos.Items.Add(new ListItem("No", "false"));

                // Experiencia
                ddlExperienciaMascotas.Items.Add(new ListItem("Seleccione", ""));
                ddlExperienciaMascotas.Items.Add(new ListItem("Mucha experiencia", "Mucha experiencia"));
                ddlExperienciaMascotas.Items.Add(new ListItem("Algo de experiencia", "Algo de experiencia"));
                ddlExperienciaMascotas.Items.Add(new ListItem("Poca experiencia", "Poca experiencia"));
                ddlExperienciaMascotas.Items.Add(new ListItem("Ninguna experiencia", "Ninguna experiencia"));

                // Horas sola
                ddlHorasSolaMascota.Items.Add(new ListItem("Seleccione", ""));
                ddlHorasSolaMascota.Items.Add(new ListItem("Menos de 4 horas", "Menos de 4 horas"));
                ddlHorasSolaMascota.Items.Add(new ListItem("4-8 horas", "4-8 horas"));
                ddlHorasSolaMascota.Items.Add(new ListItem("Más de 8 horas", "Más de 8 horas"));
            }
        }

        protected void btnGuardarPerfil_Click(object sender, EventArgs e)
        {
            try
            {
                var perfil = new PerfilViewModel
                {
                    UsuarioID = _usuarioId,
                    NombreCompleto = txtNombreCompleto.Text,
                    Telefono = txtTelefono.Text,
                    Direccion = txtDireccion.Text,
                    Ciudad = txtCiudad.Text,
                    Estado = txtEstado.Text,
                    CodigoPostal = txtCodigoPostal.Text,
                    FechaNacimiento = string.IsNullOrEmpty(txtFechaNacimiento.Text) ?
                        (DateTime?)null : DateTime.Parse(txtFechaNacimiento.Text),
                    AcercaDeMi = txtAcercaDeMi.Text,
                    TipoVivienda = ddlTipoVivienda.SelectedValue,
                    TieneOtrasMascotas = string.IsNullOrEmpty(ddlTieneOtrasMascotas.SelectedValue) ?
                        (bool?)null : ddlTieneOtrasMascotas.SelectedValue == "true",
                    DescripcionOtrasMascotas = txtDescripcionOtrasMascotas.Text,
                    TieneNinos = string.IsNullOrEmpty(ddlTieneNinos.SelectedValue) ?
                        (bool?)null : ddlTieneNinos.SelectedValue == "true",
                    ExperienciaMascotas = ddlExperienciaMascotas.SelectedValue,
                    HorasSolaMascota = ddlHorasSolaMascota.SelectedValue,
                    FotoPerfilFile = fileFotoPerfil.PostedFile
                };

                var resultado = _usuarioService.UpdatePerfil(perfil);

                if (resultado)
                {
                    ShowMessage("Perfil actualizado correctamente.", "success");
                    LoadUserProfile(); // Recargar datos

                    // Actualizar nombre en sesión si se cambió
                    if (!string.IsNullOrEmpty(perfil.NombreCompleto))
                    {
                        Session["NombreUsuario"] = perfil.NombreCompleto;
                    }
                }
                else
                {
                    ShowMessage("Error al actualizar el perfil.", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error: {ex.Message}", "danger");
            }
        }

        protected void btnCambiarContraseña_Click(object sender, EventArgs e)
        {
            try
            {
                var currentPassword = txtCurrentPassword.Text;
                var newPassword = txtNewPassword.Text;
                var confirmPassword = txtConfirmPassword.Text;

                // Validaciones
                if (string.IsNullOrEmpty(currentPassword) ||
                    string.IsNullOrEmpty(newPassword) ||
                    string.IsNullOrEmpty(confirmPassword))
                {
                    ShowPasswordMessage("Todos los campos son requeridos.", "danger");
                    return;
                }

                if (newPassword != confirmPassword)
                {
                    ShowPasswordMessage("Las contraseñas nuevas no coinciden.", "danger");
                    return;
                }

                if (newPassword.Length < 6)
                {
                    ShowPasswordMessage("La contraseña debe tener al menos 6 caracteres.", "danger");
                    return;
                }

                var resultado = _usuarioService.UpdatePassword(_usuarioId, currentPassword, newPassword);

                if (resultado)
                {
                    ShowPasswordMessage("Contraseña cambiada correctamente.", "success");

                    // Limpiar campos
                    txtCurrentPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    ShowPasswordMessage("Error al cambiar la contraseña. Verifica tu contraseña actual.", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowPasswordMessage($"Error: {ex.Message}", "danger");
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMensaje.Text = message;
            lblMensaje.CssClass = $"alert alert-{type}";
            lblMensaje.Visible = true;
        }

        private void ShowPasswordMessage(string message, string type)
        {
            PasswordMensaje.Text = message;
            PasswordMensaje.CssClass = $"alert alert-{type}";
            PasswordMensaje.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdopterDashboard.aspx");
        }
    }
}
