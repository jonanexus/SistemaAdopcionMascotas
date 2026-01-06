using System;
using System.IO;
using System.Web;
using System.Drawing; // Ya incluye Imaging si la referencia está agregada correctamente

namespace Capa_Negocio.Helpers
{
    public static class ImageHelper
    {
        public static byte[] ConvertImageToBytes(System.Web.HttpPostedFile file)
        {
            if (file == null || file.ContentLength == 0)
                return null;

            using (var memoryStream = new MemoryStream())
            {
                file.InputStream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }

        public static byte[] ResizeImage(byte[] imageBytes, int maxWidth, int maxHeight)
        {
            if (imageBytes == null || imageBytes.Length == 0)
                return null;

            try
            {
                using (var memoryStream = new MemoryStream(imageBytes))
                using (var image = Image.FromStream(memoryStream))
                {
                    var ratioX = (double)maxWidth / image.Width;
                    var ratioY = (double)maxHeight / image.Height;
                    var ratio = Math.Min(ratioX, ratioY);

                    var newWidth = (int)(image.Width * ratio);
                    var newHeight = (int)(image.Height * ratio);

                    using (var newImage = new System.Drawing.Bitmap(newWidth, newHeight))
                    using (var graphics = Graphics.FromImage(newImage))
                    {
                        graphics.DrawImage(image, 0, 0, newWidth, newHeight);

                        using (var resultStream = new MemoryStream())
                        {
                            newImage.Save(resultStream, ImageFormat.Jpeg);
                            return resultStream.ToArray();
                        }
                    }
                }
            }
            catch
            {
                return imageBytes;
            }
        }

        public static string ConvertToBase64(byte[] imageBytes)
        {
            if (imageBytes == null || imageBytes.Length == 0)
                return string.Empty;

            return Convert.ToBase64String(imageBytes);
        }
    }
}
