using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class RendimientoProcesoDetalleBL
    {
        RendimientoProcesoDetalleDAO dao = new RendimientoProcesoDetalleDAO();
        public RendimientoProcesoDetalleBE RegiRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            return dao.RegiRendimientoProcesoDetalle(e);
        }
        public DataSet ListRendimientoProcesoDetalle_update(RendimientoProcesoDetalleBE e)
        {
            return dao.ListRendimientoProcesoDetalle_update(e);
        }

        //RendimientoGuardar
        public DataSet ReadRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            return dao.ReadRendimientoProcesoDetalle(e);
        }

        
        public DataSet ListParadasProcesoRepo(RendimientoProcesoDetalleBE e)
        {
            return dao.ListParadasProcesoRepo(e);
        }


        public DataSet ListRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            return dao.ListRendimientoProcesoDetalle(e);
        }

        public DataSet ListVolcadoProceso(RendimientoProcesoDetalleBE e)
        {
            return dao.ListVolcadoProceso(e);
        }

        public DataSet ListRendimientoProcesoDetalle_ultimo(RendimientoProcesoDetalleBE e)
        {
            return dao.ListRendimientoProcesoDetalle_ultimo(e);
        }

        public DataSet RendimientoGuardar(string anio, string dni, string rend, int idproceso, int idprocesodetalle)
        {
            return dao.RendimientoGuardar(anio, dni, rend, idproceso, idprocesodetalle);
        }

        public DataSet ViewRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            return dao.ViewRendimientoProcesoDetalle(e);
        }

    }
}
