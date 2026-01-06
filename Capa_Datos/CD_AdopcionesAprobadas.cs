using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_AdopcionesAprobadas
    {
        public void Insertar(AdopcionesAprobadas adopcion)
        {
            if (adopcion.UsuarioID == 0 || adopcion.MascotaID == 0) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.AdopcionesAprobadas.InsertOnSubmit(adopcion);
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var a = db.AdopcionesAprobadas.First(aa => aa.AdopcionID == id);
                db.AdopcionesAprobadas.DeleteOnSubmit(a);
                db.SubmitChanges();
            }
        }

        public List<AdopcionesAprobadas> ListarPorUsuario(int usuarioID)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.AdopcionesAprobadas.Where(a => a.UsuarioID == usuarioID).ToList();
            }
        }
    }
}
