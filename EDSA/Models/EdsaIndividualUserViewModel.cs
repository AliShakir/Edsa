using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.Models
{
    public class EdsaIndividualUserViewModel
    {        
        public int id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string TelNo { get; set; }
        public string IdentificationType { get; set; }
        public string IDNo { get; set; }
        public string TypeOfPremise { get; set; }

        public int LoginId { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string userType { get; set; }
        public int UserId { get; set; }
    }
}