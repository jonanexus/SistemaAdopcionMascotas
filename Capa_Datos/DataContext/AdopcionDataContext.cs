using System;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Configuration;

namespace Capa_Datos.DataContext
{
    [Database(Name = "AdopcionMascotasDB1")]
    public class AdopcionDataContext : global::System.Data.Linq.DataContext
    {
        public AdopcionDataContext() : base(ConfigurationManager.ConnectionStrings["AdopcionConnection"].ConnectionString)
        {
        }

        public Table<Capa_Datos.Entities.Usuario> Usuarios;
        public Table<Capa_Datos.Entities.Mascota> Mascotas;
        public Table<Capa_Datos.Entities.Categoria> Categorias;
        public Table<Capa_Datos.Entities.Raza> Razas;
        public Table<Capa_Datos.Entities.SolicitudAdopcion> SolicitudesAdopcion;
        public Table<Capa_Datos.Entities.ReportePerdido> ReportesPerdidos;
        public Table<Capa_Datos.Entities.Donante> Donantes;

        public static object ConfigurationManager { get; }
    }
}
