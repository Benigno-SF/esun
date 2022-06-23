using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BL;

namespace SFC_WEB_APP
{
    public partial class beta : System.Web.UI.Page
    {
        //string IPAddress = GetIPAddress();
        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblIpAddres.Text = Get_real_IP();
        }

        protected void btnEncrip_Click(object sender, EventArgs e)
        {
            txtEncryp.Text = Encryp(txtDecryp.Text);

        }

        protected void btnDecrip_Click(object sender, EventArgs e)
        {
            txtDecryp.Text = Decrypt(txtEncryp.Text);

        }
        public string Get_real_IP()
        {
            string strHostName = System.Net.Dns.GetHostName();
            string clientIPAddress = System.Net.Dns.GetHostAddresses
            (strHostName).GetValue(2).ToString();
            return clientIPAddress;
        }


        public string Encryp(string vvString)
        {
            string key = txtLock.Text;
            byte[] clearBytes = Encoding.Unicode.GetBytes(vvString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(key, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    vvString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return vvString;
        }

        public string Decrypt(string vsString)
        {
            if (string.IsNullOrEmpty(vsString))
                return "0";
            string key = txtLock.Text;
            byte[] cipherBytes = Convert.FromBase64String(vsString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(key, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    vsString = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return vsString;
        }
    }
}