using System;
using System.Web;

namespace Capa_Negocio.Models
{
    public class PerfilViewModel
    {
        public int UsuarioID { get; set; }
        public string NombreUsuario { get; set; }
        public string Email { get; set; }
        public string Rol { get; set; }

        // Información personal
        public string NombreCompleto { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public string Estado { get; set; }
        public string CodigoPostal { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string AcercaDeMi { get; set; }

        // Información para adopción
        public string TipoVivienda { get; set; }
        public bool? TieneOtrasMascotas { get; set; }
        public string DescripcionOtrasMascotas { get; set; }
        public bool? TieneNinos { get; set; }
        public string ExperienciaMascotas { get; set; }
        public string HorasSolaMascota { get; set; }

        // Foto de perfil
        public byte[] FotoPerfil { get; set; }
        public HttpPostedFile FotoPerfilFile { get; set; }
        public string FotoPerfilBase64
        {
            get
            {
                if (FotoPerfil != null && FotoPerfil.Length > 0)
                {
                    return Convert.ToBase64String(FotoPerfil);
                }
                return string.Empty;
            }
        }

        // Estadísticas
        public int TotalAdopciones { get; set; }
        public int TotalDonaciones { get; set; }
        public int TotalSolicitudes { get; set; }
        public int TotalReportes { get; set; }
        public DateTime FechaRegistro { get; set; }
    }
}
