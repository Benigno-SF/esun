using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class PlantaBL
    {
        PlantaDAO dao = new PlantaDAO();
        public DataSet ListPlanta(PlantaBE e)
        {
            return dao.ListPlanta(e);
        }

        public DataSet OneById(PlantaBE e)
        {
            return dao.OneById(e);
        }

        public DataSet Merge(PlantaBE e)
        {
            return dao.Merge(e);
        }

        public DataSet Insertar(PlantaBE e)
        {
            return dao.Insertar(e);
        }

        public DataSet Actualizar(PlantaBE e)
        {
            return dao.Actualizar(e);
        }
    }
}
