<%-- 
    Document   : Escoger
    Created on : 21/11/2017, 07:29:31 PM
    Author     : Jose
--%>
<%@page import="java.util.Collection"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escoge Unidad</title>
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
            function un1() {
                location.href = "Nivel.jsp?unidad=" + 1;
            }
            function un2() {
                location.href = "Nivel.jsp?unidad=" + 2;
            }
            function un3() {
                location.href = "Nivel.jsp?unidad=" + 3;
            }
            function un4() {
                location.href = "Nivel.jsp?unidad=" + 4;
            }
            function un5() {
                location.href = "Nivel.jsp?unidad=" + 5;
            }
            function un6() {
                location.href = "Nivel.jsp?unidad=" + 6;
            }



        </script>
        <header class="hnav">
            <div class="navimgprincipal" href="Inicio.jsp">
                <h1 class="logoapp">
                    <a href="javascript:void(0)" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar">
                <a class="imgreturn" href="Inicio.jsp">
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
                        ArrayList<Integer> nivel = new ArrayList();
                        ArrayList<ArrayList<Integer>> unidades = new ArrayList<ArrayList<Integer>>();

                        //Primero obtendremos cuantas unidades hay en total
                        String consulta = "SELECT count(id_unidad) FROM unidad;";
                        objConn.Consultar(consulta);
                        int n_unidades = objConn.rs.getInt(1) - 1;
                        consulta = "";
                        //out.println("<span id='letras' class='titulo-pequeno'>" + unidades + "</span>");

                        for (int i = 0; i < n_unidades; i++) {
                            consulta = "";
                            unidades.add(new ArrayList<Integer>());
                            consulta = "SELECT id_nivel FROM nivel where id_unidad =" + (i + 1) + ";";
                            objConn.Consultar(consulta);
                            do {
                                unidades.get(i).add(objConn.rs.getInt(1));
                            } while (objConn.rs.next());
                        }
                        //out.println("<span id='letras' class='titulo-pequeno'>" + unidades.get(3) + "</span>");

                        consulta = "select id_nivel from realizo where id_usuario='" + user.getId_usuario() + "';";
                        objConn.Consultar(consulta);
                        // ResultSetMetaData metaData = objConn.rs.getMetaData();
                        //int x = metaData.getColumnCount();
                        while (objConn.rs.next()) {
                            nivel.add(objConn.rs.getInt(1));
                        }
                        //out.println("<span id='letras' class='titulo-pequeno'>" + nivel + "</span>");

                        //SQL para obtener nombre de las unidades las cuales se dibujan dinámicamente
                        String unidades1 = "select nombre from unidad;";
                        objConn.Consultar(unidades1);
                        ArrayList<String> unidad = new ArrayList();
                        while (objConn.rs.next()) {
                            unidad.add(objConn.rs.getString("nombre"));
                        }
                        //out.println("<span id='letras' class='titulo-pequeno'>" + unidad + "</span>");
                    %>
                    <!--<div class="col-3">
                       <a href="javascript:void(0)"> 
                           <img  onclick="un1();" src="Imagenes/niveles/abecedario.png" class="img-resp">
                           
                       </a>
                   </div>-->

                    <div class="btnoragneunidad" onclick="un1();">
                        <h2 class="titulo-pequeno">
                            <% out.println(unidad.get(0)); %>
                        </h2>
                    </div>                             
                  
                    <%
                        for(int i = 0; i < (unidades.size() -1); i++){
                            if (nivel.containsAll(unidades.get(i))) {
                    
                    %>
                    <div class="btnoragneunidad" onclick="location.href = 'Nivel.jsp?unidad=' + <% out.println((i) + 2); %>;">
                        <h2 class="titulo-pequeno">
                           <% out.println(unidad.get((i+1) )); %>
                        </h2>
                    </div>          
                    <%} else {%>
                    <div class="btnoragneunidad unitblock">   
                        <h2 class="titulo-pequeno">
                            <% out.println(unidad.get((i+1) )); %>
                        </h2>
                    </div>   
                    <%  }
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
