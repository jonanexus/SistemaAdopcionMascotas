using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_Categorias
    {
        public void Insertar(Categorias categoria)
        {
            if (string.IsNullOrEmpty(categoria.Nombre)) throw new Exception("Nombre requerido");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.Categorias.InsertOnSubmit(categoria);
                db.SubmitChanges();
            }
        }

        public void Actualizar(Categorias categoria)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var cat = db.Categorias.First(c => c.CategoriaID == categoria.CategoriaID);
                cat.Nombre = categoria.Nombre;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var cat = db.Categorias.First(c => c.CategoriaID == id);
                db.Categorias.DeleteOnSubmit(cat);
                db.SubmitChanges();
            }
        }

        public List<Categorias> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Categorias.ToList();
            }
        }

        public Categorias ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.Categorias.FirstOrDefault(c => c.CategoriaID == id);
            }
        }
    }
}