using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Agro
{
    public partial class Wfo_ReportePiscinaK : System.Web.UI.Page
    {
        public DateTime Finicio;
        public DateTime Ffin;
        public List<PiscinaBE> Piscinas;

        protected void Page_Load(object sender, EventArgs e)
        {
            Finicio = new DateTime();
            Ffin = new DateTime();

            Piscinas = new List<PiscinaBE>();
            PiscinaBL piscinaBL = new PiscinaBL();
            DataSet ds = piscinaBL.Listado();
            DataTable dt = ds.Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                PiscinaBE piscinaBE = new PiscinaBE();
                piscinaBE.cCodigo = (string)dr.ItemArray[1];
                piscinaBE.cDatosadicionales = (string)dr.ItemArray[3];
                piscinaBE.cUbicacion = (string)dr.ItemArray[2];
                piscinaBE.nCapacidad = (decimal)dr.ItemArray[4];
                piscinaBE.nIdPiscina = (int)dr.ItemArray[0];
                piscinaBE.nNivalmainf = (decimal)dr.ItemArray[9];
                piscinaBE.nNivalmasup = (decimal)dr.ItemArray[7];
                piscinaBE.nNivaltainf = (decimal)dr.ItemArray[8];
                piscinaBE.nNivaltasup = (decimal)dr.ItemArray[6];
                piscinaBE.nPeriodoSinc = (int)dr.ItemArray[5];
                Piscinas.Add(piscinaBE);
            }
        }
    }
}
