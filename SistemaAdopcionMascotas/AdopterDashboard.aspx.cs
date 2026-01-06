using System;

namespace SistemaAdopcionMascotas
{
    public partial class AdopterDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null) Response.Redirect("Login.aspx");
        }
    }
}