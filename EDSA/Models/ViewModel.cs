using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.Models
{
    public class ViewModel
    {
        public EdsaIndividualUser edsaIndividualUser { get; set; }
        public EdsaLogin edsaLogin { get; set; }
        public EdsaMeterApplication edsaMeterApplication { get; set; }
        public EdsaRole edsaRoles { get; set; }
        public EdsaUser edsaUsers { get; set; }
        public EdsaUserRole edsaUserRoles { get; set; }
        public EdsaLightingAndPower edsaLightingAndPower { get; set; }
        public EdsaEquipment edsaEquipment { get; set; }
        public EdsaRecommendation edsaRecommendation { get; set; }

    }
}