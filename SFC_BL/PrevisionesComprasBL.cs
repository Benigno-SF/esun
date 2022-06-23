using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;

namespace SFC_BL
{
    public class PrevisionesComprasBL
    {
        PrevisionesComprasDAO dao = new PrevisionesComprasDAO();

        public DataSet PrevisionesComprasLeerEntradasPorDia(PrevisionesComprasBE o)
        {
            return dao.PrevisionesComprasLeerEntradasPorDia(o);
        }

        public DataSet PrevisionesComprasLeerEntradasPorDia_Guardar(PrevisionesComprasBE o)
        {
            return dao.PrevisionesComprasLeerEntradasPorDia_Guardar(o);
        }

        public void Guardar(PrevisionesComprasCabeceraBE cab, List<PrevisionesComprasDetalleBE> det)
        {
            dao.Guardar(cab, det);
        }

        public void Eliminar(string v)
        {
            dao.Eliminar(v);
        }
    }
}
