using Capa_Datos;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_Donantes
    {
        private CD_Donantes cd = new CD_Donantes();

        public void Insertar(Donantes donante)
        {
            cd.Insertar(donante);
        }

        public void Actualizar(Donantes donante)
        {
            cd.Actualizar(donante);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Donantes> Listar()
        {
            return cd.Listar();
        }

        public Donantes ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }
    }
}