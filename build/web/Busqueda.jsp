<%-- 
    Document   : Busqueda
    Created on : 20/11/2017, 10:09:54 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Búsqueda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Estilos/styleBusqueda.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <!--        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>-->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
        <script src="JavaScripCodes/scripts.js"  type="text/javascript"></script>
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
    </head>
    <body>
        <script>
            var ajax;
            function funcionCallback() {
                //Comprobamos si la peticion se ha completado (estado 4)
                if (ajax.readyState == 4) {
                    //Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                    if (ajax.status == 200) {
                        //Escribimos el resultado en la pagina HTML mediante DHTML                        
                        var respuesta = ajax.responseText.trim();
                        console.log(respuesta);
                        if (respuesta == "no") {
                            document.getElementById("palabra").innerHTML = "NO SE ENCONTRÓ LA PALABRA";
                            document.getElementById("descripcion").innerHTML = "";
                            document.getElementById("imagen").src = "";
                            //document.getElementById('info-consulta').style.display = 'none';
                        } else {
                            var datos = respuesta.split(",");
                            console.log(respuesta);
                            // letra + "," + javax.xml.bind.DatatypeConverter.printBase64Binary(img64)
                            $(".videoshow").show();
                            document.getElementById("palabra").innerHTML = datos[0];
                            document.getElementById("imagen").src = "data:image/jpg;base64," + datos[1];
                            document.getElementById("descripcion").innerHTML = datos[2];
                            //document.getElementById('info-consulta').style.display = 'block';
                        }
                    }
                }
            }

            function realizaBusqueda() {
                //Creamos el control XMLHttpRequest segun el navegador en el que estemos
                //document.getElementById('descripcion').innerHTML= "Dio click";
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest(); //No internet explorer
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");//Internet Explorer

                //Almacenamos en el control a la funcion que invocara cuando la peticion
                //cambie de estado
                ajax.onreadystatechange = funcionCallback;

                //Enviamos la peticion 
                //document.getElementById('descripcion').innerHTML= document.getElementById('letra').value;
                ajax.open("GET", "AJAXDiccionario.jsp?letra=" + document.getElementById('letra').value, true);
                ajax.send(null);
            }

            function enter() {
                $("#letra").on('keyup', function (e) {
                    if (e.keyCode == 13) {
                        realizaBusqueda();
                    }
                });
            }

        </script>
        <header class="hnav">
            <div class="navimgprincipal" href="Inicio.jsp">
                <h1 class="logoapp">
                    <a href="#" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar">
                <a class="imgreturn" href="Inicio.jsp">
                    <img class="img-resp" src="Imagenes/menu_Principal/regresar.png" >
                </a>
                <a href="#"> Antes de empezar</a>
                <div class="dropdown">
                    <button class="dropbtn" href="info.jsp">Información 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Antecedentes</a>
                        <a href="#">¿Sabías que...?</a>
                        <a href="#">Datos curiosos</a>
                        <a href="#">Estadísticas</a>
                    </div>
                </div> 

                <a href="Busqueda.jsp">Diccionario</a>
                <a href="Escoger.jsp">Practica</a>
                <div class="dropdown">
                    <button class="dropbtn" >Puntajes 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="puntaje.jsp">Puntaje personal</a>
                        <a href="#">Puntajes globales</a>
                    </div>
                </div> 

                <div class="dropdown nvimguser">
                    <div class="imguser">
                        <%                            switch (user.getId_avatar()) {
                                case 1:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png"><%
                                break;
                            case 2:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/2c.png" ><%
                                break;
                            case 3:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/3c.png" ><%
                                break;
                            case 4:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/4c.png" ><%
                                break;
                            case 5:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/5c.png"><%
                                break;
                            case 6:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/6c.png"><%
                                break;
                            default:
                        %><img class="pad2" src="Imagenes/Avatares/Elejido/1c.png"><%
                                    break;
                            }
                            out.println("<span id='letras' class='titulo-pequeno'>" + user.getNickname() + "</span>");
                        %>                                                             
                    </div>
                    <div class="dropdown-content nvuser {">
                            <a href="configuracion.jsp"> Configuración</a>
                            <a href="cerrarSesion.jsp"> Cerrar sesión</a>
                        </div>
                    </div> 
                </nav>
            </header>   
            <div class="fondoapp pgebusqueda">
                <div class="wrap">
                    <div id="btnsbusqueda" >
                        <div class="btnoragne" id="btnshowqucksrch">
                            <h2 class="parrafo-normal">
                                Búsqueda Rápida
                            </h2>
                        </div>
                        <div class="btnoragne" id="btnshowallwrds">
                            <h2 class="parrafo-normal">
                                Diccionario completo
                            </h2>
                        </div>
                    </div>  
                    
                    <div id="busquedadicc">
                        <div id="busquedaquck">
                            <span class="colorblue">Buscar Palabra</span>
                            <div id="buscadordic">
                                <input class="bordes inptbuscador" type="text" size="50" name="letra" id="letra" onkeypress="enter()" placeholder="Búsqueda">
                                <a href="javascript:void(0)" id="lupa">
                                    <img src="Imagenes/busqueda/lupa.png" class="img-resp" onclick="realizaBusqueda()">
                                </a>
                            </div>
                        </div>
                        
                        <div id="busquedaall">
                            <span class="colorblue">Busqueda avanzada </span>
                            <div id="buscadordic">
                               
                            </div>
                        </div>


                        <div id="videodiccionario">                    
                            <div class="videoshow">
                                <img  class="img-responsive" src="" width="400px" height="400px" id="imagen">                                                                 
                            </div>                            
                            <div>
                                <span class="palabra" id="palabra"></span>
                                <span class="descText" id="descripcion"></span>                            
                            </div>
                        </div>
                        
                        
                    </div>                  
                </div>
            </div>
            <footer>
                <div class="wrap">
                    <p>Todos los derechos reservados Gesture Talk S.A de C.V.</p>
                    <h4 class="titulo-pequeno">correo@mail.com</h4>
                </div>        
            </footer>
        </body>
    </html>
