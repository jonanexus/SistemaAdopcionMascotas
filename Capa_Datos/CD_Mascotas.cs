using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Mascotas
    {
        public void Insertar(Mascotas mascota)
        {
            if (string.IsNullOrEmpty(mascota.Nombre) || mascota.CategoriaID == 0 || mascota.RazaID == 0) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Mascotas.InsertOnSubmit(mascota);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Mascotas mascota)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var m = db.Mascotas.First(mm => mm.MascotaID == mascota.MascotaID);
                m.Nombre = mascota.Nombre;
                m.CategoriaID = mascota.CategoriaID;
                m.RazaID = mascota.RazaID;
                m.Descripcion = mascota.Descripcion;
                m.Caracteristicas = mascota.Caracteristicas;
                m.Estado = mascota.Estado;
                m.FechaAdopcion = mascota.FechaAdopcion;
                m.FechaEncontrado = mascota.FechaEncontrado;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var m = db.Mascotas.First(mm => mm.MascotaID == id);
                db.Mascotas.DeleteOnSubmit(m);
                db.SubmitChanges();
            }
        }

        public List<Mascotas> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Mascotas.ToList();
            }
        }

        public Mascotas ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Mascotas.FirstOrDefault(mm => mm.MascotaID == id);
            }
        }
    }
}