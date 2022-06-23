<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wfo_EspEmbalaje.aspx.cs" Inherits="SFC_WEB_APP.Mod_App.Wfo_EspEmbalaje" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <style>
        #footer {
            width: 100%;
            height: 30px;
            background: #333;
            border-top: 2px solid #000;
            position: absolute;
            bottom: 0;
        }

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

        .tbRend {
            font-size: 16px;
        }

        .tbRend td {
            border-bottom: 1px solid white;
            font-size: 14px;
        }

        .tittleth {
            color: grey;
        }
    </style>

    <style>
    /**/
    * {box-sizing: border-box}
    body {font-family: Verdana, sans-serif; margin:0}
    .mySlides {
        display: none;
        height: 100%
        }
    img.ImgHorizontal {
        margin-left: auto;
  margin-right: auto;
  display: block;
        
        height: 100%;

    }
    /* Slideshow container */
    .slideshow-container {
        /*max-width: 1000px;*/
        position: absolute;
        margin: auto;
        height: calc(100% - 58px);
        background-color: #212121;
        width: 100%;
    }
    
    /* Next & previous buttons */
    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: #ffffff;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
    }
    
    /* Position the "next button" to the right */
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
        }
        
    /* On hover, add a black background color with a little bit see-through */
    .prev:hover, .next:hover {
        background-color: rgba(0,0,0,0.8);
        }

    /* Caption text */
    .text {
        color: #ffffff;
        font-size: 16px;
        font-weight: bold;
        padding: 8px 12px;
        position: absolute;
        top: 0px;
        width: 100%;
        text-align: center;
        background-color: #FF6836;
        }
    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
        }
    /* The dots/bullets/indicators */
    .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
        }
        
    .active, .dot:hover {
        background-color: #717171;
        }
        
    /* Fading animation */
    .fade {
        -webkit-animation-name: fade;
        -webkit-animation-duration: 1.5s;
        animation-name: fade;
        animation-duration: 1.5s;
        }
        
    @-webkit-keyframes fade {
        from {opacity: .4} 
        to {opacity: 1}
        }
        
    @keyframes fade {
        from {opacity: .4} 
        to {opacity: 1}
        }
        
    /* On smaller screens, decrease text size */
    @media only screen and (max-width: 300px) {
        .prev, .next,.text {font-size: 11px}
        }
    </style>

    <table style="width: 100%; text-align: left; margin-bottom: 0px; height:58px;" class="table" >
        <tr>
            <td style="width: 25%; padding: 0px; margin: 0px">
                <img src="/Img/sf-logo.png" style="width: 160px; left: 0; vertical-align: middle" />
            </td>
            
            <td style="width: auto; padding: 0px; margin: 0px; text-align: center">
                Productor: <label class="text-warning"><%= especificacion.Productor %></label>
            </td>

            <td style="width: 25%; padding: 0px; margin: 0px">
                <div style="padding-top: 7px; font-size: 16px" class="text-white">
                    <label class="text-warning"><%= especificacion.Categoria %></label>
                    <br />
                    <label class="text-warning"><%= especificacion.Empaque %></label>
                </div>
            </td>
        </tr>
    </table>
    
    <div class="slideshow-container">
        <% foreach(var o in especificacion.Imagenes) { %>
        <div class="mySlides fade">
            <img src="/Img/EspEmbalaje/<%=o.Imagen%>" class="ImgHorizontal" />
            <div class="text"><%=o.Titulo%><br/><%=o.Descripcion %></div>
        </div>
        <% } %>
    </div>
    
    <script>

        var timer;
        var slideIndex = 1;

        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
            clearTimeout(timer);
            timer = setTimeout(() => plusSlides(1), 1000 * 5);
        }
    </script>
</body>
</html>

