using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class AreaGrupoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListAreaGrupoc(AreaGrupoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_AreaGrupoP_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoc", e.vnIdTiRow));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListAreaGrupo(AreaGrupoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_AreaGrupo_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nEstadoUso", e.vnEstadoUso));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListAreadeProceso_DAO_AG()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarAreadeProceso_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ListLinea_DAO_AG(int area)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_AreaGrupo_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", 1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", area));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nEstadoUso", ""));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ListCultivo_DAO_AG()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarCultivo_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ListVariedad_DAO_AG(int cultivo)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarVariedad_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", cultivo));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ListEmbalaje_DAO_AG(int cultivo)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarEmbalaje_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", cultivo));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ListSupervisor_DAO_AG()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarSupervisor_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet ListCliente_DAO_AG()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ListarCliente_GC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public int IniciarLectura_DAO_AG(LecturaAPPBE lectura)
        {
            int ideproceso, idprocesodetalle;
            try
            {
                SqlParameter InOutProceso = new SqlParameter("@nIdProceso", 0);
                InOutProceso.SqlDbType = SqlDbType.Int;
                InOutProceso.Direction = ParameterDirection.InputOutput;
                SqlParameter InOutProcesoDeta = new SqlParameter("@nIdProcesoDetalle", 0);
                InOutProcesoDeta.SqlDbType = SqlDbType.Int;
                InOutProcesoDeta.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();



                cmd = new SqlCommand("SPP_RendimientoProcesoDetalle_Regi2", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", lectura.idEmpresa));
                cmd.Parameters.Add(InOutProceso);
                cmd.Parameters.Add(InOutProcesoDeta);
                cmd.Parameters.Add(new SqlParameter("@nIdGrupo", lectura.idegrupo));
                cmd.Parameters.Add(new SqlParameter("@nIdSupervisor", lectura.idesupervisor));
                cmd.Parameters.Add(new SqlParameter("@nIdEmbalaje", lectura.idembalaje));
                cmd.Parameters.Add(new SqlParameter("@nIdCultivo", lectura.idcultivo));
                cmd.Parameters.Add(new SqlParameter("@nIdVariedad", lectura.idvariedad));
                cmd.Parameters.Add(new SqlParameter("@nIdClieProv", lectura.clieprov));


                cnx.Open();
                cmd.ExecuteNonQuery();

                ideproceso = Convert.ToInt32(cmd.Parameters["@nIdProceso"].Value);
                idprocesodetalle = Convert.ToInt32(cmd.Parameters["@nIdProcesoDetalle"].Value);
            }
            catch (Exception)
            {

                throw;
            }

            //cmd.Parameters.Add(new SqlParameter("@nIdProceso", SqlDbType.Int)).Direction = ParameterDirection.InputOutput;
            //cmd.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", SqlDbType.Int)).Direction = ParameterDirection.InputOutput;

            cnx.Close();
            return ideproceso;
        }


    }
}