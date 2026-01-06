using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_FotosMascotas
    {
        public void Insertar(FotosMascotas foto)
        {
            if (foto.MascotaID == 0 || foto.Foto == null) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.FotosMascotas.InsertOnSubmit(foto);
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var f = db.FotosMascotas.First(ff => ff.FotoID == id);
                db.FotosMascotas.DeleteOnSubmit(f);
                db.SubmitChanges();
            }
        }

        public List<FotosMascotas> ListarPorMascota(int mascotaID)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.FotosMascotas.Where(f => f.MascotaID == mascotaID).ToList();
            }
        }
    }
}