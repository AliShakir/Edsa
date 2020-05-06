using EDSA.ActionFilters;
using EDSA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EDSA.Controllers
{
    public class LoginController : Controller
    {
        EdsaDBEntities db = new EdsaDBEntities();
        #region Login For Normal Users
        // GET: Login
        public ActionResult Login()
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                ViewBag.Username = cookie["username"].ToString();
                string decryptedPass = ManagePassword.DecryptPassword(cookie["password"]);
                ViewBag.Password = decryptedPass;
            }
            Session.Clear();
            return View();
        }
        [HttpPost]
        public JsonResult Login(string username, string password, bool rememberMe)
        {
            var data = db.EdsaLogins.Where(x => x.username == username && x.password == password).FirstOrDefault();
            if (data != null)
            {
                if (rememberMe)
                {
                    string encryptedPass = ManagePassword.EncryptedPassword(password);
                    CookieHelper.CreateUserCookie(username, encryptedPass);
                }
                else
                {
                    CookieHelper.DeleteCookie();
                }
                // Primary Key
                Session["Id"] = data.id;
                Session["Username"] = data.username;
                Session["Password"] = data.password;
                // User Id
                Session["UserId"] = data.UserId;
                Session["userType"] = data.userType;
                return Json(new { success = true, responseText = "Login Success!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false, responseText = "Invalid Username or Password" }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Logout()
        {
            return Redirect("~/Home/Index");
        }
        #endregion

        #region Login For Internal Users.        
        public ActionResult InternalUserLogin()
        {
            HttpCookie cookie = Request.Cookies["userInfo"];
            if (cookie != null)
            {
                ViewBag.Username = cookie["username"].ToString();
                string decryptedPass = ManagePassword.DecryptPassword(cookie["password"]);
                ViewBag.Password = decryptedPass;
            }
            Session.Clear();
            return View();
        }
        [HttpPost]
        public JsonResult InternalUserLogin(string username, string password, string userType, bool rememberMe)
        {
            List<EdsaUser> lstEdsaUser = db.EdsaUsers.ToList();
            List<EdsaRole> lstRoles = db.EdsaRoles.ToList();
            List<EdsaUserRole> lstUserRoles = db.EdsaUserRoles.ToList();
            var data = (from u in lstEdsaUser
                        join ur in lstUserRoles
                        on u.Id equals ur.UserId
                        join r in lstRoles
                        on ur.RoleId equals r.Id
                        where u.Username == username && u.Password == password && r.Name == userType
                        select new ViewModel
                        {
                            edsaUsers = u,
                            edsaRoles = r,
                            edsaUserRoles = ur
                        }).ToList();
            if (data.Count != 0)
            {
                if (rememberMe)
                {
                    string encryptedPass = ManagePassword.EncryptedPassword(password);
                    CookieHelper.CreateUserCookie(username, encryptedPass);
                }
                else
                {
                    CookieHelper.DeleteCookie();
                }
                Session["Id"] = data.Select(x => x.edsaUsers.Id).FirstOrDefault();
                Session["Username"] = data.Select(x => x.edsaUsers.Username).FirstOrDefault();
                Session["Password"] = data.Select(x => x.edsaUsers.Password).FirstOrDefault();
                Session["userType"] = data.Select(x => x.edsaRoles.Name).FirstOrDefault();
                return Json(new { success = true, responseText = "Login Success!" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { success = false, responseText = "Invalid Username or Password" }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult InternalUserLogout()
        {
            Session.Clear();
            return Redirect("~/Login/InternalUserLogin");
        }
        #endregion
    }
}