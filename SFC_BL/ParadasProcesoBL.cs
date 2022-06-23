using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_BE;
using SFC_DAO;


namespace SFC_BL
{
    public class ParadasProcesoBL
    {
        ParadasProcesoDAO dao = new ParadasProcesoDAO();

        public DataSet ListParadasProceso(ParadasProcesoBE e)
        {
            return dao.ListParadasProceso(e);
        }

        public DataSet InicFinParadas(ParadasProcesoBE e)
        {
            return dao.InicFinParadas(e);
        }

        public DataSet ListParadasProcesoRep(ParadasProcesoBE e)
        {
            return dao.ListParadasProcesoRep(e);
        }

        public DataSet RegiParadasProceso(ParadasProcesoBE e)
        {
            return dao.RegiParadasProceso(e);
        }
        public DataSet UpdateParadasProceso(ParadasProcesoBE e)
        {
            return dao.UpdateParadasProceso(e);
        }
        public DataSet ParadasProcesoUpdate(ParadasProcesoBE e)
        {
            return dao.ParadasProcesoUpdate(e);
        }
        public DataSet ParadasProcesoDelete(ParadasProcesoBE e)
        {
            return dao.ParadasProcesoDelete(e);
        }
        
    }
}
