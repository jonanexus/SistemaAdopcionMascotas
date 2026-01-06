using System;

namespace Capa_Datos.Entities
{
    public class SolicitudAdopcion
    {
        public int SolicitudAdopcionID { get; set; }
        public int UsuarioID { get; set; }
        public int MascotaID { get; set; }
        public string Estado { get; set; } // ej. "Approved", "Pending"
        public DateTime FechaSolicitud { get; set; }
    }
}
