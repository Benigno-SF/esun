using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class CertificadoCalidadBL
    {
        CertificadoCalidadDAO dao = new CertificadoCalidadDAO();
        public DataSet ListCertificados(CertificadoCalidadBE e)
        {
            return dao.ListCertificados(e);
        }
        public DataSet ListCertificadosxid(CertificadoCalidadBE e)
        {
            return dao.ListCertificadosxid(e);
        }

        public DataSet ListDetalleCertificados(CertificadoCalidadBE e)
        {
            return dao.ListDetalleCertificados(e);
        }

        public DataSet BuscarNombrePorDni(CertificadoCalidadBE e)
        {
            return dao.buscarNombrePorDni(e);
        }

        public DataSet List_Informacion_input(CertificadoCalidadBE e)
        {
            return dao.List_Informacion_input(e);
        }

        public DataSet List_ProductosCalidad(CertificadoCalidadBE e)
        {
            return dao.List_ProductosCalidad(e);
        }

        public DataSet List_dvariablescalidad(CertificadoCalidadBE e)
        {
            return dao.List_dvariablescalidad(e);
        }

        public DataSet List_variablescalidad(CertificadoCalidadBE e)
        {
            return dao.List_variablescalidad(e);
        }

        public DataSet List_pkcertificado(CertificadoCalidadBE e)
        {
            return dao.List_pkcertificado(e);
        }
        

        public DataSet RegiCertificadoCalidad(CertificadoCalidadBE e)
        {
            return dao.RegiCertificadoCalidad(e);
        }

        public DataSet RegiCertificadoCalidad_2do(CertificadoCalidadBE e)
        {
            return dao.RegiCertificadoCalidad_2do(e);
        }

        public DataSet List_ParametroxUsuario(CertificadoCalidadBE e)
        {
            return dao.List_ParametroxUsuario(e);
        }

        public DataSet List_Usuario(CertificadoCalidadBE e)
        {
            return dao.List_Usuario(e);
        }

        public DataSet UpdateDetailsToDetails(CertificadoCalidadBE e)
        {
            return dao.ActualizarFecha(e);
        }


    }
}
