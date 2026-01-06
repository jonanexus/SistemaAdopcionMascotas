using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Vacunas
    {
        public void Insertar(Vacunas vacuna)
        {
            if (vacuna.MascotaID == 0 || string.IsNullOrEmpty(vacuna.NombreVacuna)) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Vacunas.InsertOnSubmit(vacuna);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Vacunas vacuna)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var v = db.Vacunas.First(vv => vv.VacunaID == vacuna.VacunaID);
                v.NombreVacuna = vacuna.NombreVacuna;
                v.FechaVacuna = vacuna.FechaVacuna;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var v = db.Vacunas.First(vv => vv.VacunaID == id);
                db.Vacunas.DeleteOnSubmit(v);
                db.SubmitChanges();
            }
        }

        public List<Vacunas> ListarPorMascota(int mascotaID)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Vacunas.Where(v => v.MascotaID == mascotaID).ToList();
            }
        }
    }
}