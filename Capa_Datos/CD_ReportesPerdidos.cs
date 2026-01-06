using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_ReportesPerdidos
    {
        public void Insertar(ReportesPerdidos reporte)
        {
            if (reporte.ReporterUsuarioID == 0 || string.IsNullOrEmpty(reporte.NombreMascota)) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.ReportesPerdidos.InsertOnSubmit(reporte);
                db.SubmitChanges();
            }
        }

        public void Actualizar(ReportesPerdidos reporte)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.ReportesPerdidos.First(rr => rr.ReporteID == reporte.ReporteID);
                r.FinderUsuarioID = reporte.FinderUsuarioID;
                r.Estado = reporte.Estado;
                r.FechaEncontrado = reporte.FechaEncontrado;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.ReportesPerdidos.First(rr => rr.ReporteID == id);
                db.ReportesPerdidos.DeleteOnSubmit(r);
                db.SubmitChanges();
            }
        }

        public List<ReportesPerdidos> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.ReportesPerdidos.ToList();
            }
        }

        public ReportesPerdidos ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.ReportesPerdidos.FirstOrDefault(rr => rr.ReporteID == id);
            }
        }
    }
}