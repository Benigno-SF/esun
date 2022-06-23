<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_MoniLinea.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_MoniLinea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <title>Lineas</title>
    <%: Styles.Render("~/Content/css") %>
    <%: Scripts.Render("~/jquery") %>
    <%--silver chipitaps--%>
    <style>
        body {
            color: lawngreen;
            background-color: #212529 !important;
        }
        .r-img {
  width: 100%;
  max-width: 200px;
  height: auto;
        }
        .divt {
            padding: 0px;
            background-color: coral;
            color: white;
            padding: 0px;
            font-size: 3vw;
        }

        .divcat {
            padding: 10px;
            font-size: 3vw;
        }

        .divn {
        padding: 0px;
            font-size: 7vw;
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
    </style>
</head>
<body>
    <table style="width: 100%; text-align: center; margin-bottom: 0px" class="table">
        <tr>
            <td style="width: 25%; padding: 0px; margin: 0px">
                <img src="../Img/sf-logo.png" class="r-img"/>
            </td>
            <td style="width: 50%; padding: 0px; margin: 0px">
                <div id="title" class="text-center" style="font-size: 3vw; color: white"></div>
            </td>
            <td style="width: 25%; padding: 0px; margin: 0px">
                <form id="form2" runat="server" class="form-signin">
                    <div class="form-group">
                        <asp:DropDownList ID="ddlMonitor" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </form>
            </td>
        </tr>
    </table>
    <table style="width: 100%; text-align: center; height: 90vh" class="divc">
        <tr id="columns">
            
        </tr>
    </table>

</body>

<script>

    var internvalo;
    $('#<%=ddlMonitor.ClientID%>').change(function () {
        cargapanel();
        intervalo = setInterval(cargapanel, 10000);
    });

    var cargapanel = function () {
        var obj = new Object();
        obj.vnIdMonitor = $('#<%=ddlMonitor.ClientID%>').val();
        $('#title').text($("#<%=ddlMonitor.ClientID%> option:selected").text());
        $.ajax({
            type: 'POST',
            url: "SerApp.asmx/ListMonitorSubLinea",
            data: JSON.stringify({ obj: obj }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                // clearInterval(intervalo);
                var lst = JSON.parse(data.d);
                var dat1 = '';
                var dat2 = '';
                var dat3 = '';
                var dat4 = '';

                var cal1 = "";
                var cal2 = "";
                var cal3 = "";
                var cal4 = "";

                var cat1 = '';
                var cat2 = '';
                var cat3 = '';
                var cat4 = '';

                var tit1 = "";
                var tit2 = "";
                var tit3 = "";
                var tit4 = "";
                var tit5 = "";
                var body1 = "";
                var body2 = "";
                var body3 = "";
                var body4 = "";

                c = '';
                var title = '';
                for (var i = 0; i < lst.length; i++) {
                    if (lst[i].nPosicion == 1) {
                        if (lst[i].cDesCategoria != "") {
                            cat1 = lst[i].cDesCategoria;
                            c = 'C-';
                            cal1 = lst[i].cDesCalibre + " ";
                        } else {
                            c = ''
                        }
                        tit1 = '<h1 class="divt" style="font-weight: bold; line-height: 1;">' + lst[i].cDescSubLinea + '</h1><br />';
                        body1 += '<h1 class="divcat" style="line-height: 0.6;">' + c + cat1 + '<b class="divn" style="font-weight: bold; line-height: 0.6;"> ' + cal1 + '</b></h1><br />';
                    } else if (lst[i].nPosicion == 2) {
                        if (lst[i].cDesCategoria != "") {
                            cat2 = lst[i].cDesCategoria;
                            c = 'C-';
                            cal2 = lst[i].cDesCalibre + " ";
                        } else {
                            c = '';
                        }
                        tit2 = '<h1 class="divt" style="font-weight: bold; line-height: 1;">' + lst[i].cDescSubLinea + '</h1><br />';
                        body2 += '<h1 class="divcat" style="line-height: 0.6;">' + c + cat2 + '<b class="divn" style="font-weight: bold; line-height: 0.6;"> ' + cal2 + '</b></h1><br />';
                    } else if (lst[i].nPosicion == 3) {
                        if (lst[i].cDesCategoria != "") {
                            cat3 = lst[i].cDesCategoria;
                            c = 'C-';
                            cal3 = lst[i].cDesCalibre + " ";
                        } else {
                            c = '';
                        }
                        tit3 = '<h1 class="divt" style="font-weight: bold; line-height: 1;">' + lst[i].cDescSubLinea + '</h1><br />';
                        body3 += '<h1 class="divcat" style="line-height: 0.6;">' + c + cat3 + '<b class="divn" style="font-weight: bold; line-height: 0.6;"> ' + cal3 + '</b></h1><br />';
                    } else if (lst[i].nPosicion == 4) {
                        if (lst[i].cDesCategoria != "") {
                            cat4 = lst[i].cDesCategoria;
                            c = 'C-';
                            cal4 = lst[i].cDesCalibre + " ";
                        } else {
                            c = '';
                        }
                        tit4 = '<h1 class="divt" style="font-weight: bold; line-height: 1;">' + lst[i].cDescSubLinea + '</h1><br />';
                        body4 += '<h1 class="divcat" style="line-height: 0.6;">' + c + cat4 + '<b class="divn" style="font-weight: bold; line-height: 0.6;"> ' + cal4 + '</b></h1><br />';
                    }
                }
                dat1 = tit1 + body1;
                dat2 = tit2 + body2;
                dat3 = tit3 + body3;
                dat4 = tit4 + body4;
                
                if (dat4 != "" && dat3 != "" && dat2 != "" && dat1 != "") {
                    var columns = '<td class="divc" style="vertical-align: top; width: 25%">' + dat4 + '</td > <td class="divc" style="vertical-align: top; width: 25%">' + dat3 + '</td><td class="divc" style="vertical-align: top; width: 25%">' + dat2 + '</td><td class="divc" style="vertical-align: top; width: 25%">' + dat1 + '</td>';
                } else if(dat1 != "" ){
                    var columns = '<td class="divc" style="font-size= 7rem; vertical-align: top; width: 100%">' + dat1 + '</td >';
                }else if(dat2 != "" ){
                    var columns = '<td class="divc" style="font-size= 7rem; vertical-align: top; width: 100%">' + dat2 + '</td >';
                }else if(dat3 != ""){
                    var columns = '<td class="divc" style="font-size= 7rem; vertical-align: top; width: 100%">' + dat3 + '</td >';
                }else if(dat4 != ""){
                    var columns = '<td class="divc display-1" style="font-size= 7rem; vertical-align: top; width: 100%">' + dat4 + '</td >';
                }


                $('#columns').html(columns);

            }

        });
    }
</script>
</html>
