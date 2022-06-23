using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace SFC_DAO
{
    
    public class PrevisionesComprasDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet PrevisionesComprasLeerEntradasPorDia(PrevisionesComprasBE p)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PrevisionesComprasLeerEntradasPorDia", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idProveedor", p.idProveedor ));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idAlmacen", p.idAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechaInicial", p.fechaInicial));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechaFinal", p.fechaFinal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idTipoAplicacion", p.idTipoAplicacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idActividadNegocio", p.idActividadNegocio));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet PrevisionesComprasLeerEntradasPorDia_Guardar(PrevisionesComprasBE p)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PrevisionesComprasLeerEntradasPorDia", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idProveedor", p.idProveedor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idAlmacen", p.idAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechaInicial", p.fechaInicial));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechaFinal", p.fechaFinal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idTipoAplicacion", p.idTipoAplicacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idActividadNegocio", p.idActividadNegocio));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public void Eliminar(string v)
        {
            string sql = "";
            sql += "DELETE FROM [SFI-DAT\\PROD].[ERPHispatec].dbo.[PrevisionesCompras] WHERE Id=" + v + Environment.NewLine;
            cnx = con.conectar();
            cnx.Open();
            SqlCommand sqlCommand = new SqlCommand(sql, cnx);
            sqlCommand.ExecuteNonQuery();
            cnx.Close();
        }

        public void Guardar(PrevisionesComprasCabeceraBE cab, List<PrevisionesComprasDetalleBE> det)
        {
            string sql = string.Empty;
            if ((cab.Id == 0 || cab.Id == -1) && cab.Id_FamiliaArticulo != 0) //INSERTA
            {
                sql += "INSERT INTO [SFI-DAT\\PROD].[ERPHispatec].dbo.[PrevisionesCompras] ([Id_Centro],[Id_ActividadNegocio],[Id_Proveedor],[Id_Articulo],[Id_FamiliaArticulo],[Cambio],[IDDivisa],[Id_Almacen],[Id_Departamento])" + Environment.NewLine;
                sql += "VALUES(3 ,8 ," + cab.Id_Proveedor.ToString() + " ,null ," + cab.Id_FamiliaArticulo.ToString() + ",1,7," + cab.Id_Almacen.ToString() + ",null);" + Environment.NewLine;
                sql += "" + Environment.NewLine;
                sql += "DECLARE" + Environment.NewLine;
                sql += "@MPK INT = @@IDENTITY;" + Environment.NewLine;

                foreach (var item in det)
                {
                    string[] f_modif = item.fecha.ToString().Split('-');
                    string dd = f_modif[2] + "-" + f_modif[1] + "-" + f_modif[0] + " 00:00:00.000";

                    string unimedida = "", unidades;
                    if (item.Id_UnidadMedida.ToString().Trim() == "-1")
                    {
                        unimedida = "NULL";
                    }
                    else
                    {
                        unimedida = item.Id_UnidadMedida.ToString().Trim();
                    }

                    if (item.Unidades.ToString().Trim() == "")
                    {
                        unidades = "0";
                    }
                    else
                    {
                        unidades = item.Unidades.ToString().Trim();
                    }

                    sql += "";
                    sql += "INSERT INTO [SFI-DAT\\PROD].[ERPHispatec].dbo.[DatosPrevisionCompras] ([Id_PrevisionCompras], [Anyo], [Mes], [ImporteFunc], [ImporteTrans], [Unidades], [TipoPeriodo], [Fecha], [Semana], [Id_PeriodoGestion], [Id_Campanya], [Id_UnidadMedida], [EntradaFinalizada], [TipoCreacion], [Id_Personalizacion])" + Environment.NewLine;
                    sql += "VALUES (@MPK ,0 ,0 ,0 ,0 ," + unidades.ToString() + " ,1 ,'" + dd + "' ,0 ,null ,null ," + unimedida + " ,0 ,0 ,null);" + Environment.NewLine;
                }
            }

            if (cab.Id != 0) // ACTUALIZA
            {
                sql += "UPDATE [SFI-DAT\\PROD].[ERPHispatec].dbo.PrevisionesCompras SET Id_FamiliaArticulo=" + cab.Id_FamiliaArticulo.ToString() + ", Id_Almacen=" + cab.Id_Almacen.ToString() + "  WHERE Id=" + cab.Id.ToString() + ";" + Environment.NewLine;

                foreach (PrevisionesComprasDetalleBE item in det)
                {
                    //Si unidad de medida es -1, no hacer nada
                    if (item.Id_UnidadMedida != -1)
                    {
                        if (item.Id != 0 && item.Id != -1)
                        {
                            string[] f_modif = item.fecha.ToString().Split('-');
                            string dd = f_modif[2] + "-" + f_modif[1] + "-" + f_modif[0]+ " 00:00:00.000";
                            sql += "";

                            string unimedida = "";
                            if (item.Id_UnidadMedida.ToString().Trim() == "-1")
                            {
                                unimedida = "NULL";
                            }
                            else
                            {
                                unimedida = item.Id_UnidadMedida.ToString().Trim();
                            }

                            string unidades = "";
                            if (item.Unidades.ToString().Trim() == "")
                            {
                                unidades = "0";
                            }
                            else
                            {
                                unidades = item.Unidades.ToString().Trim();
                            }

                            sql += "UPDATE [SFI-DAT\\PROD].[ERPHispatec].dbo.DatosPrevisionCompras SET Unidades="+ unidades + ", Fecha='" + dd + "', Id_UnidadMedida=" + unimedida + " WHERE Id=" + item.Id + ";" + Environment.NewLine;
                        }
                        else
                        {
                            string unidades = "";
                            if (item.Unidades.ToString().Trim() == "")
                            {
                                unidades = "0";
                            }
                            else
                            {
                                unidades = item.Unidades.ToString().Trim();
                            }

                            string[] f_modif = item.fecha.ToString().Split('-');
                            string dd = f_modif[2] + "-" + f_modif[1] + "-" + f_modif[0] + " 00:00:00.000";
                            sql += "INSERT INTO [SFI-DAT\\PROD].[ERPHispatec].dbo.[DatosPrevisionCompras] ([Id_PrevisionCompras], [Anyo], [Mes], [ImporteFunc], [ImporteTrans], [Unidades], [TipoPeriodo], [Fecha], [Semana], [Id_PeriodoGestion], [Id_Campanya], [Id_UnidadMedida], [EntradaFinalizada], [TipoCreacion], [Id_Personalizacion])" + Environment.NewLine;
                            sql += "VALUES (" + cab.Id + " ,0 ,0 ,0 ,0 , " + unidades + " ,1 ,'" + dd + "' ,0 ,null ,null ," + item.Id_UnidadMedida + " ,0 ,0 ,null);" + Environment.NewLine;
                        }
                    }
                }
            }

            if (sql != string.Empty)
            {
                cnx = con.conectar();
                cnx.Open();
                SqlCommand sqlCommand = new SqlCommand(sql, cnx);
                sqlCommand.ExecuteNonQuery();
                cnx.Close();
            }
        }
    }
}
