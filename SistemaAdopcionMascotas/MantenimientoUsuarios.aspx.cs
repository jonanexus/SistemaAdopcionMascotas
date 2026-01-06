using Capa_Datos;
using Capa_Negocio;
using System;


namespace SistemaAdopcionMascotas
{
    public partial class MantenimientoUsuarios : System.Web.UI.Page
    {
        private CN_Usuarios cn = new CN_Usuarios();
        private int SelectedID { get { return (int)ViewState["SelectedID"]; } set { ViewState["SelectedID"] = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                CargarGrid();
            }
        }

        private void CargarGrid()
        {
            gvUsuarios.DataSource = cn.Listar();
            gvUsuarios.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            var user = new Usuarios { NombreUsuario = txtNombreUsuario.Text, Email = txtEmail.Text, Rol = ddlRol.SelectedValue };
            if (btnAgregar.Text == "Agregar")
            {
                cn.RegistrarUsuario(user, txtPass.Text);
            }
            else
            {
                user.UsuarioID = SelectedID;
                cn.Actualizar(user);
                btnAgregar.Text = "Agregar";
            }
            if (fuFoto.HasFile)
            {
                cn.InsertarFotoPerfil(user.UsuarioID, fuFoto.FileBytes);
            }
            Limpiar();
            CargarGrid();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (SelectedID != 0)
            {
                cn.Eliminar(SelectedID);
                Limpiar();
                CargarGrid();
            }
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            SelectedID = (int)gvUsuarios.SelectedDataKey.Value;
            var user = cn.ObtenerPorID(SelectedID);
            txtNombreUsuario.Text = user.NombreUsuario;
            txtEmail.Text = user.Email;
            ddlRol.SelectedValue = user.Rol;
            btnAgregar.Text = "Editar";
        }

        private void Limpiar()
        {
            txtNombreUsuario.Text = "";
            txtEmail.Text = "";
            txtPass.Text = "";
            SelectedID = 0;
            btnAgregar.Text = "Agregar";
        }
    }
}
