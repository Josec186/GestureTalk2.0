<%-- 
    Document   : configuracion
    Created on : 22/11/2017, 04:19:44 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configución</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link href="Estilos/styleConfiguracion.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
        <script src="JavaScripCodes/scripts.js"  type="text/javascript"></script>
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
    </head>
    <body>
        <script>
            var bandAvatar = false;
            var bandNombre = false;
            var bandContra = false;
            var id_avatar = "<%=user.getId_avatar()%>";
            function avatar1() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/1c.png';
                id_avatar = 1;
            }
            function avatar2() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/2c.png';
                id_avatar = 2;
            }
            function avatar3() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/3c.png';
                id_avatar = 3;
            }
            function avatar4() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/4c.png';
                id_avatar = 4;
            }
            function avatar5() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/5c.png';
                id_avatar = 5;
            }
            function avatar6() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/6c.png';
                id_avatar = 6;
            }
            function openChangeName() {
                document.getElementById('cambio-nombre').style.display = 'block';
            }
            function hiddeChangeName() {
                if (document.getElementById('nombre').value === "") {
                    document.getElementById('errorNombre').innerHTML = "No se aceptan campos vacios";
                } else {
                    document.getElementById('errorNombre').innerHTML = "";
                    $("#cambio-nombre").toggle(500);
                    setTimeout(function () {
                        $(".wrap.pgconf").css({
                            "justify-content": "center"
                        });
                    }, 500);


                    bandNombre = true;
                }
            }
            function hiddeChangeAvatar() {
                $("#select-avatar").toggle(500);
                setTimeout(function () {
                    $(".wrap.pgconf").css({
                        "justify-content": "center"
                    });
                }, 500);

                bandAvatar = true;
            }

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
                            document.getElementById('errorPass').innerHTML = "Las contraseñas no coinciden";
                        } else {
                            document.getElementById('conf-pass').style.display = 'none';
                            document.getElementById('change-pass').style.display = 'block';
                            document.getElementById('errorPass').innerHTML = "";
                        }
                    }
                }
            }
            function compruebaPass() {
                if (document.getElementById('oldPass').value !== "") {
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
                    var id = "<%=user.getId_usuario()%>";
                    ajax.open("GET", "AJAXCheckPasswrd.jsp?pass=" + document.getElementById('oldPass').value + "&id=" + id, true);
                    ajax.send(null);
                } else {
                    document.getElementById('errorPass').innerHTML = "El espacio está vacío";
                }
            }

            function hiddeChangePass() {
                if (document.getElementById('newPass').value !== "" || document.getElementById('confNewPass').value !== "") {
                    if (document.getElementById('newPass').value === document.getElementById('confNewPass').value) {
                        document.getElementById('change-pass').style.display = 'none';
                        document.getElementById('errorNewPass').innerHTML = "";
                        document.getElementById('oldPass').value = "";
                        bandContra = true;
                        setTimeout(function () {
                            $("#change-pass").hide(500);
                            $(".wrap.pgconf").css({
                                "justify-content": "center"
                            });
                        }, 500);
                    } else {
                        document.getElementById('errorNewPass').innerHTML = "Las contraseñas no coinciden";
                    }
                } else {
                    document.getElementById('errorNewPass').innerHTML = "Hay campos vacios";
                }
            }



            function sendUpdate() {
                var id_usuario = "<%=user.getId_usuario()%>";
                var nombre = "<%=user.getNickname()%>";
                var pass = "<%=user.getPasswrd()%>";
                var avatar = "<%=user.getId_avatar()%>";
                band = 0;
                if (bandNombre)
                    nombre = document.getElementById("nombre").value;
                if (bandContra) {
                    pass = document.getElementById("newPass").value;
                    band = 1;
                }
                if (bandAvatar)
                    avatar = id_avatar;
                location.href = "checkCambiosConfig.jsp?nombre=" + nombre + "&pass=" + pass + "&avatar=" + avatar + "&id=" + id_usuario + "&band=" + band;
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

            <div class="fondoapp">
                <div class="wrap pgconf">
                    <div class="cnfppal">
                        <!--           --------------------------CAMBIO DE IMAGEN--------------   -->
                        <!--                    VARIABLE DE CAMBIO, SI SE DETECTA QUE CAMBIO ALGO AHORA SI EL BOTON DE CONFIRMAR SE MUESTRA-->
                        <div id="chgavatar">
                            <a href="javascript:void(0)">
                                <div class="btnoragne btnesconf">
                                    <h2 class="parrafo-normal">
                                        Cambiar Avatar
                                    </h2>
                                </div>
                            </a>
                        </div>


                        <!--           --------------------------CAMBIO DE NOMBRE--------------   -->                        
                        <div id="chgname">
                            <a href="javascript:void(0)">
                                <div class="btnoragne btnesconf">
                                    <h2 class="parrafo-normal">
                                        Cambiar Nombre de Usuario
                                    </h2>
                                </div>
                            </a>
                        </div>


                        <!--           --------------------------CAMBIO DE CONTRASEÑA--------------   -->                          
                        <div id="chgpassw" >
                            <a href="javascript:void(0)">
                                <div class="btnoragne btnesconf">
                                    <h2 class="parrafo-normal">
                                        Cambiar Contraseña
                                    </h2>
                                </div>
                            </a>
                        </div>


                        <!--           --------------------------BOTON DE CONFIRMACION--------------   --> 
                        <div id="btnconfirmacion">
                            <a href="javascript:void(0)" onclick="sendUpdate()">
                                <div class="btnoragne btnesconf" id="updte">
                                    <h2 class="parrafo-normal">
                                        Confirmar los cambios
                                    </h2>
                                </div>
                            </a>
                        </div>
                    </div>


                    <div id="select-avatar">
                        <div id="imgactual">
                            <label>
                                <img class="img-resp imgpre" id="cambio" src="Imagenes/Avatares/Elejido/1c.png" >
                            </label>                                                                                                 
                            <span class="titulo-pequeno txtconfig">Elige tu avatar</span>
                        </div>
                        <div id="imgBorder">
                            <img class="img-resp imgpre" onclick="avatar1();" id="marco1" src="Imagenes/Avatares/Elije/1.jpg">
                            <img class="img-resp imgpre" onclick="avatar2();" id="marco2" src="Imagenes/Avatares/Elije/2.jpg">
                            <img class="img-resp imgpre" onclick="avatar3();" id="marco3" src="Imagenes/Avatares/Elije/3.jpg">
                            <img class="img-resp imgpre" onclick="avatar4();" id="marco4" src="Imagenes/Avatares/Elije/4.jpg">
                            <img class="img-resp imgpre" onclick="avatar5();" id="marco5" src="Imagenes/Avatares/Elije/5.jpg">
                            <img class="img-resp imgpre" onclick="avatar6();" id="marco6" src="Imagenes/Avatares/Elije/6.jpg">
                        </div>

                        <div id="avataraconfir">
                            <div class="btnoragne btnesconf" onclick="hiddeChangeAvatar()">
                                <h2 class="parrafo-normal">
                                    Confirmar
                                </h2>
                            </div>
                        </div>
                    </div>

                    <div id="cambio-nombre">
                        <div id="chnamebox">
                            <div><p class="errorMsg" id="errorNombre"></p></div>
                            <h3 class="titulo-mediano">Escribe tu nuevo Nickname</h3>
                            <div>
                                <input class="bor" id="nombre" type="text" value="<%=user.getNickname()%>" maxlength="10">
                            </div>
                            <div>
                                <a href="javascript:void(0)" onclick="hiddeChangeName()">
                                    <img class="img-resp" src="Imagenes/Configuracion/btnConfirmarCambio.png">
                                </a>
                            </div>    
                        </div>
                    </div>

                    <div id="conf-pass">
                        <div id="chnamebox">
                            <div><p class="errorMsg" id="errorPass"></p></div>
                            <div><p class="letrasForm">Confirmar Contraseña</p></div>                            
                            <div>
                                <input class="bor" id="oldPass" type="password">
                                <a href="javascript:void(0)" onclick="compruebaPass()" id="chnamebox"><img src="Imagenes/Configuracion/btnConfirmarCambio.png"></a>
                            </div>
                        </div>
                    </div>
                    <!--                        checar en donde se pone esto-->
                    <div id="change-pass">
                        <div id="chnamebox">
                            <div><p class="errorMsg" id="errorNewPass"></p></div>
                            <div class="col-sm-6" id="chnamebox">
                                <div><p class="letrasForm">Nueva Contraseña</p></div>
                                <input class="bor" id="newPass" type="password">
                            </div>
                            <div class="col-sm-6" id="chnamebox">
                                <div><p class="letrasForm">Confirma Contraseña</p></div>
                                <input class="bor" id="confNewPass" type="password">
                            </div>
                            <div>
                                <div>
                                    <a href="javascript:void(0)" onclick="hiddeChangePass()">
                                        <img class="img-resp" src="Imagenes/Configuracion/btnConfirmarCambio.png">
                                    </a>
                                </div>
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
