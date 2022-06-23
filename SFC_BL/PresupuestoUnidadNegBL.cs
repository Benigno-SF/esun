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
    public class PresupuestoUnidadNegBL
    {
        PresupuestoUnidadNegDAO dao = new PresupuestoUnidadNegDAO();
        public DataSet RepoPresupCult(PresupuestoUnidadNegBE e)
        {
            return dao.RepoPresupCult(e);
        }
        public DataSet RepoPresupAll(PresupuestoUnidadNegBE e)
        {
            return dao.RepoPresupAll(e);
        }
        public DataSet RepoPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            return dao.RepoPresUnidNeg(e);
        }
        public DataSet ListPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            return dao.ListPresUnidNeg(e);
        }
        public int RegiPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            return dao.RegiPresUnidNeg(e);
        }
        public DataSet lista_confi_documentoBL(Verif_DocumentoBE e)
        {
            return dao.lista_confi_documentoDAO(e);
        }
    }
}
