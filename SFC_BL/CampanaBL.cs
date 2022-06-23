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
    public class CampanaBL
    {
        CampanaDAO dao = new CampanaDAO();

        public DataSet ListCampana(CampanaBE e)
        {
            return dao.ListCampana(e);
        }

        public DataSet ListCampanaBefore(CmbCampanaBE e)
        {
            return dao.ListCampanaBefore(e);
        }

    }
}
