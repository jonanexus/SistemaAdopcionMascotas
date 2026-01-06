using System;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.UI;
using Capa_Datos.Entities;
using Capa_Datos.Repositories;

namespace TuNamespace
{
    public partial class RegistroUsuario : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicialización si es necesario
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Validar contraseñas
                if (txtPassword.Text != txtConfirmarPassword.Text)
                {
                    PasswordMensaje.Text = "Las contraseñas no coinciden";
                    PasswordMensaje.Visible = true;
                    return;
                }

                // 2. Procesar imagen si existe
                string nombreArchivoImagen = null;
                if (fuFoto.HasFile)
                {
                    HttpPostedFile archivo = fuFoto.PostedFile;
                    nombreArchivoImagen = ProcesarImagen(archivo);
                }

                // 3. Obtener connection string del web.config
                string connectionString = ConfigurationManager.ConnectionStrings["TuCadenaConexion"].ConnectionString;

                // 4. Crear y configurar usuario
                Usuario nuevoUsuario = new Usuario
                {
                    Email = txtEmail.Text,
                    Password = txtPassword.Text, // Deberías encriptar esto
                    FotoPerfil = nombreArchivoImagen,
                    FechaRegistro = DateTime.Now
                };

                // 5. Guardar en base de datos
                using (UsuarioRepository repositorio = new UsuarioRepository(connectionString))
                {
                    repositorio.Insertar(nuevoUsuario);
                }

                PasswordMensaje.Text = "Usuario registrado exitosamente";
                PasswordMensaje.ForeColor = System.Drawing.Color.Green;
                PasswordMensaje.Visible = true;
            }
            catch (Exception ex)
            {
                PasswordMensaje.Text = "Error: " + ex.Message;
                PasswordMensaje.Visible = true;
            }
        }

        private string ProcesarImagen(HttpPostedFile archivo)
        {
            try
            {
                // Validar tipo de archivo
                string[] tiposPermitidos = { "image/jpeg", "image/png", "image/gif" };
                if (Array.IndexOf(tiposPermitidos, archivo.ContentType) == -1)
                {
                    throw new Exception("Formato de imagen no válido");
                }

                // Crear nombre único
                string nombreArchivo = Guid.NewGuid().ToString() + Path.GetExtension(archivo.FileName);
                string rutaCompleta = Path.Combine(Server.MapPath("~/Imagenes/Perfiles/"), nombreArchivo);

                // Crear directorio si no existe
                Directory.CreateDirectory(Path.GetDirectoryName(rutaCompleta));

                // Redimensionar y guardar imagen
                using (Image imagenOriginal = Image.FromStream(archivo.InputStream))
                {
                    // Redimensionar a 200x200
                    int nuevoAncho = 200;
                    int nuevoAlto = 200;

                    using (Bitmap imagenRedimensionada = new Bitmap(nuevoAncho, nuevoAlto))
                    {
                        using (Graphics graficos = Graphics.FromImage(imagenRedimensionada))
                        {
                            graficos.DrawImage(imagenOriginal, 0, 0, nuevoAncho, nuevoAlto);
                        }

                        // Guardar imagen
                        imagenRedimensionada.Save(rutaCompleta, ImageFormat.Jpeg);
                    }
                }

                return nombreArchivo;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al procesar la imagen: " + ex.Message);
            }
        }
    }
}
