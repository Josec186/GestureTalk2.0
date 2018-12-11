<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
<%@page import="java.util.Collections"%>
<%@page import="Clases.Nivel"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Bonus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleEjercicios.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
        <script src="JavaScripCodes/FuncionesEjercicios.js" type="text/javascript"></script>
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
    </head>
    <body>        
        <%
            Nivel ejercicios = (Nivel) sesionOk.getAttribute("examen");
            if (sesionOk.getAttribute("respuesta") != null) {
        %>
        <div class="mrespuesta" id="mostrarmodal">   
            <%
                if (sesionOk.getAttribute("respuesta").equals("correcta")) {
            %>
            <div class="imgmodal">
                <img class="img-responsive" data-dismiss="modal" src="Imagenes/Ejercicios/correcto.png">
            </div>
            <%
            } else {
            %>

            <img class="img-responsive " data-dismiss="modal" src="Imagenes/Ejercicios/incorrecto.png" >

            <%
                }
            %>


            <%
                }
            %>
        </div>

        <div class="modal fade" id="respuestas" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="modal hide fade in" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3>¡FELICIDADES!</h3>
                        <h5>¡NIVEL COMPLETADO!</h5>
                    </div>
                    <div class="modal-body row" id="extra">

                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-sm-6" id="mas"></div>
                            <div class="col-sm-6">
                                <form method="POST" action="NivelCompleto.jsp" name="finalizo">
                                    <button type="submit" class="btn btn-warning active">Continuar</button>
                                    <input id="final" name="calif">
                                </form>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>

        <div id="salir" class="mdal">  
            <div class="fondemdal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="blckmodal()">&times;</button>               
                </div>
                <div class="modal-body">
                    <h3 class="titulo-mediano">¿Está seguro que desea salir?</h3>
                    <h4 class="parrafo-normal">Todo el avance se perdera de continuar</h4>
                </div>
                <div class="modal-footer">
                    <form method="POST" action="SalirNivel.jsp" >
                        <button type="submit" class="btn btn-warning active titulo-mediano" id="btnsalir" >Aceptar</button>
                    </form>
                </div>
            </div>
        </div>

        <header class="hnav">
            <div class="navimgprincipal" href="Inicio.jsp">
                <h1 class="logoapp">
                    <a href="javascript:void(0)" alt="Logo_GestureTalkMx"></a>
                </h1>
            </div>

            <nav class="navbar navejercicio">
                <a class="imgreturn" onclick="salir()">
                    <img class="img-resp" src="Imagenes/menu_Principal/regresar.png" >
                </a>
                <div class="puntejercicio">

                    <div id="puntaje">
                        <h4 class="titulo-mediano"><input id="punto" value="<%=ejercicios.getPuntaje()%>">
                            <%=ejercicios.getPuntaje()%>
                        </h4>   
                    </div>
                </div>
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
            </nav>
        </header>  

        <%
            ArrayList<String> valor = new ArrayList<String>();
            ArrayList<String> real = new ArrayList<String>();
            ArrayList<String> resp = new ArrayList<String>();

            valor.add(ejercicios.getNivel().get(0).getPalabra());
            valor.add(ejercicios.getNivel().get(0).getRf1());
            valor.add(ejercicios.getNivel().get(0).getRf2());
            real.add(ejercicios.getNivel().get(0).getPalabra());
            real.add(ejercicios.getNivel().get(0).getRf1());
            real.add(ejercicios.getNivel().get(0).getRf2());
            resp.add(ejercicios.getNivel().get(0).getFoto());
            resp.add(ejercicios.getNivel().get(0).getFf1());
            resp.add(ejercicios.getNivel().get(0).getFf2());

            Collections.shuffle(valor);

        %>  
        <div class="fondoapp">
            <div class="wrap pgunidad">
                <form method="POST" onsubmit="" name="examen" class="layoutejercicio">
                    <h4 class="titulo-mediano encabezado ">Bonus</h4>
                    <div class="btnrespusetasvideo">
                        <div class="extranswer">
                            
                            <div class="videoshow">
                                <!--                                <img  class="img-responsive" src="" width="400px" height="400px" id="imagen">                                                                 -->
                                <video id="videoclip" autoplay loop muted>
                                    <source id="mp4video" src="Imagenes/videos/<%=resp.get(0)%>.mp4" type="video/mp4">
                                </video>
                        </div> 

                            <div class="radbuttonsextra">                
                                <label class="container">
                                    <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                            <%=valor.get(0)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c1" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(1)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c1" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(2)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c1" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>

                        <div class="extranswer">
                             <div class="videoshow">
                                <!--                                <img  class="img-responsive" src="" width="400px" height="400px" id="imagen">                                                                 -->
                                <video id="videoclip" autoplay loop muted>
                                    <source id="mp4video" src="Imagenes/videos/<%=resp.get(1)%>.mp4" type="video/mp4">
                                </video>
                        </div> 
                            
                           <div class="radbuttonsextra">                
                                <label class="container">
                                    <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                            <%=valor.get(0)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c2" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(1)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c2" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(2)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c2" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>   

                        <div class="extranswer">     
                             <div class="videoshow">
                                <!--                                <img  class="img-responsive" src="" width="400px" height="400px" id="imagen">                                                                 -->
                                <video id="videoclip" autoplay loop muted>
                                    <source id="mp4video" src="Imagenes/videos/<%=resp.get(2)%>.mp4" type="video/mp4">
                                </video>
                        </div> 

                           <div class="radbuttonsextra">                
                                <label class="container">
                                    <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                            <%=valor.get(0)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c3" value="<%=valor.get(0)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(1)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c3" value="<%=valor.get(1)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>

                                <label class="container">
                                     <div class="btnoragne">
                                        <h2 class="titulo-mediano">
                                              <%=valor.get(2)%>
                                        </h2>
                                    </div>
                                    <input type="radio" name="c3" value="<%=valor.get(2)%>" onclick="activarExamen()">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>



                    <div class="col-sm-4">
                        <button type="button" class="btn btn-warning respuesta" disabled id="Confirmar" onclick="extras()">Confirmar</button>
                    </div>
                    <div class="col-sm-4">
                        <div class="row">
                            <input type="text" id = "resp1" name="re1" value="<%=real.get(0)%>">
                        </div>
                        <div class="row">
                            <input type="text" id = "resp2" name="re2" value="<%=real.get(1)%>">
                        </div>
                        <div class="row">
                            <input type="text" id = "resp3" name="re3" value="<%=real.get(2)%>">
                        </div>
                    </div>

                </form>

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

