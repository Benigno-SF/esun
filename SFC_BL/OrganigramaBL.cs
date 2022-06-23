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
    public class OrganigramaBL
    {
        OrganigramaDAO dao = new OrganigramaDAO();
        public DataSet ListOrganigrama(OrganigramaBE e)
        {
            return dao.ListOrganigrama(e);
        }

        public DataSet RegiOrganigrama(OrganigramaBE e)
        {
              return dao.REgiOrganigrama(e);
        }

        public DataSet DeleteItem(OrganigramaBE e)
        {
            return dao.DeleteItem(e);
        }
    }
}

