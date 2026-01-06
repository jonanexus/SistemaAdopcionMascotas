
using Capa_Datos;
using System;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_FotosReportesPerdidos
    {
        private CD_FotosReportesPerdidos cd = new CD_FotosReportesPerdidos();

        public void Insertar(FotosReportesPerdidos foto, int reporteID)
        {
            var list = ListarPorReporte(reporteID);
            if (list.Count >= 10) throw new Exception("Máximo 10 fotos");
            if (foto.Foto.Length > 5000000) throw new Exception("Foto demasiado pesada");
            cd.Insertar(foto);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<FotosReportesPerdidos> ListarPorReporte(int reporteID)
        {
            return cd.ListarPorReporte(reporteID);
        }
    }
}