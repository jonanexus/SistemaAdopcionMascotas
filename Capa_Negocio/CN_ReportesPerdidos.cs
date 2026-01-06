using Capa_Datos;
using System;
using System.Collections.Generic;

namespace Capa_Negocio
{
    public class CN_ReportesPerdidos
    {
        private CD_ReportesPerdidos cd = new CD_ReportesPerdidos();

        public void Insertar(ReportesPerdidos reporte)
        {
            cd.Insertar(reporte);
        }

        public void Actualizar(ReportesPerdidos reporte)
        {
            cd.Actualizar(reporte);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<ReportesPerdidos> Listar()
        {
            return cd.Listar();
        }

        public ReportesPerdidos ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }

        public void MarcarEncontrado(int reporteID, int finderID)
        {
            var reporte = ObtenerPorID(reporteID);
            reporte.FinderUsuarioID = finderID;
            reporte.Estado = "Found";
            reporte.FechaEncontrado = DateTime.Now;
            Actualizar(reporte);
        }
    }
}