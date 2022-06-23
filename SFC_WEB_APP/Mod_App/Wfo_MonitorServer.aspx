<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MonitorServer.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MonitorServer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lineas</title>
    <!--  css     -->
  <%: Styles.Render("~/Content/css") %>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="../Content/app_sources/font-awesome.min.css" />
    <!-- js -->
    <%: Scripts.Render("~/jquery") %>
    <script type="text/javascript" src="../Scripts/dt/dataTables.min.js"></script>
    <style>
        .body {
            background-color: #0e0c07;
            height: 100vh
        }
    </style>

    <style>
        body {
            color: lawngreen;
            background-color: #212529 !important;
        }

        .divt {
            padding: 0px;
            background-color: coral;
            color: white;
            padding: 3px;
        }

        .divc {
            border-left: solid;
            border-right: solid;
            border-color: coral;
            height: 80vh;
            padding: 0px;
        }

        .right {
            float: right;
        }

        .dataTables tbody tr {
    min-height: 35px; /* or whatever height you need to make them all consistent */
}
    </style>
</head>
<body>
    <form id="frm" runat="server">
        <div>
            <div class="row">

                <table class="table m-0 p-0">
                    <tr>
                        <td style="width: 25%">
                            <img src="../Img/sf-logo.png" style="width: 160px; left: 0;" />
                        </td>
                        <td style="width: 75%">
&nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="dvDetalle">
            <div class="row" >
                <table class="table text-white m-0 p-0" style="height: 70vh !important">
                    <tr style="height: 50%">
                        <td border: 0px;">
                            <div class="card  bg-dark">
                                <div class="card-header card-header-warning  m-0">
                                    <h3 class="card-title text-white" style="font-weight: bold;">SFI-DAT (HISPATEC - SFTI)</h3>
                                </div>
                                <div class="card-body table-responsive">
                                    <table id="db1" style="text-align: center; margin-bottom: 0px; width: 100%; font-size: 1.5rem" class="table m-0 p-0">
                                        <thead class="text-warning m-0 p-0">
                                            <tr>
                                                <th><b>SPID</b></th>
                                                <th><b>Status</b></th>
                                                <th><b>Login</b></th>
                                                <th><b>HostName</b></th>
                                                <th><b>BlkBy</b></th>
                                                <th><b>DBName</b></th>
                                                <th><b>Command</b></th>
                                                <th><b>CPUTime</b></th>
                                                <th><b>DiskIO</b></th>
                                                <th><b>LastBatch</b></th>
                                                <th><b>ProgramName</b></th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-white m-0 p-0">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                        </tr>
                    <tr style="height: 50%">
                        <td style="border: 0px;">
                            <div class="card  bg-dark">
                                <div class="card-header card-header-warning  m-0">
                                    <h3 class="card-title text-white" style="font-weight: bold;">SFI-DOC (NISIRA - NISIRACISP)</h3>
                                </div>
                                <div class="card-body table-responsive">
                                    <table id="db2" style="text-align: center; margin-bottom: 0px; width: 100%; font-size: 1.5rem" class="table m-0 p-0">
                                        <thead class="text-warning m-0 p-0">
                                            <tr>
                                                <th><b>SPID</b></th>
                                                <th><b>Status</b></th>
                                                <th><b>Login</b></th>
                                                <th><b>HostName</b></th>
                                                <th><b>BlkBy</b></th>
                                                <th><b>DBName</b></th>
                                                <th><b>Command</b></th>
                                                <th><b>CPUTime</b></th>
                                                <th><b>DiskIO</b></th>
                                                <th><b>LastBatch</b></th>
                                                <th><b>ProgramName</b></th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-white m-0 p-0">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:HiddenField ID="hdfIdMonitor" Value="1" runat="server" />
        <asp:HiddenField ID="hdfIdGrupo" Value="1" runat="server" />
    </form>
    <script>


        function LoadData() {
            var obj = new Object();
            obj.vnId = '1';
                $.ajax({
                    type: 'POST',
                    url: "SerApp.asmx/LstServer",
                    data: JSON.stringify({ obj: obj }),
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var lst = JSON.parse(data.d);
                      //  alert(JSON.stringify(data.d))
                        $('#db1').DataTable({
                            paging: false,
                            destroy: true,
                            searching: false,
                            info: false,
                            ordering: false,
                            scrollY: "30vh",
                            scrollX: true,
                            scrollCollapse: true,
                            data: lst,
                            columns: [							
                                { data: 'SPID'},
                                { data: 'Status'},
                                { data: 'Login'},
                                { data: 'HostName'},
                                {
                                    data: 'BlkBy',
                                    render: function (BlkBy) {
                                        if (BlkBy >= 0) {
                                            return '<B style="color: red " class="parpadea text">' + BlkBy + '<B>';
                                        } else {
                                            return BlkBy;
                                        }

                                    }
                                },
                                { data: 'DBName'},
                                { data: 'Command'},
                                {
                                    data: 'CPUTime',
                                    render: function (CPUTime) {
                                        if (CPUTime >= 1000) {
                                            return '<B style="color: red" class="parpadea text">' + CPUTime+'<B>';
                                        } else {
                                            return CPUTime;
                                        }

                                    }
                                },
                                { data: 'DiskIO' },
                                { data: 'LastBatch' },
                                { data: 'ProgramName'},
                            ],
                            language: {
                                "sEmptyTable": "<center class='text-white'>Linea En Espera</center>",
                            }
                        });
                    }, error: function (data) {
                        alert(JSON.stringify(data))
                    }
                });
        };

        function LoadData2() {
            var obj = new Object();
            obj.vnId = '2';
            $.ajax({
                type: 'POST',
                url: "SerApp.asmx/LstServer",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var lst = JSON.parse(data.d);
                    //  alert(JSON.stringify(data.d))
                    $('#db2').DataTable({
                        paging: false,
                        destroy: true,
                        searching: false,
                        info: false,
                        ordering: false,
                        scrollY: "30vh",
                        scrollX: true,
                        scrollCollapse: true,
                        data: lst,
                        columns: [
                            { data: 'SPID' },
                            { data: 'Status' },
                            { data: 'Login' },
                            { data: 'HostName'},
                            {
                                data: 'BlkBy',
                                render: function (BlkBy) {
                                    if (BlkBy >= 0) {
                                        return '<B style="color: red" class="parpadea text">' + BlkBy + '<B>';
                                    } else {
                                        return BlkBy;
                                    }

                                }
                            },
                            { data: 'DBName'},
                            { data: 'Command'},
                            {
                                data: 'CPUTime',
                                render: function (CPUTime) {
                                    if (CPUTime >= 1000) {
                                        return '<B style="color: red" class="parpadea text">' + CPUTime + '<B>';
                                    } else {
                                        return CPUTime;
                                    }

                                }
                            },
                            { data: 'DiskIO' },
                            { data: 'LastBatch' },
                            { data: 'ProgramName' },
                        ],
                        language: {
                            "sEmptyTable": "<center class='text-white'>Linea En Espera</center>",
                        }
                    });
                }, error: function (data) {
                    alert(JSON.stringify(data))
                }
            });
        };
        $(document).ready(function () {
             setInterval(LoadData, 10000);
             setInterval(LoadData2, 10000);
        });

        //var elem = document.documentElement;

        ///* View in fullscreen */
        //function openFullscreen() {
        //    if (elem.requestFullscreen) {
        //        elem.requestFullscreen();
        //    } else if (elem.mozRequestFullScreen) { /* Firefox */
        //        elem.mozRequestFullScreen();
        //    } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
        //        elem.webkitRequestFullscreen();
        //    } else if (elem.msRequestFullscreen) { /* IE/Edge */
        //        elem.msRequestFullscreen();
        //    }
        //}
        //$(document).ready(function () {
        //    openFullscreen()
        //});

    </script>
</body>
</html>

