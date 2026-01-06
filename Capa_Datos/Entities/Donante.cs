using System;

namespace Capa_Datos.Entities
{
    public class Donante
    {
        public int DonanteID { get; set; }
        public int UsuarioID { get; set; }
        public decimal Monto { get; set; }
        public DateTime FechaDonacion { get; set; }
    }
}
