using EDSA.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EDSA.Controllers
{
    public class DashboardController : Controller
    {
        EdsaDBEntities db = new EdsaDBEntities();
        // GET: Dashboard
        public ActionResult Index()
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            List<EdsaIndividualUser> lstEdsaIndividualUser = db.EdsaIndividualUsers.ToList();
            List<EdsaMeterApplication> lstEdsaMeterApplication = db.EdsaMeterApplications.ToList();
            var data = from u in lstEdsaIndividualUser
                        join l in lstEdsaMeterApplication on u.id equals l.UserId into table1
                       from l in table1.DefaultIfEmpty()
                       where u.id == UserId
                       select new ViewModel
                       {
                           edsaIndividualUser = u,
                           edsaMeterApplication = l
                       };
            return View(data);
        }
        public ActionResult Profile()
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            List<EdsaIndividualUser> lstEdsaIndividualUser = db.EdsaIndividualUsers.ToList();
            List<EdsaLogin> lstEdsaLogin = db.EdsaLogins.ToList();
            var data = from u in lstEdsaIndividualUser
                       join l in lstEdsaLogin on u.id equals l.UserId into table1
                       from l in table1.DefaultIfEmpty()
                       where u.id == UserId
                       select new ViewModel
                       {
                           edsaIndividualUser = u,
                           edsaLogin = l
                       };
            List<SelectListItem> TypeofPremise = new List<SelectListItem>() {
        new SelectListItem {
            Text = "", Value = "0"
        },
        new SelectListItem {
            Text = "Private Single", Value = "1"
        },
        new SelectListItem {
            Text = "Flat", Value = "2"
        },
        new SelectListItem {
            Text = "Other", Value = "3"
        }
        };
        List<SelectListItem> IdentificationType = new List<SelectListItem>() {
        new SelectListItem {
            Text = "", Value = "0"
        },
        new SelectListItem {
            Text = "Passport", Value = "1"
        },
        new SelectListItem {
            Text = "National Id", Value = "2"
        },
        new SelectListItem {
            Text = "Driver's License", Value = "3"
        },
        new SelectListItem {
            Text = "Voter's Id", Value = "4"
        },
        new SelectListItem {
            Text = "Other", Value = "5"
        }
        };
            ViewBag.TypeofPremise = TypeofPremise;
            ViewBag.IdentificationType = IdentificationType;
            return View(data);
        }

        public ActionResult ApplyForMeter()
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            List<EdsaIndividualUser> lstEdsaIndividualUser = db.EdsaIndividualUsers.ToList();
            List<EdsaLogin> lstEdsaLogin = db.EdsaLogins.ToList();
            var data = from u in lstEdsaIndividualUser
                       join l in lstEdsaLogin on u.id equals l.UserId into table1
                       from l in table1.DefaultIfEmpty()
                       where u.id == UserId
                       select new ViewModel
                       {
                           edsaIndividualUser = u,
                           edsaLogin = l
                       };
            List<SelectListItem> TypeofPremise = new List<SelectListItem>() {
        new SelectListItem {
            Text = "", Value = "0"
        },
        new SelectListItem {
            Text = "Private Single", Value = "1"
        },
        new SelectListItem {
            Text = "Flat", Value = "2"
        },
        new SelectListItem {
            Text = "Other", Value = "3"
        }
        };
            List<SelectListItem> IdentificationType = new List<SelectListItem>() {
        new SelectListItem {
            Text = "", Value = "0"
        },
        new SelectListItem {
            Text = "Passport", Value = "1"
        },
        new SelectListItem {
            Text = "National Id", Value = "2"
        },
        new SelectListItem {
            Text = "Driver's License", Value = "3"
        },
        new SelectListItem {
            Text = "Voter's Id", Value = "4"
        },
        new SelectListItem {
            Text = "Other", Value = "5"
        }
        };
            ViewBag.TypeofPremise = TypeofPremise;
            ViewBag.IdentificationType = IdentificationType;
            return View(data);
        }
        public JsonResult ConfirmApply(int UserId)
        {
            // Populate Individual User Object.
            var meterApplications = new EdsaMeterApplication()
            {
                UserId = UserId
            };
            db.EdsaMeterApplications.Add(meterApplications);
            db.SaveChanges();
            return Json(new { success = true, responseText = "Your have successfully applied for meter." }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteApplication(int id)
        {
            var data = db.EdsaMeterApplications.Where(x => x.UserId == id).FirstOrDefault();
            if (data != null)
            {
                db.Entry(data).State = EntityState.Deleted;
                db.SaveChanges();
            }            
            return Json(new { success = true, responseText = "Your application has been deleted successfully." }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NewApplications()
        {
            List<EdsaIndividualUser> lstEdsaIndividualUser = db.EdsaIndividualUsers.ToList();
            List<EdsaMeterApplication> lstEdsaMeterApplication = db.EdsaMeterApplications.ToList();
            var data = from u in lstEdsaIndividualUser
                       join l in lstEdsaMeterApplication on u.id equals l.UserId into table1
                       from l in table1.DefaultIfEmpty()
                       select new ViewModel
                       {
                           edsaIndividualUser = u,
                           edsaMeterApplication = l
                       };
            return View(data);
        }
    }
}