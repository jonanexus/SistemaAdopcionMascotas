using System;
using System.Collections.Generic;
using System.Linq;

namespace Capa_Datos
{
    public class CD_SolicitudesAdopcion
    {
        public void Insertar(SolicitudesAdopcion solicitud)
        {
            if (solicitud.UsuarioID == 0 || solicitud.MascotaID == 0) throw new Exception("Datos requeridos");
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.SolicitudesAdopcion.InsertOnSubmit(solicitud);
                db.SubmitChanges();
            }
        }

        public void Actualizar(SolicitudesAdopcion solicitud)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var s = db.SolicitudesAdopcion.First(ss => ss.SolicitudID == solicitud.SolicitudID);
                s.Estado = solicitud.Estado;
                s.FechaAprobacion = solicitud.FechaAprobacion;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var s = db.SolicitudesAdopcion.First(ss => ss.SolicitudID == id);
                db.SolicitudesAdopcion.DeleteOnSubmit(s);
                db.SubmitChanges();
            }
        }

        public List<SolicitudesAdopcion> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.SolicitudesAdopcion.ToList();
            }
        }

        public SolicitudesAdopcion ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.SolicitudesAdopcion.FirstOrDefault(ss => ss.SolicitudID == id);
            }
        }
    }
}