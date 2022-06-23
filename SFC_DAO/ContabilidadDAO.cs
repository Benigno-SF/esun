using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ContabilidadDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        //
        public DataSet InventarioRegi(ContabilidadBE e, DataTable dtx)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_InventarioNis_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdInventario", e.vcIdInventario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSerie", e.vcSerie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNumero", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcIdSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdResponsable", e.vcIdResponsable));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lst", dtx));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
