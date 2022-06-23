using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace SFC_WEB_APP
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/fa-all.css",
                "~/Content/font-awesome.css", 
                "~/Content/pace.css",
                "~/Content/perfect-scrollbar.css",
                "~/Content/bootstrap-datetimepicker.css",
                "~/Content/bootstrap.css",
                "~/Content/bootstrap-extended.css",
                "~/Content/colors.css",
                "~/Content/components.css",
                "~/Content/vertical-menu-modern.css",
                "~/Content/palette-gradient.css",
                "~/Content/toastr.css"
                ));
            bundles.Add(new StyleBundle("~//css").Include(

                
                
                ));

            bundles.Add(new StyleBundle("~/Content/JQWidgets/css")
               .Include("~/Content/JQWidgets/jqx.base.css", new CssRewriteUrlTransform()));
            /////////////////
            bundles.Add(new ScriptBundle("~/jquery").Include(
                "~/Scripts/jquery-3.3.1.js",
                "~/Scripts/moment.js"
                ));
            bundles.Add(new ScriptBundle("~/js").Include(
                
                "~/Scripts/bootstrap-datetimepicker.js",
                //
                "~/Scripts/toastr.js"
                ));


            bundles.Add(new ScriptBundle("~/jsbaaaa").Include(
                "~/Scripts/jquery-pers.js",
                "~/Scripts/jquery-3.3.1.js",
                "~/Scripts/umd/popper.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/perfect-scrollbar.js",
                "~/Scripts/hammer.js",
                "~/Scripts/unison.js",
                "~/Scripts/blockUI.js",
                "~/Scripts/jquery.matchHeight.js",
                "~/Scripts/jquery-sliding-menu.js",
                "~/Scripts/screenfull.js",
                "~/Scripts/pace.js",
                "~/Scripts/moment-with-locales.js",
                "~/Scripts/bootstrap-datetimepicker.js",
                "~/Scripts/toastr.js",
                "~/Scripts/app-menu.js",
                "~/Scripts/app.js"
                ));
            bundles.Add(new ScriptBundle("~/js/jqx").Include(
                "~/Scripts/JQWidgets/jqx-all.js"
                ));

            
            bundles.Add(new ScriptBundle("~/js/jqx").Include(
                "~/Scripts/JQWidgets/jqx-all.js"
                ));

            // Use la versión de desarrollo de Modernizr para desarrollar y aprender. Luego, cuando esté listo
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite

        }
    }
}