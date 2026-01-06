using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_FotosReportesPerdidos
    {
        public void Insertar(FotosReportesPerdidos foto)
        {
            if (foto.ReporteID == 0 || foto.Foto == null) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.FotosReportesPerdidos.InsertOnSubmit(foto);
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var f = db.FotosReportesPerdidos.First(ff => ff.FotoID == id);
                db.FotosReportesPerdidos.DeleteOnSubmit(f);
                db.SubmitChanges();
            }
        }

        public List<FotosReportesPerdidos> ListarPorReporte(int reporteID)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.FotosReportesPerdidos.Where(f => f.ReporteID == reporteID).ToList();
            }
        }
    }
}