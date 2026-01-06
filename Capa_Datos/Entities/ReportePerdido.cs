using System;

namespace Capa_Datos.Entities
{
    public class ReportePerdido
    {
        public int ReportePerdidoID { get; set; }
        public int ReporterUsuarioID { get; set; }
        public int MascotaID { get; set; }
        public DateTime FechaReporte { get; set; }
        public string Descripcion { get; set; }
    }
}
