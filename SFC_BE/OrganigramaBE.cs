using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class OrganigramaBE : EmpresaBE
    {
        public int vnidOrganigrama { get; set; }
        public int vnIdNivel { get; set; }
        public int vnIdNivelMaster { get; set; }
        public int vnNivel { get; set; }
        public string vcImg { get; set; }
        public string vcDesOrgItem { get; set; }
        public string vcDesInfoItem { get; set; }
        public string vcNomOrg { get; set; }
        

    }
}
