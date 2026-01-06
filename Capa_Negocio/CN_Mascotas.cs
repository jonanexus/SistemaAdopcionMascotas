using Capa_Datos;
using System.Collections.Generic;


namespace Capa_Negocio
{
    public class CN_Mascotas
    {
        private CD_Mascotas cd = new CD_Mascotas();

        public void Insertar(Mascotas mascota)
        {
            cd.Insertar(mascota);
        }

        public void Actualizar(Mascotas mascota)
        {
            cd.Actualizar(mascota);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public List<Mascotas> Listar()
        {
            return cd.Listar();
        }

        public Mascotas ObtenerPorID(int id)
        {
            return cd.ObtenerPorID(id);
        }
    }
}