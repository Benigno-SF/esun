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
    public class GuiaBL
    {
        GuiaDAO dao = new GuiaDAO();

        public DataSet RegiGuiaRemision(GuiaBE e)
        {
            return dao.RegiGuiaRemision(e);
        }
        public DataSet PrintGuia(GuiaBE e)
        {
            return dao.PrintGuia(e);
        }

        public DataSet Guia_ActualizaPeso(GuiaBE e)
        {
            return dao.Guia_ActualizaPeso(e);
        }

        public DataSet ListGuiasParaTranferencia(GuiaBE e)
        {
            return dao.ListGuiasParaTranferencia(e);
        }
    }
}
