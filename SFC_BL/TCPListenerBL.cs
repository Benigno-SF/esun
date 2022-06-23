using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Net;
using System.Threading;

namespace SFC_BL
{
    public class TCPListenerBL
    {
        //public string GetPeso(string ab) {
        //    byte[] bytes = new byte[20];
        //    bytes = sendMessage(System.Text.Encoding.UTF8.GetBytes("KENTER"));
        //    string result = System.Text.Encoding.UTF8.GetString(bytes);
        //    return result;
        //}
        //private static byte[] sendMessage(byte[] messageBytes)
        //{
        //    const int bytesize = 20;
        //    try
        //    {
        //        System.Net.Sockets.TcpClient client = new System.Net.Sockets.TcpClient("192.168.21.81", 10001); // Create a new connection
        //        NetworkStream stream = client.GetStream();
        //        Thread.Sleep(1000);
        //        stream.Write(messageBytes, 0, messageBytes.Length); // Write the bytes
        //        //stream.Write("XG#1");
        //        messageBytes = new byte[bytesize];
        //        Thread.Sleep(1000);
        //        stream.Read(messageBytes, 0, messageBytes.Length);

        //        // Clean up
        //        stream.Dispose();
        //        client.Close();
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine(e.Message);
        //    }

        //    return messageBytes;
        //}
        //public void Listen()
        //{

        //    Int32 port = 1002;
        //    IPAddress ipAd = IPAddress.Parse("192.168.20.2");
        //    TcpListener myList = new TcpListener(ipAd, port);
        //    TcpClient client;
        //    try
        //    {
        //        myList.Start();
        //        while (true) // Add your exit flag here
        //        {
        //            client = myList.AcceptTcpClient();
        //            ThreadPool.QueueUserWorkItem(ThreadProc, client);
        //        }


        //        //utl.WriteToFile("Waiting for a connection.....");
        //        //Socket s = myList.AcceptSocket();
        //        //utl.WriteToFile("Connection accepted from " + s.RemoteEndPoint);
        //        //while (true)
        //        //{
        //        //    try
        //        //    {
        //        //        byte[] b = new byte[100];
        //        //        int k = s.Receive(b);
        //        //        string vvPeso = "";
        //        //        for (int i = Ini; i <= Fin; i++)
        //        //            vvPeso += Convert.ToChar(b[i]).ToString();
        //        //        utl.WriteToFile(Convert.ToString(port) + " - " + Convert.ToDecimal(vvPeso));
        //        //        if (vbAccept == true){
        //        //            vbAccept = false;
        //        //            //Guarda Base de Datos
        //        //            Thread tr = new Thread(fuPause);
        //        //            tr.Start();
        //        //        }
        //        //    }
        //        //    catch {
        //        //        utl.WriteToFile("Error Receiving data");
        //        //    }
        //        //}
        //    }
        //    catch (SocketException ex)
        //    {
        //        //utl.WriteToFile("SocketException: {0}" + ex.ToString());
        //    }
        //    finally
        //    {
        //        //Stop listening for new clients.
        //        //utl.WriteToFile("Error TCP Socket " + Convert.ToString(e.vnPort));
        //        myList.Stop();
        //    }
        //    //utl.WriteToFile("End Socket" + Convert.ToString(e.vnPort));
        //    //Console.Read();
        //}
        //private static void ThreadProc(object obj)
        //{   
        //    var client = (TcpClient)obj;
        //    // Do your work here
        //    NetworkStream clientStream = client.GetStream();
        //    ASCIIEncoding encoder = new ASCIIEncoding();
        //    while (true)
        //    {
        //        try
        //        {
        //            string bufferincmessage;
        //            byte[] b = new byte[100];
        //            int bytesRead;
        //            if (client.ReceiveBufferSize > 0)
        //            {
        //                bytesRead = clientStream.Read(b, 0, 100);
        //                bufferincmessage = encoder.GetString(b, 0, bytesRead);
        //            }
        //        }
        //        catch
        //        {
        //        }

        //    }
        //}




    }
}
