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
    public class TipoDocumentoBL
    {
        TipoDocumentoDAO dao = new TipoDocumentoDAO();

        public DataSet ListTipoDocumento(TipoDocumentoBE e)
        {
            return dao.ListTipoDocumento(e);
        }

        public DataSet RegiTipoDocumento(TipoDocumentoBE e)
        {
            return dao.RegiTipoDocumento(e);
        }

    }
}
