using System;
using System.Web;
using Capa_Datos;
using Capa_Datos.Entities;
using Capa_Datos.Repositories;
using Capa_Negocio.Helpers;
using Capa_Negocio.Models;

namespace Capa_Negocio.Services
{
    public class UsuarioService
    {
        private readonly UsuarioRepository _usuarioRepository;

        public UsuarioService()
        {
            _usuarioRepository = new UsuarioRepository();
        }

        public Usuario Authenticate(string username, string password)
        {
            var usuario = _usuarioRepository.GetByUsername(username);

            if (usuario == null)
                return null;

            // Verificar si está bloqueado por intentos fallidos
            if (usuario.IntentosFallidos >= 3)
                throw new Exception("Cuenta bloqueada por múltiples intentos fallidos.");

            // Verificar contraseña
            if (SecurityHelper.ValidatePassword(password, usuario.Contraseña))
            {
                _usuarioRepository.ResetFailedAttempts(username);
                usuario.FechaUltimoAcceso = DateTime.Now;
                _usuarioRepository.Update(usuario);
                return usuario;
            }
            else
            {
                _usuarioRepository.IncrementFailedAttempts(username);
                throw new Exception("Credenciales inválidas.");
            }
        }

        public Usuario GetUsuarioById(int id)
        {
            return _usuarioRepository.GetById(id);
        }

        public PerfilViewModel GetPerfilViewModel(int usuarioId)
        {
            var usuario = _usuarioRepository.GetById(usuarioId);
            if (usuario == null)
                return null;

            var perfilViewModel = new PerfilViewModel
            {
                UsuarioID = usuario.UsuarioID,
                NombreUsuario = usuario.NombreUsuario,
                Email = usuario.Email,
                Rol = usuario.Rol,
                NombreCompleto = usuario.NombreCompleto,
                Telefono = usuario.Telefono,
                Direccion = usuario.Direccion,
                Ciudad = usuario.Ciudad,
                Estado = usuario.Estado,
                CodigoPostal = usuario.CodigoPostal,
                FechaNacimiento = usuario.FechaNacimiento,
                AcercaDeMi = usuario.AcercaDeMi,
                TipoVivienda = usuario.TipoVivienda,
                TieneOtrasMascotas = usuario.TieneOtrasMascotas,
                DescripcionOtrasMascotas = usuario.DescripcionOtrasMascotas,
                TieneNinos = usuario.TieneNinos,
                ExperienciaMascotas = usuario.ExperienciaMascotas,
                HorasSolaMascota = usuario.HorasSolaMascota,
                FotoPerfil = usuario.FotoPerfil,
                FechaRegistro = usuario.FechaRegistro
            };

            // Obtener estadísticas
            perfilViewModel.TotalAdopciones = _usuarioRepository.GetTotalAdopciones(usuarioId);
            perfilViewModel.TotalSolicitudes = _usuarioRepository.GetTotalSolicitudes(usuarioId);
            perfilViewModel.TotalReportes = _usuarioRepository.GetTotalReportes(usuarioId);
            // TotalDonaciones necesitarías implementar según tu estructura

            return perfilViewModel;
        }

        public bool UpdatePerfil(PerfilViewModel perfil)
        {
            var usuario = _usuarioRepository.GetById(perfil.UsuarioID);
            if (usuario == null)
                return false;

            // Actualizar campos del usuario
            usuario.NombreCompleto = perfil.NombreCompleto;
            usuario.Telefono = perfil.Telefono;
            usuario.Direccion = perfil.Direccion;
            usuario.Ciudad = perfil.Ciudad;
            usuario.Estado = perfil.Estado;
            usuario.CodigoPostal = perfil.CodigoPostal;
            usuario.FechaNacimiento = perfil.FechaNacimiento;
            usuario.AcercaDeMi = perfil.AcercaDeMi;
            usuario.TipoVivienda = perfil.TipoVivienda;
            usuario.TieneOtrasMascotas = perfil.TieneOtrasMascotas;
            usuario.DescripcionOtrasMascotas = perfil.DescripcionOtrasMascotas;
            usuario.TieneNinos = perfil.TieneNinos;
            usuario.ExperienciaMascotas = perfil.ExperienciaMascotas;
            usuario.HorasSolaMascota = perfil.HorasSolaMascota;

            // Procesar foto de perfil si se proporciona
            if (perfil.FotoPerfilFile != null && perfil.FotoPerfilFile.ContentLength > 0)
            {
                var imageBytes = ImageHelper.ConvertImageToBytes(perfil.FotoPerfilFile);
                if (imageBytes != null)
                {
                    // Redimensionar imagen si es muy grande
                    imageBytes = ImageHelper.ResizeImage(imageBytes, 300, 300);
                    usuario.FotoPerfil = imageBytes;
                }
            }

            return _usuarioRepository.UpdateProfile(usuario);
        }

        public bool UpdatePassword(int usuarioId, string currentPassword, string newPassword)
        {
            var usuario = _usuarioRepository.GetById(usuarioId);
            if (usuario == null)
                return false;

            // Verificar contraseña actual
            if (!SecurityHelper.ValidatePassword(currentPassword, usuario.Contraseña))
                return false;

            // Cifrar nueva contraseña
            var encryptedPassword = SecurityHelper.EncryptPassword(newPassword);
            return _usuarioRepository.UpdatePassword(usuarioId, encryptedPassword);
        }

        public bool RequestPasswordReset(string email)
        {
            var usuario = _usuarioRepository.GetByEmail(email);
            if (usuario == null)
                return false;

            // Generar contraseña temporal
            var tempPassword = SecurityHelper.GenerateTemporaryPassword();
            var expiration = DateTime.Now.AddMinutes(30);

            return _usuarioRepository.SetTemporaryPassword(email, tempPassword, expiration);
        }
    }
}
