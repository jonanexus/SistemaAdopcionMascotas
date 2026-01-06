using Capa_Datos;
using System;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_SolicitudesAdopcion
    {
        private CD_SolicitudesAdopcion cd = new CD_SolicitudesAdopcion();
        private CN_AdopcionesAprobadas cnAdop = new CN_AdopcionesAprobadas();
        private CN_Mascotas cnMasc = new CN_Mascotas();
        private CN_Usuarios cnUs = new CN_Usuarios();

        public void Insertar(SolicitudesAdopcion solicitud)
        {
            cd.Insertar(solicitud);
        }

        public void Actualizar(SolicitudesAdopcion solicitud)
        {
            cd.Actualizar(solicitud);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<SolicitudesAdopcion> Listar()
        {
            return cd.Listar();
        }

        public SolicitudesAdopcion ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }

        public void Aprobar(int solicitudID)
        {
            var solicitud = ObtenerPorID(solicitudID);
            if (cnUs.PuedeAdoptar(solicitud.UsuarioID))
            {
                solicitud.Estado = "Approved";
                solicitud.FechaAprobacion = DateTime.Now;
                Actualizar(solicitud);
                var adopcion = new AdopcionesAprobadas { UsuarioID = solicitud.UsuarioID, MascotaID = solicitud.MascotaID, FechaAdopcion = DateTime.Now };
                cnAdop.Insertar(adopcion);
                var mascota = cnMasc.ObtenerPorID(solicitud.MascotaID);
                mascota.Estado = "Adopted";
                cnMasc.Actualizar(mascota);
            }
            else
            {
                solicitud.Estado = "Pending";
                Actualizar(solicitud);
            }
        }
    }
}