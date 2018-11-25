<%-- 
    Document   : puntaje
    Created on : 25/11/2017, 07:57:35 PM
    Author     : erick
--%>

<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    int puntaje = 0;
    String consulta = "select * from puntajeusuario where id_usuario=" + user.getId_usuario() + ";";
    objConn.Consultar(consulta);
    if (objConn.rs.getRow() != 0) {
        puntaje = objConn.rs.getInt(2);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntaje</title>
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
                <%                        switch (user.getId_avatar()) {
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
        <div class="fondoapp">
            <div class="wrap">
                <div>
                    
                </div>
                <img src="Imagenes/Puntuacion/trofeo.png" class="img-responsive" width="80%">
                <div class="">
                    <div class="tuPuntaje"><span class="stylePuntaje">Tú puntaje</span></div>
                    <div class="puntos"><%out.println("<span class='stylePuntos'>" + puntaje + "</span>");%></div>
                    <div ><img src="Imagenes/Puntuacion/sigueEsforzandote.png"></div>
                </div>                
            </div>
        </div>
    </body>
</html>
