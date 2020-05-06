using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
namespace EDSA.ActionFilters
{
    public class CustomActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["username"] == null || HttpContext.Current.Session["password"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {{ "Controller", "Dashboard" },
                                      { "Action", "Login" } });
            }
            base.OnActionExecuting(filterContext);
        }
    }
}