using System;

namespace Capa_Datos.Entities
{
    public class Usuario
    {
        public int UsuarioID { get; set; }
        public string NombreUsuario { get; set; }
        public string Contraseña { get; set; } // Cifrada
        public string Email { get; set; }
        public string Rol { get; set; } // 'Admin', 'Staff', 'Adopter'
        public byte[] FotoPerfil { get; set; }
        public string NombreCompleto { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public string Estado { get; set; }
        public string CodigoPostal { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string TipoVivienda { get; set; }
        public bool? TieneOtrasMascotas { get; set; }
        public string DescripcionOtrasMascotas { get; set; }
        public bool? TieneNinos { get; set; }
        public string ExperienciaMascotas { get; set; }
        public string HorasSolaMascota { get; set; }
        public string AcercaDeMi { get; set; }
        public int IntentosFallidos { get; set; }
        public string ClaveTemporal { get; set; }
        public DateTime? FechaExpiracionTemporal { get; set; }
        public DateTime FechaRegistro { get; set; }
        public DateTime? FechaUltimoAcceso { get; set; }
    }
}
