using Capa_Negocio;
using System;

namespace SistemaAdopcionMascotas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            CN_Usuarios cn = new CN_Usuarios();

            // Comprobar si ya está bloqueado antes de intentar el login
            var preUser = cn.ObtenerPorNombre(txtUsuario.Text);
            if (preUser != null && preUser.IntentosFallidos >= 3)
            {
                lblMensaje.Text = "Usuario bloqueado. Contacte al administrador.";
                return;
            }

            byte[] passCifrada = cn.CifrarAES(txtPass.Text);
            var user = cn.Login(txtUsuario.Text, passCifrada);
            if (user != null)
            {
                Session["Usuario"] = user;
                if (user.Rol == "Admin") Response.Redirect("AdminDashboard.aspx");
                else if (user.Rol == "Staff") Response.Redirect("StaffDashboard.aspx");
                else Response.Redirect("AdopterDashboard.aspx");
            }
            else
            {
                // Revisar intentos actualizados tras el fallo y mostrar mensaje de bloqueo si aplica
                var postUser = cn.ObtenerPorNombre(txtUsuario.Text);
                if (postUser != null && postUser.IntentosFallidos >= 3)
                {
                    lblMensaje.Text = "Usuario bloqueado después de demasiados intentos.";
                }
                else
                {
                    lblMensaje.Text = "Credenciales inválidas.";
                }
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
    }
}
