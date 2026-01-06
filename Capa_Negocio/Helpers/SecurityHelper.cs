using System;
using System.Security.Cryptography;
using System.Text;

namespace Capa_Negocio.Helpers
{
    public static class SecurityHelper
    {
        // Formato almacenado: iteraciones:saltBase64:hashBase64
        public static string EncryptPassword(string password)
        {
            if (password == null) throw new ArgumentNullException(nameof(password));

            const int saltSize = 16;
            const int hashSize = 32;
            const int iterations = 10000;

            using (var rng = new RNGCryptoServiceProvider())
            {
                var salt = new byte[saltSize];
                rng.GetBytes(salt);

                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations))
                {
                    var hash = pbkdf2.GetBytes(hashSize);
                    return $"{iterations}:{Convert.ToBase64String(salt)}:{Convert.ToBase64String(hash)}";
                }
            }
        }

        public static bool ValidatePassword(string password, string storedHash)
        {
            if (password == null) throw new ArgumentNullException(nameof(password));
            if (string.IsNullOrEmpty(storedHash)) return false;

            try
            {
                var parts = storedHash.Split(':');
                if (parts.Length != 3) return false;

                var iterations = int.Parse(parts[0]);
                var salt = Convert.FromBase64String(parts[1]);
                var hash = Convert.FromBase64String(parts[2]);

                using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations))
                {
                    var computedHash = pbkdf2.GetBytes(hash.Length);
                    return AreEqual(computedHash, hash);
                }
            }
            catch
            {
                return false;
            }
        }

        private static bool AreEqual(byte[] a, byte[] b)
        {
            if (a.Length != b.Length) return false;
            var diff = 0;
            for (var i = 0; i < a.Length; i++)
                diff |= a[i] ^ b[i];
            return diff == 0;
        }

        public static string GenerateTemporaryPassword(int length = 8)
        {
            const string chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";
            var sb = new StringBuilder();
            using (var rng = new RNGCryptoServiceProvider())
            {
                var data = new byte[4];
                while (sb.Length < length)
                {
                    rng.GetBytes(data);
                    var rnd = BitConverter.ToUInt32(data, 0);
                    var idx = rnd % (uint)chars.Length;
                    sb.Append(chars[(int)idx]);
                }
            }
            return sb.ToString();
        }
    }
}
