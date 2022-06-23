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
    public class ParteproduccionBL
    {
        ParteproduccionDAO dao = new ParteproduccionDAO();
        public DataSet Buscar(ControlfechasBE e)
        {
            return dao.Buscar(e);
        }
    }
}
