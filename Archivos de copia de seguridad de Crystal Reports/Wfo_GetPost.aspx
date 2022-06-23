<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_GetPost.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_GetPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    
    <script>
        //url parameters ?url=servicio
        $.ajax({
            dataType: "json",
            url: url,
            data: data,
            success: success
        });
    </script>
</body>
</html>
