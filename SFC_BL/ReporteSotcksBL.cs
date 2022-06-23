using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class ReporteSotcksBL
    {
        ReporteSotcksDAO dao = new ReporteSotcksDAO();
        
        public DataSet ListaAlmacenes(int e)
        {
            return dao.ListaAlmacenes(e);
        }

        public DataSet ReporteStockHipatec(ReporteSotcksBE e)
        {
            return dao.ReporteStockHipatec(e);
        }

        public DataSet ReferenciaNISIRAHISPATEC(ReporteSotcksBE e)
        {
            return dao.ReferenciaNISIRAHISPATEC(e);
        }

        public DataSet ReporteStockNisira(ReporteSotcksBE e)
        {
            return dao.ReporteStockNisira(e);
        }

        public List<ReporteSotcksComparativoBE> Lista(ReporteSotcksBE e)
        {

            DataSet ds1 = new DataSet(), ds2 = new DataSet();
            //ds1 = ListaRegistrosHispatec(e);
            int reg1 = ds1.Tables[0].Rows.Count;

            //ds2 = ListaRegistros(e);
            int reg2 = ds2.Tables[0].Rows.Count;

            //NISIRA
            string N_IDSUCURSAL = string.Empty;
            string N_IDALMACEN = string.Empty;
            string N_IDEMPRESA = string.Empty;
            string N_FECHA = string.Empty;

            //HISPATEC
            string H_IDALMACEN = string.Empty;
            string H_IDEMPRESA = string.Empty;
            string H_FECHA = string.Empty;

            //Cargar el listado combinado
            //Cargar el stock de hispatec
            //Cargar el stock de nisira

            //Para seleccionar los stocks N, pasar un codigo y seleccionar solo codigos de nisira y stocks
            //Para seleccionar los stocks H, pasar un codigo y seleccionar solo codigos de nisira y stocks

            //Cargar el listado combinado left join con nisira, elegir el stock del codigo mas inmediato, si no tiene

            //Este idempresa representa la base de datos en el sistema
            if (e.IdEmpresa == "1")
            {
                string[] ctemp_alamacen = e.IdAlmacen.Split('_');
                string[] ctemp_fecha = e.Fecha.Split('_'); //prefomateas
                N_IDSUCURSAL = ctemp_alamacen[0];
                N_IDALMACEN = ctemp_alamacen[1];
                N_IDEMPRESA = "001";
                N_FECHA = string.Empty;

                H_IDALMACEN = string.Empty;
                H_IDEMPRESA = string.Empty;
                H_FECHA = string.Empty;
            }
            else if (e.IdEmpresa == "2")
            {
                N_IDSUCURSAL = string.Empty;
                N_IDALMACEN = string.Empty;
                N_IDEMPRESA = string.Empty;
                N_FECHA = string.Empty;

                H_IDALMACEN = string.Empty;
                H_IDEMPRESA = "002";
                H_FECHA = string.Empty;
            }

            //pREFOMATTERAr co las tablas

            // 
            //e.TipoBD = 1;
            //var a = dao.ListaBD_ERPHispatec__Articulos(e);
            //e.TipoBD = 2;
            //var b = dao.ListaBD_SFTI__NIS_PRODUCTOS(e);

            //Filtrar los datos y devolver
            List<ReporteSotcksComparativoBE> rsc = new List<ReporteSotcksComparativoBE>();
            ReporteSotcksComparativoBE polirsc;
            for (int i = 0; i < 10050; i++)
            {
                polirsc = new ReporteSotcksComparativoBE();

                polirsc.Codigo1 = "CO1" + i.ToString();
                polirsc.Nombre1 = "NOM1" + i.ToString();
                polirsc.UnidadMedida1 = "UM1" + i.ToString();
                polirsc. Stock1 = "ST1" + i.ToString();

                polirsc.Codigo2 = "CO2" + i.ToString();
                polirsc.Nombre2 = "NOM2" + i.ToString();
                polirsc.UnidadMedida2 = "UM2" + i.ToString();
                polirsc.Stock2 = "ST2" + i.ToString();

                polirsc.Diferencia = "DIF" + i.ToString();
                rsc.Add(polirsc);
            }
            return rsc;
        }
    }
}
