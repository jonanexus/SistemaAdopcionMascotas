using Capa_Datos;
using System;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_FotosMascotas
    {
        private CD_FotosMascotas cd = new CD_FotosMascotas();

        public void Insertar(FotosMascotas foto, int mascotaID)
        {
            var list = ListarPorMascota(mascotaID);
            if (list.Count >= 10) throw new Exception("Máximo 10 fotos");
            if (foto.Foto.Length > 5000000) throw new Exception("Foto demasiado pesada");
            cd.Insertar(foto);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<FotosMascotas> ListarPorMascota(int mascotaID)
        {
            return cd.ListarPorMascota(mascotaID);
        }
    }
}