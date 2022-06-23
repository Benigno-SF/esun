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
    public class RecepciontiempoBL
    {
        private RecepciontiempoDAO dao;

        public RecepciontiempoBL()
        {
            dao = new RecepciontiempoDAO();
        }

        public DataSet Insert(RecepciontiempoBE e)
        {
            return dao.Insert(e);
        }

        public DataSet Select(RecepciontiempoBE e)
        {
            return dao.Select(e);
        }

        public DataSet Update(RecepciontiempoBE e)
        {
            return dao.Update(e);
        }

        public DataSet Delete(RecepciontiempoBE e)
        {
            return dao.Delete(e);
        }

        public DataSet OneById(RecepciontiempoBE e)
        {
            return dao.OneById(e);
        }

        public DataSet InsertReturn(RecepciontiempoBE e)
        {
            return dao.InsertReturn(e);
        }

        public DataSet SeleccionarPorFecha(RecepciontiempoBE e)
        {
            return dao.SeleccionarPorFecha(e);
        }

        public DataSet Reporte1(RecepciontiempoBE e)
        {
            return dao.Reporte1(e);
        }
    }
}
