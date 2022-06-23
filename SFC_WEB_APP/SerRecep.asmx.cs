using SFC_BE;
using SFC_BL;
using SFC_WEB_APP.Mod_App;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Servicio para Recepción
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    public class SerRecep : System.Web.Services.WebService
    {
        RecepciontiempoBL recepciontiempoBL = new RecepciontiempoBL();
        RecepciontiempodetalleBL recepciontiempodetalleBL = new RecepciontiempodetalleBL();
        ClientesYProductoreBL clientesYProductoreBL = new ClientesYProductoreBL();
        RecepciontiempoconfiguracionBL recepciontiempoconfiguracionBL = new RecepciontiempoconfiguracionBL();

        [WebMethod]
        public void RecepciontiempodetalleInsert(RecepciontiempodetalleBE obj)
        {
            DataSet dsx = recepciontiempodetalleBL.Insert(obj);
        }

        [WebMethod]
        public List<object> RecepciontiempodetalleSelect(RecepciontiempodetalleBE e)
        {
            List<object> res = new List<object>();
            DataSet dsx = recepciontiempodetalleBL.Select(e);
            return res;
        }

        [WebMethod]
        public void RecepciontiempodetalleUpdate(RecepciontiempodetalleBE e)
        {
            DataSet dsx = recepciontiempodetalleBL.Update(e);
        }

        [WebMethod]
        public void RecepciontiempodetalleDelete(RecepciontiempodetalleBE obj)
        {
            DataSet dsx = recepciontiempodetalleBL.Delete(obj);
        }

        [WebMethod]
        public object RecepciontiempodetalleOneById(RecepciontiempodetalleBE e)
        {
            DataSet dsx = recepciontiempodetalleBL.OneById(e);
            return e;
        }

        [WebMethod]
        public object RecepciontiempodetalleListadoPorCabeceraId(RecepciontiempodetalleBE obj)
        {
            return Util.Serializar(recepciontiempodetalleBL.ListadoPorCabeceraId(obj).Tables[0]);
        }

        [WebMethod]
        public void RecepciontiempodetalleActualizarCampoHora(RecepciontiempodetalleBE obj)
        {
            recepciontiempodetalleBL.ActualizarCampoHora(obj);
        }

        [WebMethod]
        public void RecepciontiempoInsert(RecepciontiempoBE obj)
        {
            DataSet dsx = recepciontiempoBL.Insert(obj);
        }

        [WebMethod]
        public object RecepciontiempoInsertReturn(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.InsertReturn(obj).Tables[0]);
        }

        [WebMethod]
        public List<object> RecepciontiempoSelect(RecepciontiempoBE e)
        {
            List<object> res = new List<object>();
            DataSet dsx = recepciontiempoBL.Select(e);
            return res;
        }

        [WebMethod]
        public void RecepciontiempoUpdate(RecepciontiempoBE e)
        {
            DataSet dsx = recepciontiempoBL.Update(e);
        }

        [WebMethod]
        public void RecepciontiempoDelete(RecepciontiempoBE obj)
        {
            DataSet dsx = recepciontiempoBL.Delete(obj);
        }

        [WebMethod]
        public object RecepciontiempoOneById(RecepciontiempoBE e)
        {
            return Util.Serializar(recepciontiempoBL.OneById(e).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object SeleccionarPorFecha(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.SeleccionarPorFecha(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoReporte1(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.Reporte1(obj).Tables[0]);
        }

        /// <summary>
        /// Obtiene la lista de clientes y productores registrados en la tabla ClienteProd
        /// </summary>
        /// <param name="e">Nombre  del productor</param>
        /// <returns>lista de objetos</returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object ClientesYProductoresList(string obj)
        {
            return Util.Serializar(clientesYProductoreBL.List(obj).Tables[0]);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionSelect(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.Select(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionUpdate(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.Update(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RecepciontiempoconfiguracionActualizarminmax(RecepciontiempoconfiguracionBE obj)
        {
            recepciontiempoconfiguracionBL.Actualizarminmax(obj);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionOneById(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.OneById(obj).Tables[0]);
        }
    }
}
