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
    
    public partial class EdsaLightingAndPower
    {
        public int Id { get; set; }
        public string LightPoints { get; set; }
        public Nullable<int> LightPointsQty { get; set; }
        public Nullable<int> LightPointsRating { get; set; }
        public string PowerSocketPoints { get; set; }
        public string PowerSocketPointsQty { get; set; }
        public string PowerSocketPointsRating { get; set; }
        public Nullable<int> UserId { get; set; }
    
        public virtual EdsaIndividualUser EdsaIndividualUser { get; set; }
    }
}
