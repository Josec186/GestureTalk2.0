
<%-- 
    Document   : Nivel
    Created on : 25/11/2017, 11:08:54 PM
    Author     : Jose
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Usuario"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%
    Usuario user;
    HttpSession sesionOk = request.getSession();
    user = (Usuario) sesionOk.getAttribute("usuario");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int unidad = Integer.parseInt(request.getParameter("unidad"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escoge Nivel</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <link href="Estilos/styleInicio.css" rel="stylesheet" type="text/css">    
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
            var unidad;
            function e1() {
                location.href = "LlamaNivel.jsp?nivel=" + 1;
            }
            function e2() {
                location.href = "LlamaNivel.jsp?nivel=" + 2;
            }
            function e3() {
                location.href = "LlamaNivel.jsp?nivel=" + 3;
            }
            function e4() {
                location.href = "LlamaNivel.jsp?nivel=" + 4;
            }
            function e5() {
                location.href = "LlamaNivel.jsp?nivel=" + 5;
            }
            function e6() {
                location.href = "LlamaNivel.jsp?nivel=" + 6;
            }
            function e7() {
                location.href = "LlamaNivel.jsp?nivel=" + 7;
            }
            function e8() {
                location.href = "LlamaNivel.jsp?nivel=" + 8;
            }
            function e9() {
                location.href = "LlamaNivel.jsp?nivel=" + 9;
            }
            function e10() {
                location.href = "LlamaNivel.jsp?nivel=" + 10;
            }
            function e11() {
                location.href = "LlamaNivel.jsp?nivel=" + 11;
            }
            function e12() {
                location.href = "LlamaNivel.jsp?nivel=" + 12;
            }
            function e13() {
                location.href = "LlamaNivel.jsp?nivel=" + 13;
            }
            function e14() {
                location.href = "LlamaNivel.jsp?nivel=" + 14;
            }


        </script>
        <header class="hnav">
            <div class="navimgprincipal" href="Inicio.jsp">
                <h1 class="logoapp">
                    <a href="javascript:void(0)" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar">
                <a class="imgreturn" href="Escoger.jsp">
                    <img class="img-resp" src="Imagenes/menu_Principal/regresar.png" >
                </a>
                <a href="javascript:void(0)"> Antes de empezar</a>
                <div class="dropdown">
                    <button class="dropbtn" href="info.jsp">Información 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="javascript:void(0)">Antecedentes</a>
                        <a href="javascript:void(0)">¿Sabías que...?</a>
                        <a href="javascript:void(0)">Datos curiosos</a>
                        <a href="javascript:void(0)">Estadísticas</a>
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
                        <a href="javascript:void(0)">Puntajes globales</a>
                    </div>
                </div> 

                <div class="dropdown nvimguser">
                    <div class="imguser">
                        <% switch (user.getId_avatar()) {
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
                <div class="wrap pgunidad">
                    <%
                        /*Tomamos la unidad que se escogió y obtendremos los niveles que le corresponden, obtendremos sus enlaces 
                        y los pintaremos*/
                        ArrayList<String> nivel = new ArrayList();
                        ArrayList<Integer> num = new ArrayList();
                        
                        String consulta = "SELECT nombre  FROM nivel where id_unidad =" + unidad + ";";
                        objConn.Consultar(consulta);
                            do {
                               nivel.add(objConn.rs.getString(1));
                               //num.add(objConn.rs.getInt("id_nivel"));
                            } while (objConn.rs.next());
                            
                        consulta = "SELECT id_nivel  FROM nivel where id_unidad =" + unidad + ";";
                        objConn.Consultar(consulta);
                            do {
                               num.add(objConn.rs.getInt(1));
                               //num.add(objConn.rs.getInt("id_nivel"));
                            } while (objConn.rs.next());
                        
                      //  out.println("<span id='letras' class='titulo-pequeno' style='color:black;'>" + nivel + "</span>");
                        
                      //  int x = objConn.rs.getInt(1);
                        
                        
                        
                        
                        // ArrayList<Integer> nivel = new ArrayList();

                        //  ResultSetMetaData metaData = objConn.rs.getMetaData();
                        /*   while(objConn.rs.next()){
                  //            nivel.add(objConn.rs.getInt(1));
                      }*/         
                        for(int i = 0; i < (nivel.size()); i++){              
                    %> 
                    <div class="btnoragneniv" onclick="location.href = 'LlamaNivel.jsp?nivel=' + <% out.println(num.get(i)); %>;">
                        <h2 class="titulo-mediano">
                           <% out.println(nivel.get((i))); %>
                        </h2>
                    </div>          
                   
                    <%  
                      } 
                    %>


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