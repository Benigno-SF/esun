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
    public class ControlNroMuestraBL
    {
        ControlNroMuestraDAO dao = new ControlNroMuestraDAO();
        public DataSet ListParamDeta(ControlNroMuestraBE e)
        {
            return dao.ListParamDeta(e);
        }
        public DataSet ListMuestFoto(ControlNroMuestraBE e)
        {
            return dao.ListMuestFoto(e);
        }
        public int RegiMuestra(ControlNroMuestraBE e, List<ControlNroMuestraDetalleObsBE> lst)
        {
            return dao.RegiMuestra(e, lst);
        }
        public DataSet ListMuestra(ControlNroMuestraBE e)
        {
            return dao.ListMuestra(e);
        }
    }
}
