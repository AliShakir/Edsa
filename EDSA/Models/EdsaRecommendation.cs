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
    
    public partial class EdsaRecommendation
    {
        public int Id { get; set; }
        public string MeterType { get; set; }
        public string comment { get; set; }
        public Nullable<int> MeterApplicationId { get; set; }
        public Nullable<int> AdminId { get; set; }
        public string ApplicationStatus { get; set; }
    
        public virtual EdsaMeterApplication EdsaMeterApplication { get; set; }
        public virtual EdsaUser EdsaUser { get; set; }
    }
}
