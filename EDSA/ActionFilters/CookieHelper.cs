using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EDSA.ActionFilters
{
    public static class CookieHelper
    {
        public static void CreateUserCookie(string username,string password)
        {
            HttpCookie cookie = new HttpCookie("userInfo");
            cookie.Values["username"] = username;
            cookie.Values["password"] = password;
            cookie.Expires.AddDays(7);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        public static CookieVM GetAllValues()
        {
            CookieVM cookieModel = new CookieVM();
            HttpCookie cookie = HttpContext.Current.Request.Cookies["userInfo"];
            if (cookie != null)
            {
                cookieModel.username = cookie["username"].ToString();
                cookieModel.password = cookie["password"].ToString();
            }
            return cookieModel;
        }
        public static void DeleteCookie()
        {            
            if (HttpContext.Current.Request.Cookies["userInfo"] != null)
            {
                var cookie = HttpContext.Current.Request.Cookies["userInfo"];
                cookie.Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
        }
    }
}