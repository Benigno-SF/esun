
$('#nd').on('keydown keypress', function (e) {
    if (e.key.length === 1) { // Evaluar si es un solo caracter
        if ($(this).val().length < 15 && !isNaN(parseFloat(e.key))) {
            $(this).val($(this).val() + e.key);
        }
        if ($(this).val().length == 8 && !isNaN(parseFloat(e.key))) {
           // vd($(this).val());
        }
        return false;
    }
    //if ($(this).val().length == 1) {
    //    $("#td").val('');
    //    $("#nm").val('');
    //    $("#ap").val('');
    //    $("#am").val('');
    //    $("#sx").val('');
    //}
});

function vd(doc) {
    var obj = new Object();
    obj.vcNroDocumento = doc;
    $.ajax({
        type: 'POST',
        url: "SerApp.asmx/vrfdni",
        data: JSON.stringify({ obj: obj }),
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            var lst = JSON.parse(data.d);
            if (lst != "") {
                nom = lst[0].cdn.split('|');
                $("#td").val('1');
                $("#nm").val(nom[1]);
                $("#ap").val(nom[2]);
                $("#am").val(nom[3]);
                $("#sx").val(nom[4]);
            } else {
                $("#td").val('');
                $("#nm").val('');
                $("#ap").val('');
                $("#am").val('');
                $("#sx").val('');
            }
        },
    });
}

var removeItem = function (object, key, value) {
    if (value == undefined)
        return;

    for (var i in object) {
        if (object[i][key] == value) {
            object.splice(i, 1);
        }
    }
    return object
};

$('.i-n').on('input', function () {
    this.value = this.value.replace(/[^0-9]/g, '');
});

$('.i-nct').on('input', function () {
    this.value = this.value.replace(/[^0-9+-]/g, '');
});

$('#chk-dj').on('change', function () {
    var checked = this.checked;
    if (checked = true) {
        $("#vc").removeClass("parpadea");
    }
    else {
        $("#vc").addClass("parpadea");
    }
});
var fp = '';
$(document).ready(function () {
    $image_crop = $('#image_demo').croppie({
        enableExif: true,
        viewport: {
            width: 270,
            height: 320,
            type: 'square' //circle
        },
        boundary: {
            width: 280,
            height: 330
        },
        enableOrientation: true
    });
    $(".rotate").on("click", function () {
        $image_crop.croppie('rotate', parseInt($(this).data('deg')));
    });
    $('#fp').on('change', function () {
        var reader = new FileReader();
        reader.onload = function (event) {
            $image_crop.croppie('bind', {
                url: event.target.result
            }).then(function () {
                //console.log('jQuery bind complete');
            });
        };
        reader.readAsDataURL(this.files[0]);
        $('#uploadimageModal').modal('show');
    });
    $('.crop_image').click(function (event) {
        $image_crop.croppie('result', {
            type: 'canvas',
            size: 'viewport'
        }).then(function (response) {
            fp = response;
            htmlx = '<img id="fot" class="img-tbr" src="' + response + '">';
            $("#charged").html(htmlx);
            $('#imagev').html("");
            $('#uploadimageModal').modal('hide');
            $('#upload_img').hide();
            $('#delete-img').show();
            $('#input-f').hide();
        });
    });
    $('.cancel_crop_image').click(function (event) {
        $('#delete-img').hide();
        $('#input-f').show();
        $("#charged").html('');
        $('#delete-img').hide();
        $("#fp").val('');
        $('#input-f').show();
        $('.custom-file-label').text('Seleccionar Imagen');
    });
});

window.addEventListener('load', () => {
    var forms = document.getElementsByClassName('needs-validation');
    for (let form of forms) {
        form.addEventListener('submit', (evt) => {
            evt.preventDefault();
            if ($("#chk-dj").is(':checked')) {
                $("#vc").removeClass("parpadea");
                if (!form.checkValidity()) {
                    evt.stopPropagation();
                }
                else {
                    //  $('#rowform').fadeOut(1000);
                    var obj = new Object();
                    obj.vnIdTemporada = 0;
                    obj.vcTipoDocumento = $("#td").val();
                    obj.vcNroDocumento = $("#nd").val();
                    obj.vcNombres = $("#nm").val();
                    obj.vcApPaterno = $("#ap").val();
                    obj.vcApMaterno = $("#am").val();
                    obj.vcSexo = $("#sx").val();
                    obj.vcFechaNacimiento = $("#dfn").val() + '-' + $("#mfn").val() + '-' + $("#afn").val();
                    obj.vcNacionalidad = $("#nc").val();
                    obj.vcDireccion = $("#dr").val();
                    obj.vcDistrito = $("#ds").val();
                    if ($("#dpt").val() == "" || $("#dpt").val() == null) {
                        obj.vcDepartamento = 'ninguno';
                    } else {
                        obj.vcDepartamento = $("#dpt").val();
                    }
                    obj.vcCelular = $("#ce").val();
                    obj.vcEmail = $("#em").val();
                    if ($("#turno").val() == "" || $("#turno").val() == null) {
                        alert('Selecccione Turno');
                        return;
                    } else {
                        obj.vcTurno = $("#turno").val();
                    }
                    obj.vcImg = fp;
                    if ($("#cqp").val() == "" || $("#cqp").val() == null) {
                        obj.vnidCargoPost = -1;
                    } else {
                        obj.vnidCargoPost = $("#cqp").val();
                    }
                    obj.vcDescCargo = $("#el").val();
                    obj.vcFile = $('#fileb64').val();
                    obj.vExt = $("#fileext").val();
                    var radios = document.getElementsByName("trsf");
                    var found = 1;
                    for (var i = 0; i < radios.length; i++) {
                        if (radios[i].checked) {
                            if (radios[i].value == 1) {
                                obj.vbReingresante = true;
                            } else {
                                obj.vbReingresante = false;
                            }
                            found = 0;
                            break;
                        }
                    }
                    if (found == 1) {
                        obj.vbReingresante = false;
                    }
                    obj.vcReCargos = $("#crc").val();
                    obj.vcReOtroCargo = $("#rel").val();
                    obj.vcReAnios = $("#ac").val();
                    obj.vcReCapanias = $("#cc").val();

                    if ($("#gi").val() == "" || $("#gi").val() == null) {
                        obj.vcGradoInstruccion = 'otros';
                    } else {
                        obj.vcGradoInstruccion = $("#gi").val();
                    }
                    obj.vcExpOEmpresa = '';

                   // alert(JSON.stringify(obj ));

                    if (validarFecha($("#dfn").val(), $("#mfn").val(), $("#afn").val()) == true) {

                        $('#rowbutton').html('<div><img src="../img/loading.gif" alt="loading" /><br/> <p class="label-input">Un momento, por favor...</p></div>');

                        $.ajax({
                            type: 'POST',
                            url: "SerApp.asmx/RegiPersona",
                            data: JSON.stringify({ obj: obj }),
                            dataType: 'json',
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                var lst = JSON.parse(data.d);
                                if (lst != "") {
                                    if (lst.rpta != 0) {
                                        $('#needs-validation')[0].reset();
                                        limpiarlabel();

                                        $('#DivRpta').show();
                                        $('#rowform').hide();
                                        $('#divfootr').hide();
                                        $('#rowbutton').html('<button type="submit" id="AddTrb" class="btn btn-lg btn-success" style="top: 25%; position: relative;">Enviar Informacion</button>');

                                    } else {
                                        alert('Ocurrio un error al guardar sus Datos, Ingrese nuevamente');
                                        // location.reload();
                                        $('#rowbutton').html('<button type="submit" id="AddTrb" class="btn btn-lg btn-success" style="top: 25%; position: relative;">Enviar Informacion</button>');
                                    }

                                } else {
                                    alert('Ocurrio un error al guardar sus Datos, Ingrese nuevamente');
                                    //  location.reload();
                                }
                            },
                            error: function (error) {
                                alert(JSON.stringify(error))
                            }
                        });
                    } else {
                        ShowToast('error', 'ingrese fecha de cumpleaños valida', '')
                    }
                }
                form.classList.add('was-validated');
            }
            else {
                $("#vc").addClass("parpadea");
                ShowToast('error', 'Marque la casilla de Declaracion Juarada', '')
            }
        });
    }
});

$('#cqp').on('change', function (e) {
    var cv = $("option:selected", this).attr('sc');
    if (cv == 1) {
        setTimeout(function () {
            $("#icv").fadeIn(1500);
        }, 100);

    } else {
        setTimeout(function () {
            $("#icv").fadeOut(1500);
        }, 100);
    }
    var val = this.value;
    if (val == 0) {
        setTimeout(function () {
            $("#del").fadeIn(1500);
        }, 100);

    } else if (val != 0 && val != '') {
        setTimeout(function () {
            $("#del").fadeOut(1500);
        }, 100);
    } else {

    }
});



var treeView, dataGrid;

var syncTreeViewSelection = function (treeView, value) {
    if (!value) {
        treeView.unselectAll();
        return;
    }

    value.forEach(function (key) {
        treeView.selectItem(key);
    });
};

var makeAsyncDataSource = function (jsonFile, id) {
    return new DevExpress.data.CustomStore({
        loadMode: "raw",
        key: id,
        load: function () {
            return jsonFile;
        }
    });

};

function Loaddll() {
    var obj = new Object();
    $.ajax({
        type: 'POST',
        url: "SerApp.asmx/ListCargo",
        data: JSON.stringify({ obj: obj }),
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            var lst = JSON.parse(data.d);
            var option = "";
            var optionc = "";
            option += '<option value="" selected disabled> - Seleccione -</option>';

            $("#cqp").html('');
            //$("#crc").html('');
            //$("#xe").html('');
            for (i = 0; i < lst.length; ++i) {
                option += '<option value="' + lst[i].nIdCargo + '" sc="' + lst[i].bCurriculum + '">' + lst[i].cDescCargo + '</option>';
                optionc += '<option value="' + lst[i].cDescCargo + '" >' + lst[i].cDescCargo + '</option>';
            }
            //option += '<option value="0"> - OTRO  - </option>';
            $("#cqp").append(option);

            $("#sel-crc").dxDropDownBox({
                valueExpr: "cDescCargo",
                placeholder: "Seleccione cargos que realizó...",
                displayExpr: "cDescCargo",
                showClearButton: true,
                dataSource: makeAsyncDataSource(lst, 'cDescCargo'),
                contentTemplate: function (e) {
                    var value = e.component.option("value"),
                        $dataGrid = $("<div>").dxDataGrid({
                            dataSource: e.component.getDataSource(),
                            columns: [{ caption: "Cargos que realizó", dataField: "cDescCargo" }],
                            selection: { mode: "multiple" },
                            hoverStateEnabled: true,
                            height: "100%",
                            selectedRowKeys: value,
                            onSelectionChanged: function (selectedItems) {
                                var keys = selectedItems.selectedRowKeys;
                                e.component.option("value", keys);

                                $('#crc').val(keys);
                            }
                        });


                    dataGrid = $dataGrid.dxDataGrid("instance");

                    e.component.on("valueChanged", function (args) {
                        var value = args.value;
                        dataGrid.selectRows(value, false);
                    });

                    return $dataGrid;
                }
            });
        },
        error: function (error) {
            alert(JSON.stringify(error));
        }
    });
    $.ajax({
        type: 'POST',
        url: "SerApp.asmx/ListCultivoPacking",
        data: JSON.stringify({ obj: obj }),
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            var lst = JSON.parse(data.d);
            var option = "";

            $("#cc").html('');
            for (i = 0; i < lst.length; ++i) {
                option += '<option value="' + lst[i].cDesCultivo + '">' + lst[i].cDesCultivo + '</option>';
            }
            $("#sel-cc").dxDropDownBox({
                valueExpr: "cDesCultivo",
                placeholder: "Seleccione Campañas que laboró...",
                displayExpr: "cDesCultivo",
                showClearButton: true,
                dataSource: makeAsyncDataSource(lst, 'cDesCultivo'),
                contentTemplate: function (e) {
                    var value = e.component.option("value"),
                        $dataGrid = $("<div>").dxDataGrid({
                            dataSource: e.component.getDataSource(),
                            columns: [{ caption: "Campañas que laboro", dataField: "cDesCultivo" }],
                            selection: { mode: "multiple" },
                            hoverStateEnabled: true,
                            height: "100%",
                            selectedRowKeys: value,
                            onSelectionChanged: function (selectedItems) {
                                var keys = selectedItems.selectedRowKeys;
                                e.component.option("value", keys);

                                $('#cc').val(keys);
                            }
                        });


                    dataGrid = $dataGrid.dxDataGrid("instance");

                    e.component.on("valueChanged", function (args) {
                        var value = args.value;
                        dataGrid.selectRows(value, false);
                    });

                    return $dataGrid;
                }
            });

        },
        error: function (error) {
            alert(JSON.stringify(error));
        }
    });
};
Loaddll();

$("#ar").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    fileNamecort = fileName.substr(0, 15) + '_.' + fileName.split('.').pop();
    $(this).siblings("#customlabel").addClass("selected").html(fileNamecort);

    //var file = document.querySelector('input[type=file]').files[0];
    //var file = $("#ar").files[0];
    var file = document.querySelector('input[name=ar]').files[0];
    if (['pdf', 'pptx', 'ppt', 'docx', 'doc'].contains(fileName.split('.').pop())) {
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            if (reader.result.split(',')[1] != undefined) {
                $('#fileb64').val(reader.result.split(',')[1]);
                $('#fileext').val(fileName.split('.').pop());
            } else {
                toastr.warning('Verifique el archivo y/o seleccione otro', 'ERROR CON ARCHIVO');
                $("#customlabel").text('Seleccione Documento');
            }
        }
    } else {
        toastr.error('La extension no esta permitido por favor seleccione otro archivo', 'Archivo No permitido');
        $("#customlabel").text('Seleccione Documento');
    }

});

$('#btn-success').click(function (event) {
    event.preventDefault();
    $('#DivRpta').hide();
    $('#rowform').show();
    $('#divfootr').show();
});


$('#delete-img').click(function (event) {
    event.preventDefault();
    $("#charged").html('');
    $('#delete-img').hide();
    $("#fp").val('');
    $('#input-f').show();
    $('.custom-file-label').text('Seleccionar Imagen');
});

$(".custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop();
    fileNamecort = fileName.substr(0, 25) + '_.' + fileName.split('.').pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(fileNamecort);
});

function limpiarlabel() {

    $('.selected').removeClass("selected");

    $("#sel-ac").dxDropDownBox("reset");
    $("#sel-crc").dxDropDownBox("reset");
    $("#sel-cc").dxDropDownBox("reset");

    $("#ac").val('');
    $("#crc").val('');
    $("#cc").val('');

    $('#fileb64').val('');
    $('#fileext').val('');

    $("#charged").html('');
    $('#delete-img').hide();
    $("#fp").val('');
    $('#input-f').show();
    $('.custom-file-label').text('Seleccionar Imagen');

    var formx = document.getElementsByClassName('needs-validation');
    for (let form of formx) {
        form.classList.remove('was-validated');
    }
}

function NameMes(intmes) {
    var month = new Array();
    month[1] = "Enero";
    month[2] = "Febrero";
    month[3] = "Marzo";
    month[4] = "Abril";
    month[5] = "Mayo";
    month[6] = "Junio";
    month[7] = "Julio";
    month[8] = "Agosto";
    month[9] = "Septiembre";
    month[10] = "Octubre";
    month[11] = "Noviembre";
    month[12] = "Diciembre";
    return month[intmes];
}

Array.prototype.contains = function (obj) {
    return this.indexOf(obj) > -1;
};

function ComboDate() {
    var today = new Date();
    var year = today.getFullYear();
    var aniofn = document.getElementById("afn");
    for (var i = year - 17; i >= year - 71; i--)
        aniofn.options.add(new Option(i, i));
    var mesfn = document.getElementById("mfn");
    for (var i = 12; i >= 1; i--)
        mesfn.options.add(new Option(NameMes(i), i));
    var diafn = document.getElementById("dfn");
    for (var i = 31; i >= 1; i--)
        diafn.options.add(new Option(i, i));

    //var aniofn = document.getElementById("ac");
    var datac = [];
    for (var i = year; i >= 2011; i--) {

        datac.push({ 'anio': i })
    }

    $("#sel-ac").dxDropDownBox({
        valueExpr: "anio",
        placeholder: "Seleccione Años que trabajó...",
        displayExpr: "anio",
        showClearButton: true,
        dataSource: makeAsyncDataSource(datac, 'anio'),
        contentTemplate: function (e) {
            var value = e.component.option("anio"),
                $dataGrid = $("<div>").dxDataGrid({
                    dataSource: e.component.getDataSource(),
                    columns: [{ caption: "Años que laboro", dataField: "anio" }],
                    selection: { mode: "multiple" },
                    hoverStateEnabled: true,
                    height: "100%",
                    selectedRowKeys: value,
                    onSelectionChanged: function (selectedItems) {
                        var keys = selectedItems.selectedRowKeys;
                        e.component.option("value", keys);

                        $('#ac').val(keys);
                    }
                });


            dataGrid = $dataGrid.dxDataGrid("instance");

            e.component.on("valueChanged", function (args) {
                var value = args.value;
                dataGrid.selectRows(value, false);
            });

            return $dataGrid;
        }
    });
}
;
ComboDate();


function validarFecha(d, m, a) {
    var ok = true;
    if ((a < 1900) || (a > 2050) || (m < 1) || (m > 12) || (d < 1) || (d > 31))
        ok = false;
    else {
        if ((a % 4 != 0) && (m == 2) && (d > 28))
            ok = false;
        else {
            if ((((m == 4) || (m == 6) || (m == 9) || (m == 11)) && (d > 30)) || ((m == 2) && (d > 29)))
                ok = false;
        }
    }
    return ok;
}

$('input[type=radio][name=trsf]').on('change', function () {
    switch ($(this).val()) {
        case '0': //NO TRABAJA
            $("#t-cc").text('¿Campañas que laboró en otras Empresas?:');
            $("#t-crc").text('¿Labores desempeñadas en otras Empresas?:');

            $("#sel-ac").dxDropDownBox("reset");
            $("#sel-crc").dxDropDownBox("reset");
            $("#sel-cc").dxDropDownBox("reset");

            $("#ac").val('');
            $("#crc").val('');
            $("#cc").val('');

            $("#rel").val('');

            $(".nts").fadeIn(1500);
            $(".sts").hide();
            $('.ist').removeAttr("required");
            break;
        case '1':
            $("#t-cc").text('¿Campañas que laboró?:');
            $("#t-crc").text('¿Labores desempeñadas?:');
            $(".nts").fadeIn(1500);
            $(".sts").fadeIn(1500);
            $('.ist').attr("required", "required");

            $("#sel-ac").dxDropDownBox("reset");
            $("#sel-crc").dxDropDownBox("reset");
            $("#sel-cc").dxDropDownBox("reset");

            $("#ac").val('');
            $("#crc").val('');
            $("#cc").val('');
            $("#rel").val('');
            break;
    }
});

function ShowToast(tipo, titulo, mensaje) {
    toastr.options = {
        tapToDismiss: false
        , timeOut: 5000
        , extendedTimeOut: 0
        , allowHtml: true
        , preventDuplicates: false
        , preventOpenDuplicates: false
        , newestOnTop: true
        , closeButton: true
        //, closeHtml: '<button class="btn-sm" style="background-color: grey; padding: 5px;">X</button>'
    }
    toastr[tipo](mensaje, titulo);
}