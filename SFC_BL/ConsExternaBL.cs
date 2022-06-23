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
    public class ConsExternaBL
    {
        ConsExternaDAO dao = new ConsExternaDAO();

        public DataSet AgrupadorCC(ConsExternaBE e)
        {
            return dao.AgrupadorCC(e);
        }
        public DataSet ConsultaMarcasList(ConsExternaBE e)
        {
            return dao.ConsultaMarcasList(e);
        }
        public DataSet RepoBoleta(ConsExternaBE e) {
            return dao.RepoBoleta(e);
        }
        public DataSet ListProvClie(ConsExternaBE e)
        {
            return dao.ListProvClie(e);
        }
        public DataSet ListVariedad(ConsExternaBE e)
        {
            return dao.ListVariedad(e);
        }
        public DataSet ListCultivos(ConsExternaBE e)
        {
            return dao.ListCultivos(e);
        }
        public DataSet ListPuertos(ConsExternaBE e)
        {
            return dao.ListPuertos(e);
        }
        public DataSet ListStockPallet(ConsExternaBE e)
        {
            return dao.ListStockPallet(e);
        }

    }
}
