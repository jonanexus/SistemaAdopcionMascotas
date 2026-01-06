using System;

namespace SistemaAdopcionMascotas
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Eliminar datos de sesión y forzar expiración
            Session.Clear();
            Session.Abandon();

            // Eliminar cookie de sesión (por seguridad)
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                var cookie = new System.Web.HttpCookie("ASP.NET_SessionId", "")
                {
                    Expires = DateTime.Now.AddDays(-1),
                    HttpOnly = true
                };
                Response.Cookies.Add(cookie);
            }

            // Redirigir a la página de login
            Response.Redirect("Login.aspx");
        }
    }
}
