using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_DAO
{
    public class EspecificacionDetalleDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet AllBy(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 5));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet OneById(EspecificacionDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 6));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacionDetalle", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Lista(EspecificacionDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacionDetalle", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public void Actualizar(EspecificacionDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 3));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacionDetalle", int.Parse(e.Id)));
            da.SelectCommand.Parameters.Add(new SqlParameter("@titulo", e.Titulo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@descripcion", e.Descripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@posicion", e.Posicion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@imagen", e.Imagen));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }

        public void Eliminar(int e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 4));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacionDetalle", e));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }

        public void Insertar(EspecificacionDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EspecificacionesDetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.IdEspecificacion)));
            da.SelectCommand.Parameters.Add(new SqlParameter("@titulo", e.Titulo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@descripcion", e.Descripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@posicion", e.Posicion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@imagen", e.Imagen));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }
    }
}
