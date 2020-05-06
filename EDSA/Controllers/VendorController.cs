using EDSA.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EDSA.Controllers
{
    public class VendorController : Controller
    {
        EdsaDBEntities db = new EdsaDBEntities();
        // GET: Vendor
        public ActionResult AdminDashboard()
        {
            return View();
        }
        public ActionResult SalesDashboard()
        {
            return View();
        }
        public ActionResult MyProfile()
        {
            return View();
        }
        [HttpPost]
        public JsonResult AddVendorRegistrationData(EdsaVendorRegistration model)
        {
            db.EdsaVendorRegistrations.Add(model);
            db.SaveChanges();
            return Json(new { success = true, responseText = "Data has been saved Successfully!" }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult MeterApplications()
        {
            List<EdsaIndividualUser> lstIndvUser = db.EdsaIndividualUsers.ToList();
            List<EdsaMeterApplication> lstMeterApplications = db.EdsaMeterApplications.ToList();
            List<EdsaRecommendation> lstRecommendations = db.EdsaRecommendations.ToList();
            var data = (from user in lstIndvUser
                        join meter in lstMeterApplications
                        on user.id equals meter.UserId
                        select new ViewModel
                        {
                            edsaIndividualUser = user,
                            edsaMeterApplication = meter,
                        }).ToList();
            return View(data);
        }
        public ActionResult ReviewApplication(int id)
        {
            List<EdsaIndividualUser> lstIndvUser = db.EdsaIndividualUsers.ToList();
            List<EdsaMeterApplication> lstMeterApplications = db.EdsaMeterApplications.ToList();
            List<EdsaLightingAndPower> lstLightingAndPower = db.EdsaLightingAndPowers.ToList();
            List<EdsaEquipment> lstEdsaEquipment = db.EdsaEquipments.ToList();
            var data = (from users in lstIndvUser
                        join meter in lstMeterApplications
                        on users.id equals meter.UserId
                        join equ in lstEdsaEquipment
                        on users.id equals equ.UserId
                        join lights in lstLightingAndPower
                        on users.id equals lights.UserId
                        where users.id == id
                        select new ViewModel
                        {
                            edsaIndividualUser = users,
                            edsaMeterApplication = meter,
                            edsaLightingAndPower = lights,
                            edsaEquipment = equ
                        }).ToList();
            return View(data);
        }
        public JsonResult UpdateApplicationStatus(EdsaRecommendation recommendations)
        {
            db.EdsaRecommendations.Add(recommendations);
            db.SaveChanges();
            return Json(new { success = true, responseText = "Data has been saved Successfully!" }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult FilterApplication(string filterVal)
        {
            List<EdsaIndividualUser> lstIndvUser = db.EdsaIndividualUsers.ToList();
            List<EdsaMeterApplication> lstMeterApplications = db.EdsaMeterApplications.ToList();
            List<EdsaRecommendation> lstRecommendations = db.EdsaRecommendations.ToList();
            var d = from user in lstIndvUser
                    join meter in lstMeterApplications
                    on user.id equals meter.UserId
                    join recom in lstRecommendations
                    on meter.Id equals recom.MeterApplicationId
                    where recom.ApplicationStatus == filterVal
                    select new ViewModel
                    {
                        edsaIndividualUser = user,
                        edsaMeterApplication = meter,
                        edsaRecommendation = recom
                    };
            var data = JsonConvert.SerializeObject(d, Formatting.Indented,
                           new JsonSerializerSettings
                           {
                               ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                           });
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}