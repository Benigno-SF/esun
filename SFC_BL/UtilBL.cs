using System.IO;
using System;
using System.Text;
using System.Security.Cryptography;
using SFC_DAO;

namespace SFC_BL
{
    public class UtilBL
    {


        ConexionDAO dao = new ConexionDAO();

        public string Encryp(string vvString) {
            return dao.Encryp(vvString);
        }
        public string Decrypt(string vvString)
        {
            return dao.Decrypt(vvString);
        }
        public void WriteToFile(string Message)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "\\Logs";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            string filepath = AppDomain.CurrentDomain.BaseDirectory + "\\Logs\\ServiceLog_" + DateTime.Now.Date.ToShortDateString().Replace('/', '_') + ".txt";
            if (!File.Exists(filepath))
            {
                // Create a file to write to. 
                using (StreamWriter sw = File.CreateText(filepath))
                {
                    sw.WriteLine(DateTime.Now + " - " + Message);
                }
            }
            else
            {
                using (StreamWriter sw = File.AppendText(filepath))
                {
                    sw.WriteLine(DateTime.Now + " - " + Message);
                }
            }
        }

        public string getkey(string vvkey) {
            return dao.getKey(vvkey);
        }

    }
}
