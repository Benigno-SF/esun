<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_ViewMapLotesLegal.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_ViewMapLotesLegal" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>

    <style>
        .map {
            height: 80vh;
            width: 100%;
            margin: 0px;
            padding: 0px;
            font-weight: 400;
        }


        .controlsx {
        position: absolute;
        z-index: 999;
        top: 10px;
        right: 50px;
        }

        .spanx {
        color: red;
        background: white;
        padding: 10px;
        border-radius: 10px;
        }

        .map-label {
                    background-color: #00968859;
                    color: white !important;
                    text-align: center;
                    white-space: nowrap;
                    border-radius: 8px;
                    font-size: 12px !important;
                    padding: 4px;
                    box-shadow: 0 2px 7px 1px rgb(0 0 0 / 30%);
                    font-weight: inherit !important;
            }
    </style>
    <script src="https://unpkg.com/travel-marker/dist/travel-marker.umd.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaqQi4hFNet2FZQHDL4lakHJ4JRMAN7as"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Titles" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Body" runat="server">
      <div class="row">
        <div class="col-md-12" style="height: 85vh;">
    <div id="map" class="map col-md-12" style="height: inherit;"></div>
                    </div>
    </div>

    <!-- small modal -->
<div class="modal fade" id="verimagenModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <form id="pago_form" name="verimagen_form" method="post" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title-nom">inf Doc </h4>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="padding-top: 0px;">
                    <div class="row">
                            <div id="detalles" class="col-md-6">
                                &nbsp;
                            </div>
                            <div class="col-md-6">
                                <div class="panel-group  text-center" id="accordion" role="tablist" aria-multiselectable="true">
                                </div>
                            </div>
                    </div>
                </div>
                <div class="modal-footer text-center">
                    <input type="hidden" name="pago_id" id="pago_id" />
                    <input type="hidden" name="operation" id="operation" />

                    <button type="button" class="btn btn-simple" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </form>
    </div>
</div>

    <script>

        $(document).ready(function () {
            initGoogleMaps();
        });
        
        function $_GET(q, s) {
            s = (s) ? s : window.location.search;
            var re = new RegExp('&amp;' + q + '=([^&amp;]*)', 'i');
            return (s = s.replace(/^\?/, '&amp;').match(re)) ? s = s[1] : s = '';
        }

        function initGoogleMaps() {
            var select = '';
            var estado = '';

            $.ajax({
                type: "POST",
                url: "http://204.199.164.92/sf/maps/read_marker_datasrv.php",
                data: { id_prop: select, a: 2},
                dataType: "json",
                success: function (data)
                {
                  
                    var storeArray = data;

                    const SunFruits = {lat: -14.017957080353375, lng: -75.73368561062625};
                    var myOptions = {
                        center: SunFruits,
                        zoom: 12,
                        mapTypeId: google.maps.MapTypeId.HYBRID,
                        scrollwheel: true,
                        disableDefaultUI: true,
                        zoomControl: true,
                        mapTypeControl: true,
                    };

                    var gmarkers = [];
                    var map = new google.maps.Map(document.getElementById("map"), myOptions);

                    //     google.maps.event.addListener(map, 'click', function () {

                    for (i = 0; i < storeArray.length; i++) {
                        var icon = {
                            url: storeArray[i][3], // url
                            scaledSize: new google.maps.Size(30, 30), // size
                            labelOrigin: new google.maps.Point(50, 32),
                        };
                        if (storeArray[i][7] == 3) {
                            var labelx = {
                                text: "" + storeArray[i][8] + "",
                                color: "#203334",
                                fontWeight: "bold",
                                fontSize: "15px",
                                className: "map-label"
                            };
                        } else {
                            var labelx = "";

                        }
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(storeArray[i][0], storeArray[i][1]),
                            icon: icon,
                            url: storeArray[i][4],
                            name: storeArray[i][2],
                            map: map,
                            title: storeArray[i][8],
                            idtipo: storeArray[i][7],
                            // label: labelx,
                        });

                        gmarkers.push(marker);
                        if (storeArray[i][5] != "") {
                            // Construct the polygon.
                            var bermudaTriangle = new google.maps.Polygon({
                                paths: storeArray[i][5],
                                strokeColor: storeArray[i][6], //contorno
                                strokeOpacity: 0.8,
                                strokeWeight: 3,
                                name: storeArray[i][2],
                                url: storeArray[i][4],
                                fillColor: storeArray[i][6], //relleno
                                fillOpacity: 0.20
                            });
                            bermudaTriangle.setMap(map);
                            infoWindow = new google.maps.InfoWindow;
                        }

                        google.maps.event.addListener(marker, 'click', function () {
                            // window.location.href = this.url;
                            var id = $(this).attr("url");
                            if (id != '')
                            {
                                $.ajax({
                                    method: "POST",
                                    url: "http://204.199.164.92/sf/maps/verimagensrv.php",
                                    data: {id: id},
                                    dataType: "json",
                                    success: function (data)
                                    {
                                        $('#verimagenModal').modal('show');
                                        $('#verimagen').html(data.imagen);
                                        $('.modal-title-nom').text(data.nombre);
                                        $("#accordion").html('');
                                        var id_px = {id_p: data.id, ambito: 2};
                                        carga_doc(id_px);
                                    }
                                })
                            } else {
                                $.notify({
                                    icon: "notifications",
                                    message: "f",
                                }, {
                                    type: "danger",
                                    timer: "3000",
                                    placement: {
                                        from: "top",
                                        align: "right"
                                    }
                                });
                            }
                        });

                        var infowindow = new google.maps.InfoWindow({
                            content: storeArray[i][2]
                        });

                        var infowindowtitle = new google.maps.InfoWindow({
                            content: storeArray[i][8],
                        });

                        if (storeArray[i][7] == 1) {
                            infowindowtitle.open(map, marker);
                        }

                        marker.addListener('mouseover', function () {

                            var title = $(this).attr("name");
                            var idtipoc = $(this).attr("idtipo");
                            if (idtipoc != 1) {
                                infowindow = new google.maps.InfoWindow({
                                    content: title
                                });
                                infowindow.open(map, this);
                            }
                        });

                        marker.addListener('mouseout', function () {
                            infowindow.close();
                        });
                        function setMapOnAll(mapnew2) {
                            for (let i = 0; i < gmarkers.length; i++) {
                                gmarkers[i].setMap(mapnew2);
                            }
                        }
                        //var label= { color: '#333', fontWeight: 'bold', fontSize: '16px', text: data[i].deviceID.toUpperCase() }; 
                        map.addListener('zoom_changed', function () {
                            for (var i = 0; i < gmarkers.length; i++) {
                                if (map.getZoom() > 15 && storeArray[i][7] == 3) {
                                    gmarkers[i].setLabel({
                                        text: "" + gmarkers[i].getTitle() + "",
                                        color: "#203334",
                                        fontWeight: "bold",
                                        fontSize: "15px",
                                        className: "map-label",
                                    });
                                } else {
                                    gmarkers[i].setLabel(null);
                                }
                            }
                        });
                    }//descomprimir array

                    //  });

                }
            });

        }


        function carga_doc(dats) {

            $.ajax({
                type: "POST",
                url: "http://204.199.164.92/sf/maps/class/read_detalles_propsrv.php",
                data: dats,
                dataType: "json",
                success: function (data)
                {
                    $('#detalles').html(data.detalles);
                }
            });

            $.ajax({
                type: "POST",
                url: "http://204.199.164.92/sf/maps/class/read_detailsrv.php",
                data: dats,
                dataType: "json",
                success: function (data)
                {
                    if (data != '') {
                        var html = "";
                        var lst = new Array();
                        for (var i = 0; i < data.length; i++) {
                            var Valida = false;
                            for (var x = 0; x < lst.length; x++) {
                                if (lst[x].nIdTipoDoc == data[i].nIdTipoDoc)
                                    Valida = true;
                            }
                            if (!Valida) {
                                var obj = new Object();
                                obj.nIdTipoDoc = data[i].nIdTipoDoc;
                                obj.cDescTipoDoc = data[i].cDescTipoDoc;
                                lst.push(obj);
                            }
                        }
                        for (var i = 0; i < lst.length; i++) {
                            html += "<div class='card accordion collapse-icon panel mb-0 box-shadow-0 border-0'>"
                            html += "<div class='card-header card-collapse-border' role='tab' id='DvHead" + lst[i].nIdTipoDoc + "'>"
                            html += "<a role='button' data-toggle='collapse' data-parent='#accordion' href='#DvBody" + lst[i].nIdTipoDoc + "' aria-expanded='false' aria-controls='DvBody" + lst[i].nIdTipoDoc + "' class='collapsed'>"
                            html += "<h6 class='panel-title'>" + lst[i].cDescTipoDoc + "</h6></a> </div>"
                            html += "<div id='DvBody" + lst[i].nIdTipoDoc + "' class='panel-collapse collapse' role='tabpanel' aria-labelledby='DvHead" + lst[i].nIdTipoDoc + "' aria-expanded='false' style='height: 0px;'>"
                            html += "<div class='panel-body' id='dvBodyC" + lst[i].nIdTipoDoc + "' style='background-color: #d6e2d621;'><div class='table-responsive'><table id=Table" + lst[i].nIdTipoDoc + " style='width: 100%; margin: 0px;' class='table table-striped small'></table></div></div></div></div>"
                            $("#accordion").html(html)
                        }
                        for (var i = 0; i < data.length; i++) {
                            //$("#dvBodyC" + data[i].nIdTipoDoc).append(" "+ data[i].btn + "<br />");
                            $("#Table" + data[i].nIdTipoDoc).append("<tr style='border-bottom: 1px solid #e2c5c5;'><td style='width: 85%; text-align: left; padding: 2 2px !important'>" + data[i].cDescDoc + "</td><td style='width: 15%;text-align: right; padding: 2 2px !important'>" + data[i].btn + "</td></tr>");
                        }
                    } else {
                        $("#accordion").html('No contiene Documentos')
                    }
                }, error: function () {
                    $("#accordion").html('No contiene Documentos')
                }
            });
        }

    </script>
<%--    <script type="text/javascript" src="jquery.media.js"></script>--%>

    <script>
        $(function () {
            $(document).on('click', '.ver_pdf', function (e) {
                e.preventDefault();
                //$("#myModal2").modal('show');
                var title = $(this).attr('idnom');
                $("#title_doc").text(title);

                $.post('http://204.199.164.92/sf/maps/hasilsrv.php',
                        {id: $(this).attr('id')},
                    function (html) {
                        JSON.stringify(html);
                            //console.log(html);
                            //  $(".bodypdf").html(html);
                            window.open(html, html, 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=900,height=600,left = 183,top = 100');
                        }
                );
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
