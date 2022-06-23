
var formatNumber = {
    separador: ",", // separador para los miles
    sepDecimal: '.', // separador para los decimales
    formatear: function (num) {
        num += '';
        var splitStr = num.split('.');
        var splitLeft = splitStr[0];
        var splitRight = splitStr.length > 1 ? this.sepDecimal + splitStr[1] : '';
        var regx = /(\d+)(\d{3})/;
        while (regx.test(splitLeft)) {
            splitLeft = splitLeft.replace(regx, '$1' + this.separador + '$2');
        }
        return this.simbol + splitLeft + splitRight;
    },
    new: function (num, simbol) {
        this.simbol = simbol || '';
        return this.formatear(num);
    }
}

function DateConvert(datestring) {
    if (datestring != null) {
        var fullDate = new Date(parseInt(datestring.substr(6)));

        var twoDigitMonth = (fullDate.getMonth() + 1) + ""; if (twoDigitMonth.length == 1) twoDigitMonth = "0" + twoDigitMonth;
        var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
        var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + fullDate.getFullYear();

        var twoDigitHour = fullDate.getHours() + ""; if (twoDigitHour.length == 1) twoDigitHour = "0" + twoDigitHour;
        var twoDigitMinutes = fullDate.getHours() + ""; if (twoDigitMinutes.length == 1) twoDigitMinutes = "0" + twoDigitMinutes;
        var currentHour = twoDigitHour + ':' + twoDigitMinutes;
        if (currentHour != '00:00') {
            return currentDate + ' ' + currentHour;
        } else {
            return currentDate;
        }

    } else {
        return '';
    }
}


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