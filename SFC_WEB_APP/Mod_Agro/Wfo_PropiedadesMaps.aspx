<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_PropiedadesMaps.aspx.cs" Inherits="SFC_WEB_APP.Mod_Agro.Wfo_PropiedadesMaps" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <div class="col-md-2">
            <div class="form-group col-xs-12 mb-1">
                <label for="ddlIdFundo" class="col-form-label">Fundo:</label>
                <asp:DropDownList ID="ddlIdFundo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlnIdDisp_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group col-xs-12 mb-1">
                <label for="ddlnIdDisp" class="col-form-label">Vigilante:</label>
                <asp:DropDownList ID="ddlnIdDisp" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group col-xs-12 mb-1" id="DivFeInic">
                <label for="txtFeInic">Fecha Hora Inicio</label>
                <input type="text" id="txtFeInic" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy HH:mm">
                <script type="text/javascript">
                    $(function () {
                        $('#<%=txtFeInic.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY HH:mm',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeInic').datetimepicker({
                            format: 'DD/MM/YYYY HH:mm',
                            locale: 'es'
                        });
                    });
                });
                </script>
            </div>
            <div class="form-group col-xs-12" id="DivFeFina">
                <label for="txtFeInic">Fecha Hora Final</label>
                <input type="text" id="txtFeFina" runat="server" autocomplete="off" class="form-control" placeholder="dd/mm/yyyy HH:mm">
                <script type="text/javascript">
                    $(function () {
                        $('#<%=txtFeFina.ClientID %>').datetimepicker({
                        format: 'DD/MM/YYYY HH:mm',
                        locale: 'es'
                    });
                    $(function () {
                        $('#DivFeFina').datetimepicker({
                            format: 'DD/MM/YYYY HH:mm',
                            locale: 'es'
                        });
                    });
                });
                </script>
            </div>
            <div class="form-group col-xs-12">
                <label for="btnBusc">&nbsp;</label>
                <button type="button" id="btnBusc" class="btn btn-secondary">
                    <i class="fa fa-search"></i> Buscar
                </button>
            </div>
            <div class="col-md-12 text-center" id="load">

            </div>
        </div>
    <script>

        var map, line, marker;
        var directionsService = new google.maps.DirectionsService();
        var TravelMarker = travelMarker.TravelMarker;
        speedMultiplier = 1; // speedMultiplier to control animation speed

        var locationData = [];
        var name = "";
        $("#btnBusc").click(function (event) {
            event.preventDefault();
            $('#myDiv').html("<img src='../Img/load_map.gif' width='90'><br /><b>Trazando Mapa ...</b>");
            var obj = new Object();
            obj.vcIdEmpresa = fuGetCdEmpre();
            obj.vcIdAmbito = $('#<%=ddlIdFundo.ClientID%>').val();
            obj.vnIdUsuario = $('#<%=ddlnIdDisp.ClientID%>').val();
            obj.vnIdFundo = $('#<%=txtFeInic.ClientID %>').val();
            if (obj.vnIdFundo != '' && obj.vcIdAmbito != '' && obj.vnIdUsuario != '' && obj.vcIdEmpresa != '') {
                    $.ajax({
                        type: 'POST',
                        url: "../SerAgro.asmx/ListTrackView",
                        data: JSON.stringify({ obj: obj }),
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            var lst = JSON.parse(data.d);
                            locationData.length = 0;

                            for (i = 0; i < lst.length; ++i) {
                                locationData.push([lst[i].nLatitud, lst[i].nLongitud]);
                                name = lst[i].cNombre;
                            }

                            if (locationData != '') {
                                google.maps.event.addDomListener(window, 'myDiv', initialize(locationData, name));
                                $('.controlsx').show();
                            } else {
                                toastr.error('', 'NO TIENE RUTA');
                                $('#myDiv').html('');
                                $('.controlsx').hide();
                            }
                            ////////////////////////////////
                        },
                        error: function (error) {
                            console.log(error);
                            alert(JSON.stringify(error))
                        }
                    });
                } else {
                    toastr['error']('', 'SELECCIONE TODOS LOS CAMPOS');
                }

            });

        // initialize map
        function initialize(locationData, name) {
            var mapOptions = {
                zoom: 15,
                center: new google.maps.LatLng(locationData[parseInt((locationData.length - 1) / 2, 10)][0], locationData[parseInt((locationData.length - 1) / 2, 10)][1]),
                mapTypeId: 'satellite'
            };
            map = new google.maps.Map(document.getElementById('myDiv'),
                mapOptions);
            // calcRoute();
            mockDirections(locationData);
        }

        // mock directions api
        function mockDirections(locationData, name) {
            var locationArray = locationData.map(l => new google.maps.LatLng(l[0], l[1]));
            line = new google.maps.Polyline({
                //  strokeOpacity: 0.5,
                strokeColor: "#95F905",
                strokeOpacity: 3.0,
                strokeWeight: 3,
                path: [],
                map: map
            });
            locationArray.forEach(l => this.line.getPath().push(l));

            /*   var latlng = new Array();
               for (var i = 0; i < locationData.length; i++) {
   
                   latlng.push("lat: " + locationData[0][0] + " lng: " + locationData[0][1]);
   
   
               }*/

            var start = new google.maps.LatLng(locationData[0][0], locationData[0][1]);
            var end = new google.maps.LatLng(locationData[locationData.length - 1][0], locationData[locationData.length - 1][1]);

            var startMarker = new google.maps.Marker({ position: start, map: map, label: 'A' });
            var endMarker = new google.maps.Marker({ position: end, map: map, label: 'B' });
            initRoute();
        }

        // get locations from direction service
        function calcRoute() {
            line = new google.maps.Polyline({
                // strokeOpacity: 0.5,
                //strokeColor: "#FF5733",
                strokeColor: "#95F905",
                strokeOpacity: 3.0,
                strokeWeight: 3,
                path: [],
                map: map
            });

            var start = new google.maps.LatLng(locationData[0][0], locationData[0][1]);
            var end = new google.maps.LatLng(locationData[locationData.length - 1][0], locationData[locationData.length - 1][1]);
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.BICYCLING
            };
            directionsService.route(request, (response, status) => {
                if (status == google.maps.DirectionsStatus.OK) {
                    var legs = response.routes[0].legs;
                    for (i = 0; i < legs.length; i++) {
                        var steps = legs[i].steps;
                        for (j = 0; j < steps.length; j++) {
                            var nextSegment = steps[j].path;
                            for (k = 0; k < nextSegment.length; k++) {
                                line.getPath().push(nextSegment[k]);
                            }
                        }
                    }
                    initRoute();
                }
            });
        }

        // initialize travel marker
        function initRoute() {
            var route = line.getPath().getArray();
            // options
            var options = {
                map: map,  // map object
                speed: 50, // default 10 , animation speed
                interval: 10, //default 10, marker refresh time
                speedMultiplier: speedMultiplier,
                // cameraOnMarker: true,
                markerOptions: {
                    title: name,
                    animation: google.maps.Animation.DROP,
                    icon: {
                        url: 'https://cdn1.iconfinder.com/data/icons/communication-social-media-set-2/512/15-512.png',
                        animation: google.maps.Animation.DROP,
                        // This marker is 20 pixels wide by 32 pixels high.
                        // size: new google.maps.Size(256, 256),
                        scaledSize: new google.maps.Size(58, 58),
                        // The origin for this image is (0, 0).
                        origin: new google.maps.Point(0, 0),
                        // The anchor for this image is the base of the flagpole at (0, 32).
                        anchor: new google.maps.Point(26, 55)
                    }
                },
            };

            // define marker
            marker = new TravelMarker(options);

            // add locations from direction service 
            marker.addLocation(route);

            setTimeout(play, 2000);
        }


        function play() {
            marker.play();
        };

        // play animation
        $("#play").click(function (event) {
            event.preventDefault();
            marker.play();
        });

        // pause animation
        $("#pause").click(function (event) {
            event.preventDefault();
            marker.pause();
        });

        // reset animation
        $("#reset").click(function (event) {
            event.preventDefault();
            marker.reset();
        });

        // jump to next location
        $("#next").click(function (event) {
            event.preventDefault();
            marker.next();
        });

        // jump to previous location
        $("#prev").click(function (event) {
            event.preventDefault();
            marker.prev();
        });

        // fast forward
        $("#fast").click(function (event) {
            event.preventDefault();
            speedMultiplier *= 2;
            document.getElementById('speed').innerHTML = 'Speed: ' + speedMultiplier + 'x';
            marker.setSpeedMultiplier(speedMultiplier)
        });

        // slow motion
        $("#slow").click(function (event) {
            event.preventDefault();
            speedMultiplier /= 2;
            document.getElementById('speed').innerHTML = 'Speed: ' + speedMultiplier + 'x';
            marker.setSpeedMultiplier(speedMultiplier)
        });

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

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
