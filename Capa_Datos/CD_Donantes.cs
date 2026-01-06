using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Donantes
    {
        public void Insertar(Donantes donante)
        {
            if (string.IsNullOrEmpty(donante.Nombre) || string.IsNullOrEmpty(donante.Email)) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Donantes.InsertOnSubmit(donante);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Donantes donante)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var d = db.Donantes.First(dd => dd.DonanteID == donante.DonanteID);
                d.Nombre = donante.Nombre;
                d.Email = donante.Email;
                d.Telefono = donante.Telefono;
                d.Mensaje = donante.Mensaje;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var d = db.Donantes.First(dd => dd.DonanteID == id);
                db.Donantes.DeleteOnSubmit(d);
                db.SubmitChanges();
            }
        }

        public List<Donantes> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Donantes.ToList();
            }
        }

        public Donantes ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Donantes.FirstOrDefault(dd => dd.DonanteID == id);
            }
        }
    }
}