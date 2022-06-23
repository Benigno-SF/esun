using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class FrioErrorBL
    {
        FrioErrorDAO objerror = new FrioErrorDAO();
        public DataSet FrioErrorBLConsult()
        {
            return objerror.ConsultarError();
        }
        public DataSet FrioErrorBLPalet(string nropaleta)
        {
            return objerror.ConsultarErrorPaleta(nropaleta);
        }
        public int LastDelete(string ID, string paleta)
        {
            return objerror.LastIDEDelete(ID, paleta);
        }
        public int LastDeleteMov(string ID, string paleta)
        {
            return objerror.LastIDEDeleteMov(ID, paleta);
        }
        public int EliminarTodoRegistro(string ID, string paleta)
        {
            return objerror.TodoIDEDelete(ID, paleta);
        }
        public int EliminarNegBL(int ID, string paleta)
        {
            return objerror.TodoNegMov(ID, paleta);
        }
        public int EliminarmovpalBL(int ID, string paleta)
        {
            return objerror.TodoNegMovPal(ID, paleta);
        }
    }
}
