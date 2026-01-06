using System;

namespace Capa_Datos.Entities
{
    public class Mascota
    {
        public int MascotaID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int CategoriaID { get; set; }
        public int RazaID { get; set; }
        public int? UsuarioID { get; set; }
        public DateTime FechaRegistro { get; set; }
    }
}
