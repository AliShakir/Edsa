using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace EDSA.DbConnection
{
    public class DbConnection
    {
        /// <summary>
        /// 01-02-2020 02:30 AM
        /// This will get Db connection string.
        /// </summary>
        /// <returns></returns>
        public static string GetDbConnection()
        {
            // Connection string from App.config
            string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            return conString;
        }
    }
}