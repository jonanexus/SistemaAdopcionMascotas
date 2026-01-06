using Capa_Datos;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_AdopcionesAprobadas
    {
        private CD_AdopcionesAprobadas cd = new CD_AdopcionesAprobadas();

        public void Insertar(AdopcionesAprobadas adopcion)
        {
            cd.Insertar(adopcion);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<AdopcionesAprobadas> ListarPorUsuario(int usuarioID)
        {
            return cd.ListarPorUsuario(usuarioID);
        }
    }
}