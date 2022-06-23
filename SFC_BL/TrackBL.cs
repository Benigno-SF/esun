using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class TrackBL
    {
        TrackDAO dao = new TrackDAO();

        public DataSet ListTrack(TrackBE e) {
            return dao.ListTrack(e);
        }

        public DataSet ListTrackView(TrackBE e)
        {
            return dao.ListTrackView(e);
        }

        public int RegiTrack(TrackBE e)
        {
            return dao.RegiTrack(e);
        }


    }
}
