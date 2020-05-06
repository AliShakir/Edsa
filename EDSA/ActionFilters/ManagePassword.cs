using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace EDSA.ActionFilters
{
    public static class ManagePassword
    {
        public static string EncryptedPassword(string password)
        {
            string pass = string.Empty;
            byte[] b = ASCIIEncoding.ASCII.GetBytes(password);
            pass = Convert.ToBase64String(b);
            return pass;
        }
        public static string DecryptPassword(string pass)
        {
            //string EncryptedPassword = cookie["password"].ToString();
            byte[] b = Convert.FromBase64String(pass);
            string decryptedPassword = ASCIIEncoding.ASCII.GetString(b);
            return decryptedPassword;
        }
    }
}