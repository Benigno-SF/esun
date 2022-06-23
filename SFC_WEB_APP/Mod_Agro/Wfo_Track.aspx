<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_Track.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_Track" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        .bg {
            background: #ffffff;
            overflow:auto;
        }
        
        .map {
            min-height: 50vh;
        }

        #myDiv.fullscreen {
            /*background: #ffffff;*/
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDIAttc2aWupPv2Na1H8vZV-Pe0LV1K7WU"></script>
    <li class="nav-item">
        <button type="button" id="btnExpand" class="btn btn-primary col-12">
            <i class="fa fa-window-maximize"></i>Full Pantalla
        </button>
    </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    
    <div class="row" id="myDiv"></div>
    <script>
        var ArMaps = new Array();
        var markerStore = {};
        var interval = 20;
        var steps = 100;
        var obFundo = function () {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            var tmp = null;
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListFundo",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                async: false,
                success: function (data) {
                    tmp = JSON.parse(data.d);
                }
            });
            return tmp;
        }();
        //
        function markerTransition(marker, oldPosition, newPosition, i) {
            // we calculate the temporary position
            var tempPosition = new google.maps.LatLng(
                oldPosition.lat() + i * (newPosition.lat() - oldPosition.lat()) / steps,
                oldPosition.lng() + i * (newPosition.lng() - oldPosition.lng()) / steps
            );
            marker.setPosition(tempPosition);
            if (i < steps) {
                setTimeout(function () {
                    markerTransition(marker, oldPosition, newPosition, i + 1);
                },
                    interval
                );
            }
        }
        //
        $(document).ready(function () {
            GenFundo();
            initMap();
        });
    
        //setInterval(LoadMark, 1000);
        setInterval(LoadMarkv1, 5000);

        var poly;

        function LoadMarkv1() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDispositivo = 0;
            obj.vnTiempo = 30;
            
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListTrack",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
               // async: false,
                success: function (data) {
                    lstMark = JSON.parse(data.d);
                    for (i = 0; i < ArMaps.length; ++i) {
                        var map = ArMaps[i].DvMap
                        for (var x = 0, len = lstMark.length; x < len; x++) {
                            if (ArMaps[i].vnIdFund == lstMark[x].nIdFundo) {
                                if (markerStore.hasOwnProperty(lstMark[x].IdMark)) {
                                    markerTransition(markerStore[lstMark[x].IdMark],markerStore[lstMark[x].IdMark].getPosition(), new google.maps.LatLng(lstMark[x].nLatitud, lstMark[x].nLongitud), 0);
                                } else {
                                    //
                                    var markerIcon = {
                                        url: 'http://image.flaticon.com/icons/svg/252/252025.svg',
                                        scaledSize: new google.maps.Size(50, 50),
                                        origin: new google.maps.Point(0, 0),
                                        anchor: new google.maps.Point(32, 65),
                                        labelOrigin: new google.maps.Point(25, 20)
                                    };
                                    //
                                    var marker = new google.maps.Marker({
                                        position: new google.maps.LatLng(lstMark[x].nLatitud, lstMark[x].nLongitud),
                                        title: lstMark[x].cNombre + " " + lstMark[x].dHora,
                                        icon: markerIcon,
                                        label: {
                                            text: lstMark[x].nIdDispositivo + "",
                                            color: "#eb3a44",
                                            fontSize: "12px",
                                            fontWeight: "bold"
                                        },
                                        map: map
                                    });
                                    markerStore[lstMark[x].IdMark] = marker;
                                }
                            }
                        }
                    }
                }
            });

        }

        function LoadMark() {
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vnIdDispositivo = 0;
            obj.vnTiempo = 30;
            
            $.ajax({
                type: 'POST',
                url: "../SerAgro.asmx/ListTrack",
                data: JSON.stringify({ obj: obj }),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
               // async: false,
                success: function (data) {
                    lstMark = JSON.parse(data.d);
                    //var lstCords;
                    for (i = 0; i < ArMaps.length; ++i) {
                        var map = ArMaps[i].DvMap
                        var poly = ArMaps[i].poly;
                        poly.setMap(null);

                        var path = poly.getPath();
                        path.clear();
                        lstMark.forEach(function (result, index) {
                            //console.log(JSON.stringify(result))
                            //console.log(result.nIdFundo + "- "  + ArMaps[i].vnIdFund)
                            if (ArMaps[i].vnIdFund == result.nIdFundo) {

                                var myLatlng = new google.maps.LatLng(parseFloat(result.nLatitud), parseFloat(result.nLongitud));
                                path.push(myLatlng);
                                lstMark.splice(index, 1);
                            }
                        });
                        poly.setMap(map);
                    }
                }
            });
        };

        function initMap() {
            obFundo.forEach(function (result, index) {
                var vIdMap = "map_" + result.nIdFundo
                LoadGAPI(vIdMap, result.nIdFundo, parseFloat(result.nLatitud), parseFloat(result.nLongitud), result.nZoom)
            });
        };
        
        function LoadGAPI(IdFund, vnIdFund, nLati, nLong, nZoom) {
            var myLatlng = new google.maps.LatLng(nLati, nLong);
            var mapOptions = {
                zoom: nZoom,
                center: myLatlng,
                mapTypeId: 'satellite',
                streetViewControl: false,
            }
            var mapDiv = document.getElementById(IdFund);
            var map = new google.maps.Map(mapDiv, mapOptions);
            var obj = new Object();
            poly = new google.maps.Polyline({
                strokeColor: '#F76B4E',
                strokeOpacity: 1.0,
                strokeWeight: 3
            });
            poly.setMap(map);
            obj.DvMap = map;
            obj.poly = poly;
            obj.IdFund = IdFund;
            obj.vnIdFund = vnIdFund;
            ArMaps.push(obj);
        };

        $("#btnExpand").click(function (e) {
            $('#myDiv').toggleClass('fullscreen');
            var elem = document.getElementById("myDiv");
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { /* Firefox */
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { /* IE/Edge */
                elem.msRequestFullscreen();
            }
        });

        function GenFundo() {
            obFundo.forEach(function (result, index) {
                var vvHtml = "";
                vvHtml += "<div class='col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 bg'>"
                    + result.cDescFundo
                    + "<div id='map_" + result.nIdFundo + "' class='map'></div>"
                    + "</div>"
                $("#myDiv").append(vvHtml);
            });
        };

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
