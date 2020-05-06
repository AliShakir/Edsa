using System.Web;
using System.Web.Optimization;

namespace EDSA
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            //// Use the development version of Modernizr to develop with and learn from. Then, when you're
            //// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            //bundles.Add(new StyleBundle("~/Content/css").Include(
            //         "~/Content/bootstrap.css",
            //         "~/Content/Site.css"));

            bundles.Add(new StyleBundle("~/edsa/bundles/css")
                .Include(
                "~/Content/kendo/2020.1.406/kendo.bootstrap-v4.min.css",
                "~/Content/bootstrap.min.css",
                "~/Content/Site.css",
                "~/Scripts/toastr/toastr.min.css"
                ));

            bundles.Add(new ScriptBundle("~/edsa/bundles/js")
                .Include(
                "~/Scripts/kendo/2020.1.406/jquery.min.js",
                "~/Scripts/kendo/2020.1.406/angular.min.js",
                "~/Scripts/kendo/2020.1.406/jszip.min.js",
                "~/Scripts/kendo/2020.1.406/kendo.all.min.js",
                "~/Scripts/bootstrap.min.js",
                "~/Scripts/toastr/toastr.min.js",
                "~/Scripts/Edsa.js"
                ));

            bundles.Add(new StyleBundle("~/admin/bundles/css")
                .Include(
                "~/Content/admin/css/main.css",
                "~/Scripts/toastr/toastr.min.css",
                "~/Content/HoldOn.min.css"
                ));

            bundles.Add(new ScriptBundle("~/admin/bundles/js")
                .Include(
                "~/Scripts/jquery-3.3.1.min.js",
                "~/Scripts/admin/main.min.js",
                "~/Scripts/toastr/toastr.min.js",
                "~/Scripts/Edsa.js",
                "~/Scripts/HoldOn.min.js"
                ));
        }
    }
}
