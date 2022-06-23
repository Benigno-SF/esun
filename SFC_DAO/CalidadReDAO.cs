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
    public class CalidadReDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;


        public DataSet ListAlmacenesCalidad(ReportCalid obj)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ALMACENESCALIDAD", cnx);
            da.SelectCommand.Parameters.Add(new SqlParameter("@formato", obj.vcFormato));
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet Rep_Certificado_Calidad(ReportCalid obj)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_CERTIFICADO_CALIDAD_ESUN", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDFORMATO", obj.vcFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDALMACEN", obj.vcIdAlmacen.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DESDE", obj.vcFechaIni.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HASTA", obj.vcFechaFin.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FIL_APPXCULTIVO", obj.vcAppxCultivo.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FIL_PORCENTAJES", obj.vcPorcentajes.Trim()));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet AppCalidadRecepcion()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_APPCALIDADRECEPCIONAG", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet ObtenerDataXFecha(String Fecha)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarProveedoresXFecha", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Fecha", Fecha));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet ObtenerLoteXProductor(string ruc,string fecha_)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarLoteXProveedor", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ruc", ruc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", fecha_));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet P_A_MostrarVariedadCAL()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarVariedadCAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet P_A_MostrarVariablesCAL()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarFormatoCalidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet P_A_MostrarReporteDAO(ReportCalid obj)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("IMPRESION_FORMATOS_CALIDAD_AG_2022_2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", obj.Fecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@productor", obj.Ruc.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lote", obj.Lote.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@variedad", obj.Variedad.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idvariable", obj.Formato.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idcultivo", obj.Producto.Trim()));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet P_A_MostrargUIAXProveedor(string ruc, string fecha_, string lote_)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrargUIAXProveedor", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ruc", ruc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", fecha_));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lote", lote_));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet P_A_MostrarReporteDAOPalta(ReportCalid obj)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("IMPRESION_FORMATOS_CALIDAD_V2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha_proceso", obj.vcFecha_proceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha_recepcion", obj.vcFecha_recepcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRuc", obj.vcRuc.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLote", obj.vcLote.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cVariedad", obj.vcVariedad.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFormato", obj.vcFormato.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCultivo", obj.vcCultivo.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cGuia", obj.vcGuia.Trim()));

            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public int SetearFotoAfterDrop_DAO(BorrarFotoBE objeto)
        {
            cnx = con.conectar();
            cnx.Open();
            string idreferencia = objeto.fecha + "" + objeto.Ruc + "" + objeto.Lote + "" + objeto.Variedad + "" + objeto.Formato + "" + objeto.Producto;

            cmd = new SqlCommand("P_A_UpdateImageAfterDelete", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDREFERENCIA", idreferencia));
            cmd.Parameters.Add(new SqlParameter("@IDRUTAFOTO", objeto.idfoto));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }

        public int P_A_InsertarImagenesDAO(string r1,string r2,string r3)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_InsertarImagenesUpdate", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Ruta1",r1));
            cmd.Parameters.Add(new SqlParameter("@Ruta2",r2));
            cmd.Parameters.Add(new SqlParameter("@Ruta3",r3));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }

        public DataSet InsertarObservacionesCalidadDAO(GBusquedaBE obj)
        {
            cnx = con.conectar();

            string idreferencia = obj.fechag+""+obj.proveedorg+""+obj.loteg+""+obj.variedadg+""+obj.formatog+""+obj.productog;
            
            da = new SqlDataAdapter("OBSERVACIONES_CALIDAD", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDREFERENCIA", idreferencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RUTA_FOTO_1", obj.rutafotouno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RUTA_FOTO_2", obj.rutafotodos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RUTA_FOTO_3", obj.rutafototres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@OBS_FOTO_1", obj.desfotouno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@OBS_FOTO_2", obj.desfotodos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@OBS_FOTO_3", obj.desfototres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DESCRIPCION_T_PULPA", obj.destpulpa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RECO_PESO_PROM", obj.pesoprompulpa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RESP_FOT1", obj.respfotouno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RESP_FOT2", obj.respfotodos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RESP_FOT3", obj.respfototres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@RESP_FOT4", obj.respfotocuatro));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public string CopiarData(string p,string name)
        {
            string resultado = "jeje";
            string fileName = name;
            string sourcePath = @""+p;
            string targetPath = @"C:\prueba";

            // Use Path class to manipulate file and directory paths.
            string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
            string destFile = System.IO.Path.Combine(targetPath, fileName);

            // To copy a folder's contents to a new location:
            // Create a new target folder.
            // If the directory already exists, this method does not create a new directory.
            System.IO.Directory.CreateDirectory(targetPath);

            // To copy a file to another location and
            // overwrite the destination file if it already exists.
            System.IO.File.Copy(sourceFile, destFile, true);
            
            // To copy all the files in one directory to another directory.
            // Get the files in the source folder. (To recursively iterate through
            // all subfolders under the current directory, see
            // "How to: Iterate Through a Directory Tree.")
            // Note: Check for target path was performed previously
            //       in this code example.
            
            /*if (System.IO.Directory.Exists(sourcePath))
            {
                string[] files = System.IO.Directory.GetFiles(sourcePath);

                // Copy the files and overwrite destination files if they already exist.
                foreach (string s in files)
                {
                    // Use static Path methods to extract only the file name from the path.
                    fileName = System.IO.Path.GetFileName(s);
                    destFile = System.IO.Path.Combine(targetPath, fileName);
                    System.IO.File.Copy(s, destFile, true);
                }
                resultado = "BIEN";
            }
            else
            {
                Console.WriteLine("Source path does not exist!");
            }*/

            // Keep console window open in debug mode.
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
            return resultado;
        }

        public DataSet P_A_MostrarVariedadDAO(string fecha, string productor, string lote)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarVariedadCAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", fecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@productor", productor.Trim()));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lote", lote.Trim()));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
    }
}
