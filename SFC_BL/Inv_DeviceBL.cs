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
    public class Inv_DeviceBL
    {
        Inv_DeviceDAO dao = new Inv_DeviceDAO();
        public DataSet ListDevice(Inv_DeviceBE e)
        {
            return dao.ListDevice(e);
        }

        public DataSet RegiDevice(Inv_DeviceBE e)
        {
            return dao.Regi_Device_Regi(e);
        }

    }
}
