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
    public class Reg_Sup_EvaluadorBL
    {
        // hacemos refencia a DAO
        Reg_Sup_EvaluadorDAO dao = new Reg_Sup_EvaluadorDAO();

        public DataSet BL_listar_tipo_cosecha(Reg_Sup_EvaluadorBE obj)
        {
            return dao.DAO_listar_tipo_cosecha(obj);
        }

        public DataSet BL_listar_fundo(Reg_Sup_EvaluadorBE obj)
        {
            return dao.DAO_listar_fundo(obj);
        }

        public DataSet BL_registrar(Reg_Sup_EvaluadorBE obj)
        {
            return dao.DAO_registrar(obj);
        }
    }
}
