<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wfo_FrioTHD.aspx.cs" Inherits="SFC_WEB_APP.Mod_Frio.Wfo_FrioTHD" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>window.jQuery || document.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))</script>
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="../Content/DevExtreme/dx.light.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/21.2.4/css/dx.light.css" />
    
    <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
    
    <style>
			body { margin: 0; overflow:hidden;background:red;}
            canvas { width: 100%; height: 100% }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SiteRoot" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">

        

        <!--<script src="../Content/KMZLoader.js"></script>-->
        <script src="https://threejs.org/build/three.js"></script>
        
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/cannon.js/0.6.2/cannon.min.js" integrity="sha512-avLcnGxl5mqAX/wIKERdb1gFNkOLHh2W5JNCfJm5OugpEPBz7LNXJJ3BDjjwO00AxEY1MqdNjtEmiYhKC0ld7g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
		
        <script>
            $("document").ready(function () {



                const scene = new THREE.Scene();
                const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

                const renderer = new THREE.WebGLRenderer();
                renderer.setSize(window.innerWidth, window.innerHeight);
                document.body.appendChild(renderer.domElement);

                const geometry = new THREE.BoxGeometry();
                const material = new THREE.MeshBasicMaterial({ color: '#3f278a' });
                const cube = new THREE.Mesh(geometry, material);
                scene.add(cube);

                camera.position.z = 5;

                function animate() {
                    requestAnimationFrame(animate);

                    cube.rotation.x += 0.01;
                    cube.rotation.y += 0.01;

                    renderer.render(scene, camera);
                };

                animate();

                

            });

            
        </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">

</asp:Content>
