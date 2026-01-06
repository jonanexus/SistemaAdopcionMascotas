using Capa_Negocio;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace SistemaAdopcionMascotas
{
    public partial class PaginaPrincipal : System.Web.UI.Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string keyword = txtBuscar.Text.ToLower();
            CN_Mascotas cn = new CN_Mascotas();
            var mascotas = cn.Listar();
            var resultados = mascotas.Where(m => m.Nombre.ToLower().Contains(keyword) || m.Descripcion.ToLower().Contains(keyword)).ToList();
            gvResultados.DataSource = resultados;
            gvResultados.DataBind();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            CN_Usuarios cn = new CN_Usuarios();
            byte[] passCifrada = cn.CifrarAES(txtContraseña.Text);
            var user = cn.Login(txtUsuario.Text, passCifrada);
            if (user != null)
            {
                Session["Usuario"] = user;
                if (user.Rol == "Admin")
                    Response.Redirect("AdminDashboard.aspx");
                else if (user.Rol == "Staff")
                    Response.Redirect("StaffDashboard.aspx");
                else
                    Response.Redirect("AdopterDashboard.aspx");
            }
            else
            {
                lblMensaje.Text = "Credenciales inválidas.";
            }
        }

        protected void lnkRegistro_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        protected void lnkOlvide_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recuperacion.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
