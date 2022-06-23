using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class EspecificacionDetalleBL
    {
        EspecificacionDetalleDAO dao = new EspecificacionDetalleDAO();
        public DataSet Lista(EspecificacionDetalleBE e)
        {
            return dao.Lista(e);
        }

        public DataSet OneById(EspecificacionDetalleBE e)
        {
            return dao.OneById(e);
        }

        public EspecificacionDetalleBE EOneById(EspecificacionDetalleBE e) 
        {
            EspecificacionDetalleBE ed = new EspecificacionDetalleBE();
            DataSet ds_ed = new EspecificacionDetalleBL().OneById(e);

            foreach (DataRow ob in ds_ed.Tables[0].Rows)
            {
                ed.Id = ob["nIdEspecificacionDetalle"].ToString();
                ed.Descripcion = ob["descripcion"].ToString();
                ed.IdEspecificacion = ob["nIdEspecificacion"].ToString();
                ed.Titulo = ob["titulo"].ToString();
                ed.Imagen = ob["imagen"].ToString();
                break;
            }
            return ed;
        }

        public DataSet AllBy(EspecificacionBE e)
        {
            return dao.AllBy(e);
        }

        public void Eliminar(int e)
        {
            dao.Eliminar(e);
        }

        public void Actualizar(EspecificacionDetalleBE e)
        {
            //return dao.Lista(e);
        }

        public void Insertar(EspecificacionDetalleBE e)
        {
            //return dao.Lista(e);
        }
    }
}
