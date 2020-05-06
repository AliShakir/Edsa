using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.Models
{
    public class EdsaIndividualModel
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
    }
}