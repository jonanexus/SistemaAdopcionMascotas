using System;
using System.Data;
using System.Data.SqlClient;
using Capa_Datos.Entities;

namespace Capa_Datos.Repositories
{
    public class UsuarioRepository : IDisposable
    {
        private readonly SqlConnection _conexion;

        public UsuarioRepository(string connectionString)
        {
            _conexion = new SqlConnection(connectionString);
        }

        public void Insertar(Usuario usuario)
        {
            string query = @"INSERT INTO Usuarios (Email, Password, FotoPerfil, FechaRegistro, Activo) 
                            VALUES (@Email, @Password, @FotoPerfil, @FechaRegistro, @Activo)";

            using (SqlCommand comando = new SqlCommand(query, _conexion))
            {
                comando.Parameters.AddWithValue("@Email", usuario.Email);
                comando.Parameters.AddWithValue("@Password", usuario.Password);
                comando.Parameters.AddWithValue("@FotoPerfil",
                    string.IsNullOrEmpty(usuario.FotoPerfil) ? (object)DBNull.Value : usuario.FotoPerfil);
                comando.Parameters.AddWithValue("@FechaRegistro", usuario.FechaRegistro);
                comando.Parameters.AddWithValue("@Activo", usuario.Activo);

                if (_conexion.State != ConnectionState.Open)
                    _conexion.Open();

                comando.ExecuteNonQuery();
            }
        }

        public void Dispose()
        {
            if (_conexion != null)
            {
                if (_conexion.State == ConnectionState.Open)
                    _conexion.Close();

                _conexion.Dispose();
            }
        }
    }
}
