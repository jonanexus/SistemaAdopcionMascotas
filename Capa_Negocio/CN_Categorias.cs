using Capa_Datos;
using System;
using System.Collections.Generic;


namespace Capa_Negocio
{
    public class CN_Categorias
    {
        private CD_Categorias cd = new CD_Categorias();

        public void Insertar(Categorias categoria)
        {
            if (categoria.Nombre.Length > 50) throw new Exception("Nombre demasiado largo");
            cd.Insertar(categoria);
        }

        public void Actualizar(Categorias categoria)
        {
            cd.Actualizar(categoria);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Categorias> Listar()
        {
            return cd.Listar();
        }

        public Categorias ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }
    }
}