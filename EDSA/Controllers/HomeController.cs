using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EDSA.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult RegisterMeter()
        {
            return Redirect("~/reg-meter.aspx");
        }
        public ActionResult IndividualCustomer()
        {
            return Redirect("~/reg-individual-customer.aspx");
        }
        public ActionResult CorporateCustomer()
        {
            return Redirect("~/reg-corporate-customer.aspx");
        }
        public ActionResult RegisterVendor()
        {
            return Redirect("~/reg-vendor.aspx");
        }
    }
}
