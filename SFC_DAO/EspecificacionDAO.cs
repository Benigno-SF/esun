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
    public class EspecificacionDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet OneById(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 6));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet CanalesEnPresentacion(string canal)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 7));
            da.SelectCommand.Parameters.Add(new SqlParameter("@monitor", int.Parse(canal)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Lista(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListaJoin(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 5));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public void Actualizar(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 3));
            da.SelectCommand.Parameters.Add(new SqlParameter("@productor", e.Productor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@empaque", e.Empaque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@categoria", e.Categoria));
            da.SelectCommand.Parameters.Add(new SqlParameter("@monitor", e.Monitor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }

        public void Eliminar(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 4));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEspecificacion", int.Parse(e.Id)));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }

        public void Insertar(EspecificacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Especificaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Tipo", 1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@productor", e.Productor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@empaque", e.Empaque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@monitor", e.Monitor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@categoria", e.Categoria));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
        }
    }
}
