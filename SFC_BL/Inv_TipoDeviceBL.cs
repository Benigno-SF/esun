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
    public class Inv_TipoDeviceBL
    {
        Inv_TipoDeviceDAO dao = new Inv_TipoDeviceDAO();

        public DataSet List_Inv_TipoDevice(Inv_TipoDeviceBE e)
        {
            return dao.List_Inv_TipoDevice(e);
        }

        public DataSet Regi_Inv_TipoDevice(Inv_TipoDeviceBE e)
        {
            return dao.Regi_Inv_TipoDevice(e);
        }
    }
}
