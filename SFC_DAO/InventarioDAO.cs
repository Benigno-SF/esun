using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class InventarioDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;


        public DataSet List_Inventario_Update(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Inventario_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdInventario", e.vcIdInventario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSerie", e.vcSerie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNumero", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListResponsableNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ResponsableNis_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdResponsable", e.vcIdResponsable));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListProductosMovimientos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListaProductosMovimientos", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdInventario", e.vcIdInventario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcIdSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdGrupo", e.vcIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSubGrupo", e.vcIdSubGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListInventariosNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListInventarios", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcIdSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListEmpresaNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_EmpresaNis_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vcIdEmpresa));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListSucursalNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_SucursalNis_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcIdSucursal));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListAlmacenNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_AlmacenNis_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcIdSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
