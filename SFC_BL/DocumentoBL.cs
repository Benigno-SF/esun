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
    public class DocumentoBL
    {
        DocumentoDAO dao = new DocumentoDAO();
        public DataSet RegiDocumento(DocumentoBE e)
        {
            return dao.RegiDocumento(e);
        }

        public DataSet ListDocumento(DocumentoBE e)
        {
            return dao.ListDocumento(e);
        }

        public DataSet DeleteDocumento(DocumentoBE e)
        {
            return dao.DeleteDocumento(e);
        }
    }
}
