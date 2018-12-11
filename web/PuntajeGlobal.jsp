<%-- 
    Document   : PuntajeGlobal
    Created on : 09-dic-2018, 10:52:55
    Author     : luis
--%>

<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
    int puntaje = 0;
    ArrayList<String> users = new ArrayList();
    ArrayList<Integer> usrspuntaje = new ArrayList();

    String consulta = "select distinct id_usuario from realizo;";
    objConn.Consultar(consulta);
    do {
        users.add(objConn.rs.getString(1));
    } while (objConn.rs.next());

    for (int i = 0; i < users.size(); i++) {
        consulta = "SELECT sum(puntaje) from realizo where id_usuario=" + users.get(i) + ";";
        objConn.Consultar(consulta);
        do {
            usrspuntaje.add(objConn.rs.getInt(1));
        } while (objConn.rs.next());
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntaje Global</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>      
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">

    </head>
    <body>
        <header class="hnav">
            <div class="navimgprincipal" href="Inicio.jsp">
                <h1 class="logoapp">
                    <a href="#" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar">
                <a class="imgreturn" href="Inicio.jsp">
                    <img class="img-responsive" src="Imagenes/menu_Principal/regresar.png" >
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
                        <a href="PuntajeGlobal.jsp">Puntajes globales</a>
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
                <div class="wrap puntpersonal">
                    <div class="table-users">
                        <div class="header">Puntajes Globales</div>
                        <table cellspacing="0">
                            <tr>
                                <th>Avatar</th>
                                <th>Nickname</th>
                                <th>Puntaje</th>
                            </tr>

                            <tr>
                                <td> Imagen</td>
                                <td>Jane Doe</td>
                                <td>jane.doe@foo.com</td>
                                <td>01 800 2000</td>
                                <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </td>
                            </tr>

                            
                        </table>
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
