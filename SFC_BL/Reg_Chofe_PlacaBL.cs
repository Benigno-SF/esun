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
    public class Reg_Chofe_PlacaBL
    {
        // hacemos refencia a DAO
        Reg_Chofe_PlacaDAO dao = new Reg_Chofe_PlacaDAO();

        public DataSet BL_listar_proveedores(Reg_Chofe_PlacaBE obj)
        {
            return dao.DAO_listar_proveedores(obj);
        }

        public DataSet BL_verificar_chofer(Reg_Chofe_PlacaBE obj)
        {
            return dao.DAO_verificar_chofer(obj);
        }

        public DataSet BL_registrar_chofer(Reg_Chofe_PlacaBE obj)
        {
            return dao.DAO_registrar_chofer(obj);
        }

        public DataSet BL_verificar_placa(Reg_Chofe_PlacaBE obj)
        {
            return dao.DAO_verificar_placa(obj);
        }
        public DataSet BL_registrar_placa(Reg_Chofe_PlacaBE obj)
        {
            return dao.DAO_registrar_placa(obj);
        }
    }
}
