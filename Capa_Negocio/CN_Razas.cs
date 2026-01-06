using Capa_Datos;
using System;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_Razas
    {
        private CD_Razas cd = new CD_Razas();

        public void Insertar(Razas raza)
        {
            if (raza.Nombre.Length > 50) throw new Exception("Nombre demasiado largo");
            cd.Insertar(raza);
        }

        public void Actualizar(Razas raza)
        {
            cd.Actualizar(raza);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Razas> Listar()
        {
            return cd.Listar();
        }

        public Razas ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }
    }
}