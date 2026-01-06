using Capa_Datos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;

namespace Capa_Negocio
{
    public class CN_Usuarios
    {
        private CD_Usuarios cd = new CD_Usuarios();
        private static readonly byte[] Key = Encoding.UTF8.GetBytes("Your16ByteKey123");
        private static readonly byte[] IV = Encoding.UTF8.GetBytes("Your16ByteIV1234");

        public Usuarios Login(string nombreUsuario, byte[] contraseñaCifrada)
        {
            var user = cd.ObtenerUsuario(nombreUsuario);
            if (user != null && user.Contraseña.ToArray().SequenceEqual(contraseñaCifrada))
            {
                cd.ActualizarIntentos(user.UsuarioID, 0);
                return user;
            }
            if (user != null)
            {
                int intentos = user.IntentosFallidos + 1;
                cd.ActualizarIntentos(user.UsuarioID, intentos);
                if (intentos >= 3)
                {
                    // Aquí puede añadirse lógica adicional (e.g., notificar admin)
                }
            }
            return null;
        }

        public Usuarios ObtenerPorNombre(string nombreUsuario)
        {
            return cd.ObtenerUsuario(nombreUsuario);
        }

        public byte[] CifrarAES(string plainText)
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Key;
                aes.IV = IV;
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter sw = new StreamWriter(cs))
                        {
                            sw.Write(plainText);
                        }
                        return ms.ToArray();
                    }
                }
            }
        }

        public string DescifrarAES(byte[] cipherText)
        {
            using (Aes aes = Aes.Create())
            {
                aes.Key = Key;
                aes.IV = IV;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);
                using (MemoryStream ms = new MemoryStream(cipherText))
                {
                    using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader sr = new StreamReader(cs))
                        {
                            return sr.ReadToEnd();
                        }
                    }
                }
            }
        }

        // Corregido: llamar a InsertarUsuario con la nueva firma
        public void RegistrarUsuario(Usuarios usuario, string plainPass)
        {
            usuario.Contraseña = CifrarAES(plainPass);
            cd.InsertarUsuario(usuario);
            // Tras SubmitChanges LINQ-to-SQL rellena usuario.UsuarioID, por tanto la subida de foto posterior funcionará
        }

        public void RecuperarContraseña(string email)
        {
            var user = cd.ObtenerPorEmail(email);
            if (user != null)
            {
                string claveTemp = Guid.NewGuid().ToString().Substring(0, 8);
                DateTime expiracion = DateTime.Now.AddMinutes(30);
                cd.SetClaveTemporal(user.UsuarioID, claveTemp, expiracion);

                // Enviar correo al usuario. REMPLACE "EMAIL_PASSWORD_HERE" por la contraseña de la cuenta remitente
                try
                {
                    var fromAddress = new MailAddress("jonanexus1924@gmail.com", "Sistema Adopción");
                    var toAddress = new MailAddress(user.Email);
                    string subject = "Recuperación de contraseña";
                    string body = $"Tu clave temporal es: {claveTemp} (expira en 30 minutos).";

                    using (var smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.EnableSsl = true;
                        smtp.Credentials = new NetworkCredential("jonanexus1924@gmail.com", "EMAIL_PASSWORD_HERE");
                        using (var message = new MailMessage(fromAddress, toAddress)
                        {
                            Subject = subject,
                            Body = body
                        })
                        {
                            smtp.Send(message);
                        }
                    }
                }
                catch
                {
                    // Registrar o manejar error de envío según política de la app
                }
            }
        }

        public Usuarios LoginTemporal(string nombreUsuario, string claveTemp)
        {
            var user = cd.ObtenerUsuario(nombreUsuario);
            if (user.ClaveTemporal == claveTemp && user.FechaExpiracionTemporal > DateTime.Now)
            {
                return user;
            }
            return null;
        }

        public bool PuedeAdoptar(int usuarioID)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                int count = db.AdopcionesAprobadas.Count(a => a.UsuarioID == usuarioID);
                return count < 3;
            }
        }

        public void Actualizar(Usuarios usuario)
        {
            cd.Actualizar(usuario);
        }

        public void Eliminar(int id)
        {
            cd.Eliminar(id);
        }

        public void InsertarFotoPerfil(int usuarioID, byte[] foto)
        {
            cd.InsertarFotoPerfil(usuarioID, foto);
        }

        public List<Usuarios> Listar()
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.GetUsuarios().ToList();
            }
        }

        public Usuarios ObtenerPorID(int id)
        {
            using (DataClasses1DataContext db = new DataClasses1DataContext())
            {
                return db.GetUsuarios().FirstOrDefault(u => u.UsuarioID == id);
            }
        }
    }
}
