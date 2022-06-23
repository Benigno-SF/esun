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
    public class RecepciontiempodetalleBL
    {
        private RecepciontiempodetalleDAO dao;

        public RecepciontiempodetalleBL()
        {
            dao = new RecepciontiempodetalleDAO();
        }

        public DataSet Insert(RecepciontiempodetalleBE e)
        {
            return dao.Insert(e);
        }

        public DataSet Select(RecepciontiempodetalleBE e)
        {
            return dao.Select(e);
        }

        public DataSet Update(RecepciontiempodetalleBE e)
        {
            return dao.Update(e);
        }

        public DataSet Delete(RecepciontiempodetalleBE e)
        {
            return dao.Delete(e);
        }

        public DataSet OneById(RecepciontiempodetalleBE e)
        {
            return dao.OneById(e);
        }

        public DataSet ListadoPorCabeceraId(RecepciontiempodetalleBE e)
        {
            return dao.ListadoPorCabeceraId(e);
        }

        public DataSet ActualizarCampoHora(RecepciontiempodetalleBE e)
        {
            return dao.ActualizarCampoUnico(e);
        }
    }
}
