using Capa_Negocio;
using System;


namespace SistemaAdopcionMascotas
{
    public partial class Recuperacion : System.Web.UI.Page
    {
        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            CN_Usuarios cn = new CN_Usuarios();
            cn.RecuperarContraseña(txtEmail.Text);
            lblMensaje.Text = "Clave temporal enviada a tu email (expira en 30 min).";
        }
    }
}