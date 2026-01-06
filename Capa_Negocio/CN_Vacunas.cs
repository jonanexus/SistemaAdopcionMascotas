using Capa_Datos;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_Vacunas
    {
        private CD_Vacunas cd = new CD_Vacunas();

        public void Insertar(Vacunas vacuna)
        {
            cd.Insertar(vacuna);
        }

        public void Actualizar(Vacunas vacuna)
        {
            cd.Actualizar(vacuna);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Vacunas> ListarPorMascota(int mascotaID)
        {
            return cd.ListarPorMascota(mascotaID);
        }
    }
}