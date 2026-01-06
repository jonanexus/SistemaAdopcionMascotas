using System;
using System.Linq;

namespace Capa_Datos.Entities
{
    public class Usuarios
    {
        public Capa_Datos.Usuarios ObtenerUsuario(string nombreUsuario)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.GetUsuarios().FirstOrDefault(u => u.NombreUsuario == nombreUsuario);
            }
        }

        // Corregido: eliminar parámetro DataClasses1DataContext y usar contexto local
        public void InsertarUsuario(Capa_Datos.Usuarios usuario)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                db.GetUsuarios().InsertOnSubmit(usuario);
                db.SubmitChanges();
                // LINQ-to-SQL asigna el identity a usuario.UsuarioID después de SubmitChanges
            }
        }

        public void ActualizarIntentos(int usuarioID, int intentos)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var user = db.GetUsuarios().First(u => u.UsuarioID == usuarioID);
                user.IntentosFallidos = intentos;
                db.SubmitChanges();
            }
        }

        public void SetClaveTemporal(int usuarioID, string claveTemp, DateTime expiracion)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var user = db.GetUsuarios().First(u => u.UsuarioID == usuarioID);
                user.ClaveTemporal = claveTemp;
                user.FechaExpiracionTemporal = expiracion;
                db.SubmitChanges();
            }
        }

        public void InsertarFotoPerfil(int usuarioID, byte[] foto)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var user = db.GetUsuarios().First(u => u.UsuarioID == usuarioID);
                user.FotoPerfil = foto;
                db.SubmitChanges();
            }
        }

        public Capa_Datos.Usuarios ObtenerPorEmail(string email)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.GetUsuarios().FirstOrDefault(u => u.Email == email);
            }
        }

        public void Actualizar(Capa_Datos.Usuarios usuario)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var u = db.GetUsuarios().First(us => us.UsuarioID == usuario.UsuarioID);
                u.NombreUsuario = usuario.NombreUsuario;
                u.Email = usuario.Email;
                u.Rol = usuario.Rol;
                db.SubmitChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                var u = db.GetUsuarios().First(us => us.UsuarioID == id);
                db.GetUsuarios().DeleteOnSubmit(u);
                db.SubmitChanges();
            }
        }
    }
}
