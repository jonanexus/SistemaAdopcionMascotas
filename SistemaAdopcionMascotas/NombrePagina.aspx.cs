using System;


namespace SistemaAdopcionMascotas
{
    public partial class Intro : System.Web.UI.Page
    {
        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipal.aspx");
        }
    }
}