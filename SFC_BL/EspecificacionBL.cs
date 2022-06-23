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
    public class EspecificacionBL
    {
        EspecificacionDAO dao = new EspecificacionDAO();
        EspecificacionDetalleDAO daoDet = new EspecificacionDetalleDAO();

        public DataSet OneById(EspecificacionBE e)
        {
            return dao.OneById(e);
        }

        public DataSet CanalesEnPresentacion(string e)
        {
            return dao.CanalesEnPresentacion(e);
        }

        public DataSet Lista(EspecificacionBE e)
        {
            return dao.Lista(e);
        }

        public DataSet ListaJoin(EspecificacionBE e)
        {
            return dao.ListaJoin(e);
        }

        public void Eliminar(EspecificacionBE e)
        {
            dao.Eliminar(e);
        }

        public void Actualizar(EspecificacionBE e)
        {
            dao.Actualizar(e);
        }

        public void Insertar(EspecificacionBE e)
        {
            dao.Insertar(e);
        }

        public void Registrar(EspecificacionBE especificacionBE)
        {
            if (especificacionBE.Id != null && especificacionBE.Id != string.Empty)
            {
                dao.Actualizar(especificacionBE);
                foreach (EspecificacionDetalleBE item in especificacionBE.Imagenes)
                {
                    if (item.Id != null && item.Id != string.Empty)
                    {
                        EspecificacionDetalleBE a = new EspecificacionDetalleBL().EOneById(item);
                        if (a.Imagen.Trim() != string.Empty)
                        {
                            item.Imagen = a.Imagen;
                        }
                        daoDet.Actualizar(item);
                    }
                    else
                    {
                        item.IdEspecificacion = especificacionBE.Id;
                        item.Imagen = item.Imagen + ".jpg";
                        daoDet.Insertar(item);
                    }
                }
            }
            else
            {
                dao.Insertar(especificacionBE);
                foreach (EspecificacionDetalleBE item in especificacionBE.Imagenes)
                {
                    item.IdEspecificacion = especificacionBE.Id;
                    daoDet.Insertar(item);
                }
            }
        }
    }
}
