using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.Models
{
    public class EdsaInternalUserViewModel
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string FullName { get; set; }
        public string Photo { get; set; }

        public int RoleId { get; set; }
        public string Name { get; set; }
    }
}