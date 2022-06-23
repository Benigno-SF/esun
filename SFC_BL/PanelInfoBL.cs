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
    public class PanelInfoBL
    {
        PanelInfoDAO dao = new PanelInfoDAO();
        public int UpdPanelInfo(PanelInfoBE e)
        {
            return dao.UpdPanelInfo(e);
        }
        public DataSet LisPanelInfo(PanelInfoBE e)
        {
            return dao.LisPanelInfo(e);
        }
        public int RegiPanelInfo(PanelInfoBE e)
        {
            return dao.RegiPanelInfo(e);
        }

    }
}
