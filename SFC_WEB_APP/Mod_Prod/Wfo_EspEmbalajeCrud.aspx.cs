using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_EspEmbalajeCrud : System.Web.UI.Page
    {
        public EspecificacionBE especificacion;

        protected void Page_Load(object sender, EventArgs e)
        {
            especificacion = new EspecificacionBE();
            especificacion.Id = Request["p"];
            DataSet ds_cab = new EspecificacionBL().OneById(especificacion);

            foreach (DataRow cab in ds_cab.Tables[0].Rows)
            {
                especificacion.Id = cab["nIdEspecificacion"].ToString();
                especificacion.Categoria = cab["categoria"].ToString();
                especificacion.Empaque = cab["empaque"].ToString();
                especificacion.Productor = cab["productor"].ToString();
                especificacion.Monitor = cab["monitor"].ToString();
                break;
            }

            DataSet ds_det = new EspecificacionDetalleBL().AllBy(especificacion);

            foreach (DataRow det in ds_det.Tables[0].Rows)
            {
                EspecificacionDetalleBE imagen = new EspecificacionDetalleBE();
                imagen.Id = det["nIdEspecificacionDetalle"].ToString();
                imagen.IdEspecificacion = especificacion.Id;
                imagen.Titulo = det["titulo"].ToString();
                imagen.Descripcion = det["descripcion"].ToString();
                imagen.Imagen = det["imagen"].ToString();
                especificacion.Imagenes.Add(imagen);
            }
        }
    }
}
