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
    public class AreaGrupoBL
    {
        AreaGrupoDAO dao = new AreaGrupoDAO();
        public DataSet ListAreaGrupoc(AreaGrupoBE e)
        {
            return dao.ListAreaGrupoc(e);
        }
        public DataSet ListAreaGrupo(AreaGrupoBE e)
        {
            return dao.ListAreaGrupo(e);
        }
        public DataSet ListAreadeProceso()
        {
            return dao.ListAreadeProceso_DAO_AG();
        }
        public DataSet ListarLineaAPP(int area)
        {
            return dao.ListLinea_DAO_AG(area);
        }

        public DataSet ListarCultivoAPP()
        {
            return dao.ListCultivo_DAO_AG();
        }

        public DataSet ListarVariedadAPP(int cultivo)
        {
            return dao.ListVariedad_DAO_AG(cultivo);
        }

        public DataSet ListarEmbalajeAPP(int cultivo)
        {
            return dao.ListEmbalaje_DAO_AG(cultivo);
        }

        public DataSet ListarSupervisorAPP()
        {
            return dao.ListSupervisor_DAO_AG();
        }
        public DataSet ListarClienteAPP()
        {
            return dao.ListCliente_DAO_AG();
        }
        public int IniciarLecturaAPP(LecturaAPPBE l)
        {
            return dao.IniciarLectura_DAO_AG(l);
        }
    }
}



