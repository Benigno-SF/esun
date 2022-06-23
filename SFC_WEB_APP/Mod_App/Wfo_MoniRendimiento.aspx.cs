using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_App
{
    public partial class Wfo_MoniRendimiento : System.Web.UI.Page
    {
        MonitorBE EntMonitor = new MonitorBE();
        MonitorBL NegMonitor = new MonitorBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MonitorLoad();
            }
        }
        private void MonitorLoad()
        {
            EntMonitor.vnIdMonitor = 0;
            EntMonitor.vcIpMonitor = GetIPAddress();
            DataSet ds = NegMonitor.ListMonitor(EntMonitor);
            if (ds.Tables[0].Rows.Count == 1)
            {
                hdfIdMonitor.Value = ds.Tables["get"].Rows[0]["nIdMonitor"].ToString();
                dvTitle.InnerText = ds.Tables["get"].Rows[0]["cDescMonitor"].ToString();
            }
            else
            {
                hdfIdMonitor.Value = "-1";
                dvTitle.InnerText = "No se encontro el dispositivo";

            }
        }
        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            return context.Request.ServerVariables["REMOTE_HOST"];
        }
    }
}