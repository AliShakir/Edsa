using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EDSA.DAL;
using EDSA.Models;
using Newtonsoft.Json;

namespace EDSA.Controllers
{
    public class UserController : Controller
    {
        EdsaDBEntities db = new EdsaDBEntities();
        // GET: User
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public JsonResult AddIndividualUser(EdsaIndividualUserViewModel model)
        {
            // Populate Individual User Object.
            var ind = new EdsaIndividualUser()
            {
                FirstName = model.FirstName,
                MiddleName = model.MiddleName,
                LastName = model.LastName,
                Address = model.Address,
                TelNo = model.TelNo,
                IdentificationType = model.IdentificationType,
                IDNo = model.IDNo,
                TypeOfPremise = model.TypeOfPremise
            };
            db.EdsaIndividualUsers.Add(ind);
            db.SaveChanges();
            // To get last inserted user id
            int? UserId = db.EdsaIndividualUsers.Max(u => (int?)u.id);
            // Populate Login Object.
            var login = new EdsaLogin()
            {
                username = model.username,
                password = model.password,
                UserId = UserId
            };
            db.EdsaLogins.Add(login);
            db.SaveChanges();
            return Json(new { success = true, responseText = "Data has been saved Successfully!" }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult UpdateIndividualUser(EdsaIndividualUserViewModel model)
        {
            // Populate Individual User Object.
            var ind = new EdsaIndividualUser()
            {
                id = model.id,
                FirstName = model.FirstName,
                MiddleName = model.MiddleName,
                LastName = model.LastName,
                Address = model.Address,
                TelNo = model.TelNo,
                IdentificationType = model.IdentificationType,
                IDNo = model.IDNo,
                TypeOfPremise = model.TypeOfPremise
            };
            db.Entry(ind).State = EntityState.Modified;
            db.SaveChanges();
            // To get last inserted user id
            int? UserId = db.EdsaIndividualUsers.Max(u => (int?)u.id);
            // Populate Login Object.
            var login = new EdsaLogin()
            {
                id = model.LoginId,
                username = model.username,
                password = model.password,
                UserId = UserId
            };

            db.Entry(login).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new { success = true, responseText = "Profile has been updated Successfully!" }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult AddInternalUser()
        {
            ViewBag.UserRoles = new SelectList(db.EdsaRoles.ToList(), "Id", "Name");
            return View();
        }

        [HttpPost]
        public JsonResult AddInternalUser(EdsaInternalUserViewModel edsaUsers)
        {
            var checkEmail = db.EdsaUsers.Where(x => x.Email == edsaUsers.Email).FirstOrDefault();
            if (checkEmail==null)
            {
                var edUser = new EdsaUser()
                {
                    Username = edsaUsers.Username,
                    Password = edsaUsers.Password,
                    Email = edsaUsers.Email,
                    PhoneNumber = edsaUsers.PhoneNumber,
                    FullName = edsaUsers.FullName,
                    Photo = edsaUsers.Photo
                };
                db.EdsaUsers.Add(edUser);
                db.SaveChanges();
                // To get last inserted user id
                int? UserId = db.EdsaUsers.Max(u => (int?)u.Id);
                var userRole = new EdsaUserRole()
                {
                    RoleId = edsaUsers.RoleId,
                    UserId = UserId
                };
                db.EdsaUserRoles.Add(userRole);
                db.SaveChanges();
                string path = "~/ProfileImages/";
                string fileName = string.Empty;
                string fileExt = string.Empty;
                string fullName = string.Empty;
                HttpFileCollectionBase files = Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFileBase file = files[i];
                    fileName = Path.GetFileNameWithoutExtension(file.FileName);
                    fileExt = Path.GetExtension(file.FileName);
                    fullName = fileName + fileExt;
                    file.SaveAs(Server.MapPath(path + fullName));

                }
                return Json(new { success = true, responseText = "Data has been saved Successfully!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false, responseText = "User with this email address is already exists." }, JsonRequestBehavior.AllowGet);
            }
            
        }
        public ActionResult UserList()
        {
            ViewBag.UserRoles = new SelectList(db.EdsaRoles.ToList(), "Id", "Name");
           // var data = db.EdsaUsers.ToList();

            List<EdsaUser> lstEdsaUsers = db.EdsaUsers.ToList();
            List<EdsaUserRole> lstUserRoles = db.EdsaUserRoles.ToList();
            List<EdsaRole> lstEdsaRole = db.EdsaRoles.ToList();
            var data = from users in lstEdsaUsers
                    join userRoles in lstUserRoles on users.Id equals userRoles.UserId into table1
                    from userRoles in table1.DefaultIfEmpty()
                    join roles in lstEdsaRole on userRoles.RoleId equals roles.Id
                       select new ViewModel
                    {
                        edsaUsers = users,
                        edsaRoles = roles
                    };

            return View(data);
        }
        public JsonResult FilterUser(int searchVal)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<EdsaUser> lstEdsaUsers = db.EdsaUsers.ToList();
            List<EdsaUserRole> lstUserRoles = db.EdsaUserRoles.ToList();
            var d = from u in lstEdsaUsers
                    join r in lstUserRoles on u.Id equals r.UserId into table1
                    from r in table1.DefaultIfEmpty()
                    where r.RoleId == searchVal
                    select new ViewModel
                    {
                        edsaUsers = u,
                    };
            var data = JsonConvert.SerializeObject(d, Formatting.Indented,
                           new JsonSerializerSettings
                           {
                               ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                           });
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// Delete User
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult DeleteUser(int id)
        {
            var data = db.EdsaUsers.Where(x => x.Id == id).FirstOrDefault();
            if (data != null)
            {
                db.Entry(data).State = EntityState.Deleted;
                db.SaveChanges();
            }
            return Json(new { success = true, responseText = "User has been deleted successfully." }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult EditInternalUser(int id)
        {           
            List<EdsaUser> lstEdsaUsers = db.EdsaUsers.ToList();
            List<EdsaUserRole> lstUserRoles = db.EdsaUserRoles.ToList();
            var data = from u in lstEdsaUsers
                    join r in lstUserRoles on u.Id equals r.UserId into table1
                    from r in table1.DefaultIfEmpty()
                    where u.Id == id
                    select new ViewModel
                    {
                        edsaUsers = u,
                    };
            var rolse = db.EdsaRoles.ToList();
            ViewBag.UserRoles = new SelectList(rolse, "Id", "Name",5);
            return View(data);
        }
        [HttpPost]
        public JsonResult SendEmail(EmailModel model)
        {
            ManageEmail.SendEmail(model);
            return Json(new { success = true, responseText = "User has been deleted successfully." }, JsonRequestBehavior.AllowGet);
        }
    }
}