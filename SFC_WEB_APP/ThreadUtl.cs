using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web;


namespace SFC_WEB_APP
{
    public class ThreadUtl
    {
        public void PrintDoc(DataSet ds, string di)
        {
            ReportDocument crt = new ReportDocument();
            crt.Load(di);
            crt.SetDataSource(ds);

            
            System.Drawing.Printing.PrinterSettings printerSettings = new System.Drawing.Printing.PrinterSettings();
            printerSettings.PrinterName = "Imp-Comedor";
            crt.PrintToPrinter(printerSettings, new System.Drawing.Printing.PageSettings(), false);
            crt.Close();
            crt.Dispose();
            GC.Collect();
        }
        public void PrintTickPRN(DataTable dt, string vcIp)
        {
            //Impresiora Zebra Archivo PRN
            int vnCantidad = 3;
            string vvNombr = "";
            try
            {
                IPAddress IP = IPAddress.Parse(vcIp);
                EndPoint ep = new IPEndPoint(IP, 9100);
                Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                sock.Connect(ep);
                NetworkStream ns = new NetworkStream(sock);
                int vnPosLabel = 1;
                string vsPosCode = "";
                string vsPosString = "";
                //String vsHeader = "CT~~CD,~CC^~CT~"
                //  + "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ";
                //String vsSpace = "^XA"
                //                + "^MMT"
                //                + "^PW799"
                //                + "^LL0160"
                //                + "^LS0";
                ///////////////
                String ZPLString = "CT~~CD,~CC^~CT~"
                    + "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ";
                int i = 1;
                foreach (DataRow row in dt.Rows) {
                    if (vnPosLabel == 1)
                    {
                        ZPLString += "^XA"
                                + "^MMT"
                                + "^PW799"
                                + "^LL0160"
                                + "^LS0";
                    }
                    switch (vnPosLabel)
                    {
                        case 1:
                            vsPosCode = "44";
                            vsPosString = "6";
                            break;
                        case 2:
                            vsPosCode = "322";
                            vsPosString = "278";
                            break;
                        case 3:
                            vsPosCode = "593";
                            vsPosString = "549";
                            break;
                    }
                    ZPLString += "^BY1,3,89^FT"+ vsPosCode + ",122^BCN,,Y,N " +
                        "^FD>:" + row["Codigo"].ToString() + "^FS";
                    ZPLString += "^FT" + vsPosString + ",20^A@N,11,11,TT0003M_^FB245,1,0,C^FH\\^CI17^F8^FD" + row["Personal"].ToString() + "^FS^CI0" ;
                        //"^BY1,3,89^FT316,122^BCN,,Y,N";
                    if ((vnPosLabel == 3) || (i == dt.Rows.Count))
                    {
                        ZPLString += "^PQ1,0,1,Y^XZ";
                        vnPosLabel = 0;
                    }
                    vnPosLabel += 1;
                    i += 1;
                }
                   
                
                byte[] toSend = Encoding.ASCII.GetBytes(ZPLString);
                ns.Write(toSend, 0, toSend.Length);
                sock.Close();

            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }
        public void PrintTickPRNQR(DataTable dt, string vcIp)
        {
            //Impresiora Zebra Archivo PRN
            int vnCantidad = 3;
            string vvNombr = "";
            try
            {
                IPAddress IP = IPAddress.Parse(vcIp);
                EndPoint ep = new IPEndPoint(IP, 9100);
                Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                sock.Connect(ep);
                NetworkStream ns = new NetworkStream(sock);
                int vnPosLabel = 1;
                string vsPosCode = "";
                string vsPosString = "";
                string vsPosCode3 = "";
                string vsPosString4 = "";
                //String vsHeader = "CT~~CD,~CC^~CT~"
                //CT~~CD,~CC^~CT~
                //  + "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR6,6~SD15^JUS^LRN^CI0^XZ";
                //String vsSpace = "^XA"
                //                + "^MMT"
                //                + "^PW799"
                //                + "^LL0160"
                //                + "^LS0";
                ///////////////
                String ZPLString = "CT~~CD,~CC^~CT~"
                    + "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR5,5~SD15^JUS^LRN^CI0^XZ";
                int i = 1;
                foreach (DataRow row in dt.Rows)
                {
                    if (vnPosLabel == 1)
                    {
                        ZPLString += "^XA"
                                + "^MMT"
                                + "^PW799"
                                + "^LL0160"
                                + "^LS0";
                    }
                    switch (vnPosLabel)
                    {
                        case 1:
                            vsPosCode = "597";
                            vsPosString = "776";
                            vsPosCode3 = "773";
                            vsPosString4 = "749";
                            break;
                        case 2:
                            vsPosCode = "333";
                            vsPosString = "512";
                            vsPosCode3 = "509";
                            vsPosString4 = "485";
                            break;
                        case 3:
                            vsPosCode = "70";
                            vsPosString = "249";
                            vsPosCode3 = "246";
                            vsPosString4 = "222";
                            break;
                    }

                    ZPLString += "^FT" + vsPosCode + ",146^BQN,2,5";
                    ZPLString += "^FH\\^FDLA," + row["Codigo"].ToString() + "^FS";
                    ZPLString += "^FT" + vsPosString + ",57 ^A0I,70,74^FH\\^FD" + row["Codigo"].ToString().Substring(0, 1) + "^FS";
                    ZPLString += "^FT" + vsPosCode3 + ",138^A0I,14,14^FH\\^FD" + row["Personal"].ToString() + "^FS";
                    ZPLString += "^FT" + vsPosString4 + ",8^A0I,14,14^FH\\^FD" + row["Codigo"].ToString() + "^FS";

                    //"^BY1,3,89^FT316,122^BCN,,Y,N";
                    if ((vnPosLabel == 3) || (i == dt.Rows.Count))
                    {
                        ZPLString += "^PQ1,0,1,Y^XZ";
                        vnPosLabel = 0;
                    }
                    vnPosLabel += 1;
                    i += 1;
                }


                byte[] toSend = Encoding.ASCII.GetBytes(ZPLString);
                ns.Write(toSend, 0, toSend.Length);
                sock.Close();

            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }
    }
}