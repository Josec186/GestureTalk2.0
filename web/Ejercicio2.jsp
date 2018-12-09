<%-- 
    Document   : Inicio
    Created on : 20/11/2017, 02:17:44 PM
    Author     : erick
--%>
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
        <title>Ejercicio</title>
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
            Nivel ejercicios = (Nivel) sesionOk.getAttribute("ejercicios");
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
           <div class="incomodal">
                <div class="boximg">
                    <img class="img-responsive " data-dismiss="modal" src="Imagenes/Ejercicios/incorrecto.png" >
                </div>
                <h4 class="encabezado titulo-mediano">Respuesta correcta</h4>
                
                <div class="rightanswer">
                     <h4 class="encabezado titulo-mediano"> <%out.println(ejercicios.getNivel().get(0).getPalabra()); %></h4>
                     <video autoplay loop>
                        <source src="Imagenes/Ejercicios/Test.mp4" type="video/mp4">
                     </video>
                </div> 
            </div>         
            <% }%>

            <%
                }
            %>
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
                        <h4 class="titulo-mediano">
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


        <div class="fondoapp">
            <div class="wrap pgunidad">
                <form method="POST" action="Preguntas.jsp" class="layoutejercicio">

                    <div>
                        <h4 class="titulo-mediano encabezado ">Elija la imagen correspondiente al texto</h4>
                    </div>                           

                    <div>
                        <h4 class="encabezado">"<%=ejercicios.getNivel().get(0).getPalabra()%>"</h4>
                    </div>

                    <div class="btnrespusetasvideo">
                        <%
                            int a = (int) (Math.random() * 3), b = a, c = a;
                            ArrayList<Integer> aux = new ArrayList<Integer>();
                            ArrayList<String> valor = new ArrayList<String>();
                            ArrayList<byte[]> resp = new ArrayList<byte[]>();
                            while (b == a) {
                                b = (int) (Math.random() * 3);
                            }
                            while (c == a || c == b) {
                                c = (int) (Math.random() * 3);
                            }
                            aux.add(a);
                            aux.add(b);
                            aux.add(c);
                            System.out.println("");
                            for (int i = 0; i < 3; i++) {
                                switch (aux.get(i)) {
                                    case 0:
                                        valor.add(ejercicios.getNivel().get(0).getPalabra());
                                        resp.add(ejercicios.getNivel().get(0).getFoto());
                                        break;
                                    case 1:
                                        valor.add(ejercicios.getNivel().get(0).getRf1());
                                        resp.add(ejercicios.getNivel().get(0).getFf1());
                                        break;
                                    case 2:
                                        valor.add(ejercicios.getNivel().get(0).getRf2());
                                        resp.add(ejercicios.getNivel().get(0).getFf2());
                                        break;
                                }
                            }
                        %>                        

                        <div class="col-4">
                            <button type="button" class="btn btn-default active respuesta" id="borde1" onclick="activar('Confirmar', value)" value="<%= valor.get(0)%>">
                                <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(0))%>" class="pad img-responsive imgRespuesta">
                            </button>
                        </div>

                        <div class="col-4">
                            <button type="button" class="btn btn-default active respuesta" id="borde2" onclick="activar('Confirmar', value)" value="<%= valor.get(1)%>">
                                <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(1))%>" class="pad img-responsive imgRespuesta">
                            </button>
                        </div>

                        <div class="col-4">
                            <button type="button" class="btn btn-default active respuesta" id="borde3" onclick="activar('Confirmar', value)" value="<%= valor.get(2)%>">
                                <img src="data:image/jpg;base64, <%=javax.xml.bind.DatatypeConverter.printBase64Binary(resp.get(2))%>" class="pad img-responsive imgRespuesta">
                            </button>
                        </div>

                    </div>

                    <div class="col-4">
                        <div>
                            <input type="text" id = "resp" name = "Respuesta">
                        </div>
                        <div >
                            <button type="submit" class="btn btn-warning respuesta" disabled id="Confirmar">Confirmar</button></div>
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

