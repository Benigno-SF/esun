using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ContabilidadBE : EmpresaBE
    {
      public string vcIdEmisor { get; set; }
      public string vcIdSucursal { get; set; }
      public string vcIdAlmacen { get; set; }
      public string vcIdResponsable { get; set; }

      public string vcIdInventario { get; set; }
      public string vcSerie { get; set; }
      public string vcNumero { get; set; }

      public string IDEMPRESA { get; set; }
      public string IDINVENTARIO { get; set; }
      public string ITEM { get; set; }
      public string CODIGOBARRA { get; set; }
      public string IDPRODUCTO	{ get; set; }
      public string IDSERIE { get; set; }
      public string DESCRIPCION { get; set; }
      public string IDESTADOPRODUCTO { get; set; }
      public string IDMEDIDA { get; set; }
      public string CANTIDAD { get; set; }
      public string CANTIDADSISTEMA { get; set; }
      public string CANTIDADDIFERENCIA { get; set; }
    }
}
