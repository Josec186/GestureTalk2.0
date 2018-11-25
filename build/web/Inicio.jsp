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
<!--        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">

    </head>
    <body>

        <div class="fondoapp">
            <header class="hnav">
                    <h1 class="logoapp">
    			 <a href="javascript(0)" alt="Logo GestureTalkMx"></a>
                    </h1>
                    <nav class="navbar">
                        <a href="cerrarSesion.jsp"> Cerrar sesión</a>
                        <a href="info.jsp">Informacion</a>
                        <a href="puntaje.jsp">Puntaje</a>
                        <div class="dropdown">
                            <button class="dropbtn">Dropdown 
                                <i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-content">
                                <a href="#">Link 1</a>
                                <a href="#">Link 2</a>
                                <a href="#">Link 3</a>
                            </div>
                        </div> 
                    </nav>
                     <!-- IMG USER-->
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
                                    out.println("<span id='letras'>" + user.getNickname() + "</span>");
                                %>                                                             
                        </div>
            </header>
            
            
 
                
               
           
                
                    <div class="wrap ppalapp">
                            <!-- AQUI INICIA EL SLIDER -->
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
<!--                                 Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>

<!--                                 Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="Inicio.jsp"><img src="Imagenes/menu_Principal/Tarjeta.png" alt="Principal" style="width:100%;"></a>
                                    </div>

<!--                                    <div class="item">
                                        <a href="info.jsp"><img src="Imagenes/menu_Principal/Tarjeta2.png" alt="SobreNosotros" style="width:100%;"></a>
                                    </div>

                                    <div class="item">
                                        <a href="Busqueda.jsp"><img src="Imagenes/menu_Principal/Tarjeta3.png" alt="Buscar" style="width:100%;"></a>
                                    </div>-->
                                </div>
<!--
                                 Left and right controls 
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Anterior</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Siguiente</span>
                                </a>-->
                            </div>   
                            <div id="ppalopc">
                                <div class="col-4"><a href="Busqueda.jsp"><img  src="Imagenes/menu_Principal/Diccionario.png" class="img-responsive"></a></div>
                                <div class="col-4"><a href="Escoger.jsp"><img  src="Imagenes/menu_Principal/Nivel.png" class="img-responsive"></a></div>
                                <div class="col-4"><a href="configuracion.jsp"><img src="Imagenes/menu_Principal/configuracion.png" class="img-responsive"></a></div>
                            </div>
                                
                    </div>
                    
            </div>
</body>
</html>

