using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class PrintPRN
    {
        public void PrinQRTicket() {
            int vnCantidad = 3;
            


        }
        public void PrintTick(DataSet ds, string vcIp) {
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


                for (int i = 0; i < vnCantidad; i++)
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
                            vsPosCode = "50";
                            break;
                        case 2:
                            vsPosCode = "322";
                            break;
                        case 3:
                            vsPosCode = "593";
                            break;
                    }
                    ZPLString += "^BY1,3,89^FT" + vsPosCode + ",122^BCN,,Y,N" +
                        "^FD>:E>5201974127793" + Convert.ToString(i).PadLeft(6, '0') + "^FS";
                    ZPLString += "^FT" + vsPosString + ",20^A@N,11,11,TT0003M_^FH\\^CI17^F8^FD" + vvNombr + "^FS^CI0";
                    ZPLString += "^BY1,3,89^FT" + vsPosCode + ",122^BCN,,Y,N";
                    if ((vnPosLabel == 3) || (i == vnCantidad - 1))
                    {
                        ZPLString += "^PQ1,0,1,Y^XZ";
                        vnPosLabel = 0;
                    }
                    vnPosLabel += 1;
                }
                byte[] toSend = Encoding.ASCII.GetBytes(ZPLString);
                ns.Write(toSend, 0, toSend.Length);
            }
            catch (Exception ex){
                //MessageBox.Show(ex.Message);
            }
        }
    }
}
