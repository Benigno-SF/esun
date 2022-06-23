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
    public class SxCobrarBL
    {
        SaldoxCobrarDAO objsxc = new SaldoxCobrarDAO();

        public DataSet MostrarAmbitoxDocumento_BL()
        {
            return objsxc.MostrarAmbitodedocumentos_DAO();
        }

        public DataSet MostrarVendedor_BL()
        {
            return objsxc.MostrarVendedor_DAO();
        }

        public DataSet MostrarCliente_BL()
        {
            return objsxc.MostrarClieProv_DAO();
        }

        public DataSet MostrarCampana_BL()
        {
            return objsxc.MostrarCampana_DAO();
        }

        public DataSet TablaPivot_BL(SaldoxCobrarBE s)
        {
            return objsxc.TablaPivot_DAO(s);
        }
    }
}
