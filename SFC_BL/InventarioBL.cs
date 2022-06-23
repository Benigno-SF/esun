
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
    public class InventarioBL
    {
        InventarioDAO dao = new InventarioDAO();
        
        public DataSet ListResponsableNis(ConsNisiraBE e)
        {
            return dao.ListResponsableNis(e);
        }

        public DataSet ListProductosMovimientos(ConsNisiraBE e)
        {
            return dao.ListProductosMovimientos(e);
        }

        public DataSet ListInventariosNis(ConsNisiraBE e)
        {
            return dao.ListInventariosNis(e);
        }

        public DataSet ListAlmacenNis(ConsNisiraBE e)
        {
            return dao.ListAlmacenNis(e);
        }

        public DataSet ListSucursalNis(ConsNisiraBE e)
        {
            return dao.ListSucursalNis(e);
        }

        public DataSet ListEmpresaNis(ConsNisiraBE e)
        {
            return dao.ListEmpresaNis(e);
        }

        public DataSet List_Inventario_Update(ConsNisiraBE e)
        {
            return dao.List_Inventario_Update(e);
        }
        
    }
}