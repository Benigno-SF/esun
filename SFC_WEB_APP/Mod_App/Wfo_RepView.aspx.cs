using System;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_App
{
    public partial class Wfo_RepView : System.Web.UI.Page
    {
        ReportDocument RepDocu = new ReportDocument();

        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();

        UtilBL negUtil = new UtilBL();

        int vnExp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadRepo();
        }
        private void LoadRepo()
        {
            string CdEmpr = Request.QueryString["Cd"];
            //DataTable dt = new DataTable();
            DataSet tbl = new DataSet();
            //Ruta de Carpeta Temp
            string ruta = Server.MapPath("~/temp");
            //obtengo el nombre del reporte y el xml
            string NoXml = Request.QueryString["wXml"] + ".xml";
            string NoRep = Request.QueryString["wCrt"] + ".rpt";

            EntConsHisp.vcCodigo = Request.QueryString["wXml"];
            EntConsHisp.vcTipoDato = Request.QueryString["wCrt"];
            DataSet dsx = NegConsHisp.RegiLogReportView(EntConsHisp);
            //Serializacion



            int Caprn = Convert.ToInt32(Request.QueryString["wCan"]);
            int EsExp = Convert.ToInt32(Request.QueryString["wExp"]);
            vnExp = EsExp;
            //
            string DiXml = ruta + "/" + NoXml;
            tbl.ReadXml(DiXml, XmlReadMode.ReadSchema);
            RepDocu.Load(Server.MapPath("~/Mod_Repo/reports/" + NoRep));
            RepDocu.SetDataSource(tbl);
            //System.IO.File.Delete(DiXml);
            CrtRepoView.ReportSource = RepDocu;
            CrtRepoView.RefreshReport();
            if (EsExp == 1)
            {

            }
            else if (EsExp == 2)
            {
                RepDocu.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "SF");
                RepDocu.Close();
                RepDocu.Dispose();
            }
            else if (EsExp == 3)
            {
                RepDocu.ExportToHttpResponse(ExportFormatType.Excel, Response, false, "SF");
                RepDocu.Close();
                RepDocu.Dispose();
            }

        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            if (vnExp != 1)
            {
                RepDocu.Close();
                RepDocu.Dispose();
                GC.Collect();
            }

        }
    }
}