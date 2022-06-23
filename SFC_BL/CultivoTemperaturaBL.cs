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
    public class CultivoTemperaturaBL
    {
        CultivoTemperaturaDAO dao = new CultivoTemperaturaDAO();
        public DataSet ListCultivoTemperatura(CultivoTemperaturaBE e)
        {
            return dao.ListCultivoTemperatura(e);
        }
    }
}
