//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EDSA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class EdsaIndividualUser
    {
        public EdsaIndividualUser()
        {
            this.EdsaLogins = new HashSet<EdsaLogin>();
            this.EdsaEquipments = new HashSet<EdsaEquipment>();
            this.EdsaLightingAndPowers = new HashSet<EdsaLightingAndPower>();
        }
    
        public int id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string TelNo { get; set; }
        public string IdentificationType { get; set; }
        public string IDNo { get; set; }
        public string TypeOfPremise { get; set; }
    
        public virtual ICollection<EdsaLogin> EdsaLogins { get; set; }
        public virtual ICollection<EdsaEquipment> EdsaEquipments { get; set; }
        public virtual ICollection<EdsaLightingAndPower> EdsaLightingAndPowers { get; set; }
    }
}
