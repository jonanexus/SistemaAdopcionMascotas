using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Refugios
    {
        public void Insertar(Refugios refugio)
        {
            if (string.IsNullOrEmpty(refugio.Nombre) || string.IsNullOrEmpty(refugio.Direccion)) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Refugios.InsertOnSubmit(refugio);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Refugios refugio)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.Refugios.First(rr => rr.RefugioID == refugio.RefugioID);
                r.Nombre = refugio.Nombre;
                r.Direccion = refugio.Direccion;
                r.Telefono = refugio.Telefono;
                r.Email = refugio.Email;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var r = db.Refugios.First(rr => rr.RefugioID == id);
                db.Refugios.DeleteOnSubmit(r);
                db.SubmitChanges();
            }
        }

        public List<Refugios> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Refugios.ToList();
            }
        }

        public Refugios ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Refugios.FirstOrDefault(rr => rr.RefugioID == id);
            }
        }
    }
}