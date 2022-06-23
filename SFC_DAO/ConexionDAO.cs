using System.Data.SqlClient;
using System;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using SqlUtility;
using System.Configuration;

namespace SFC_DAO
{
    
    public class ConexionDAO
    {
        AccesoConfig acnf = new AccesoConfig();

        public SqlConnection conectar()
        {
            //string connect = Encryp("Data Source=172.16.16.14\\PROD; Initial catalog=SFTI; User id=eSun; Password=203$un20; Pooling=True;");
            return acnf.Conexion();
        }
        public string getKey(string vvkey) {
            return acnf.getKey(vvkey);
        }
        public string Encryp(string vvString)
        {
            return acnf.Encryp(vvString);
        }
        public string Decrypt(string vvString)
        {
            return acnf.Decrypt(vvString);
        }
    }
}
