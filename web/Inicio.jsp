<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    sesionOk.setAttribute("respuesta", null);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <!--        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>-->
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!--        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">

    </head>
    <body>
        <header class="hnav">
            <div class="navimgprincipal">
                <h1 class="logoapp">
                    <a href="#" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar">
                <a href="#"> Antes de empezar</a>
                <div class="dropdown">
                    <button class="dropbtn" onclick="window.location.href='info.jsp'">Información 
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
                        <a href="PuntajeGlobal.jsp">Puntajes globales</a>
                    </div>
                </div> 

                <div class="dropdown nvimguser">
                    <div class="imguser">
                        <%
                            switch (user.getId_avatar()) {
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
                <div class="wrap ppalapp">
                    <div class="slickclass ppalapp">
                        <div >
                            <a href="Inicio.jsp"><img class="imgslick" src="Imagenes/menu_Principal/Tarjeta.png" alt="Principal" ></a>
                        </div>

                        <div >
                            <a href="info.jsp"><img class="imgslick" src="Imagenes/menu_Principal/Tarjeta2.png" alt="SobreNosotros" ></a>
                        </div>

                        <div >
                            <a href="Busqueda.jsp"><img class="imgslick" src="Imagenes/menu_Principal/Tarjeta3.png" alt="Buscar" ></a>
                        </div>
                    </div>
                </div>   
                
                <div id="ppalopc" class="wrap">
                    <div class="col-4"><a href="Busqueda.jsp"><img  src="Imagenes/menu_Principal/Diccionario.png" class="img-responsive"></a></div>
                    <div class="col-4"><a href="Escoger.jsp"><img  src="Imagenes/menu_Principal/Nivel.png" class="img-responsive"></a></div>
                    <div class="col-4"><a href="configuracion.jsp"><img src="Imagenes/menu_Principal/configuracion.png" class="img-responsive"></a></div>
                </div>

            </div>

            <footer>
                <div class="wrap">
                    <p>Todos los derechos reservados Gesture Talk S.A de C.V.</p>
                    <h4 class="titulo-pequeno">correo@mail.com</h4>
                </div>        
            </footer>

            <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
            <script type="text/javascript">
                $('.slickclass').slick({
                    prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                    nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
                    infinite: true,
                    speed: 500,
                    fade: true,
                    cssEase: 'linear'
                });

            </script>
        </body>
    </html>

