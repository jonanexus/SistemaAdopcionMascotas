using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Razas
    {
        public void Insertar(Razas raza)
        {
            if (string.IsNullOrEmpty(raza.Nombre) || raza.CategoriaID == 0) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Razas.InsertOnSubmit(raza);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Razas raza)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.Razas.First(rr => rr.RazaID == raza.RazaID);
                r.Nombre = raza.Nombre;
                r.CategoriaID = raza.CategoriaID;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.Razas.First(rr => rr.RazaID == id);
                db.Razas.DeleteOnSubmit(r);
                db.SubmitChanges();
            }
        }

        public List<Razas> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Razas.ToList();
            }
        }

        public Razas ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Razas.FirstOrDefault(rr => rr.RazaID == id);
            }
        }
    }
}