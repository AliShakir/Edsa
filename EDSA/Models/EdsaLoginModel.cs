using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.Models
{
    public class EdsaLoginModel
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string userType { get; set; }
        public int UserId { get; set; }
    }
}