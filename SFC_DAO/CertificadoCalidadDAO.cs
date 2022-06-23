using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class CertificadoCalidadDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListCertificados(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_ListCertificados", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCert", e.vcCert));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCert2", e.vcCert2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCode", e.vcCode));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }



        public DataSet buscarNombrePorDni(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_NOMBREXDNI", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@NRODOCUMENTO", e.dni));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListCertificadosxid(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_ListCertificadoxid", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idcertificado", e.vidcertificado));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListDetalleCertificados(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_ListDetalleCertificados", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idcertificado", e.vidcertificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet List_Informacion_input(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_List_Informacion_input", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idusuario", e.vidusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@c_codigo", e.vc_codigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@codigoinput", e.vcodigoinput));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet List_ProductosCalidad(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_List_ProductosCalidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idvariable", e.vidvariable));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idunidadnegocio", e.vidunidadnegocio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vtipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet List_dvariablescalidad(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_dvariablescalidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idvariable", e.vidvariable));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet List_variablescalidad(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_variablescalidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idusuario", e.vidusuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet List_pkcertificado(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_pkcertificado", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiCertificadoCalidad(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_RegiCertificado", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add(new SqlParameter("@LCEMPRESA", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLDOC", e.vcXML_CAB));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLDDOC", e.vcXML_DET));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLDDDOC", e.vcXML_DDET));
            da.SelectCommand.Parameters.Add(new SqlParameter("@LCUSUARIO", e.vidusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IMEI", e.vimei));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RegiCertificadoCalidad_2do(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_RegiCertificado_2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add(new SqlParameter("@LCEMPRESA", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@LCID", e.vcidcertificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@LCUSUARIO", e.vidusuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet List_ParametroxUsuario(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_List_ParametroxUsuario", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idusuario", e.vidusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@c_codigo", e.vc_codigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@codigoinput", e.vcodigoinput));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet List_Usuario(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNC_ListUsuario_variable", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vidempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idusuario", e.vidusuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ActualizarFecha(CertificadoCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_ACTUALIZAR_FECHA_CALIDAD]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDCERTIFICADO", e.vidcertificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA", e.vcFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

    }
}
