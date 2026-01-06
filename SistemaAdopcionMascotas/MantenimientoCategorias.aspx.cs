using Capa_Datos;
using Capa_Negocio;
using System;

namespace SistemaAdopcionMascotas
{
    public partial class MantenimientoCategorias : System.Web.UI.Page
    {
        private CN_Categorias cn = new CN_Categorias();
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
            gvCategorias.DataSource = cn.Listar();
            gvCategorias.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            var cat = new Categorias { Nombre = txtNombre.Text };
            if (btnAgregar.Text == "Agregar")
            {
                cn.Insertar(cat);
            }
            else
            {
                cat.CategoriaID = SelectedID;
                cn.Actualizar(cat);
                btnAgregar.Text = "Agregar";
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

        protected void gvCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            SelectedID = (int)gvCategorias.SelectedDataKey.Value;
            var cat = cn.ObtenerPorID(SelectedID);
            txtNombre.Text = cat.Nombre;
            btnAgregar.Text = "Editar";
        }

        private void Limpiar()
        {
            txtNombre.Text = "";
            SelectedID = 0;
            btnAgregar.Text = "Agregar";
        }
    }
}