using Capa_Datos;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_Refugios
    {
        private CD_Refugios cd = new CD_Refugios();

        public void Insertar(Refugios refugio)
        {
            cd.Insertar(refugio);
        }

        public void Actualizar(Refugios refugio)
        {
            cd.Actualizar(refugio);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Refugios> Listar()
        {
            return cd.Listar();
        }

        public Refugios ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }
    }
}