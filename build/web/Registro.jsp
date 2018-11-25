<%-- 
    Document   : Registro
    Created on : 12/11/2017, 06:56:19 PM
    Author     : erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link href="Estilos/styleRegistro.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
        <%--<script src="JavaScripCodes/FuncionesRegistro.js"  type="text/javascript"></script>--%>
         <script>
            var id_avatar = 1;
            function avatar1() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/1c.png';
                id_avatar = 1;
                document.getElementById('papafranku').value = 1;
            }
            function avatar2() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/2c.png';
                id_avatar = 2;
                document.getElementById('papafranku').value = 2;
            }
            function avatar3() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/3c.png';
                id_avatar = 3;
                document.getElementById('papafranku').value = 3;
            }
            function avatar4() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/4c.png';
                id_avatar = 4;
                document.getElementById('papafranku').value = 4;
            }
            function avatar5() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/5c.png';
                id_avatar = 5;
                document.getElementById('papafranku').value = 5;
            }
            function avatar6() {
                document.getElementById('cambio').src = 'Imagenes/Avatares/Elejido/6c.png';
                id_avatar = 6;
                document.getElementById('papafranku').value = 6;
                $('#papafranku').value = 6;
//                $("input[name='avatar']").value = 6;
            }

            function submit() {
                console.log('Holis');
                document.getElementsByName("error").innerHTML = "Entro";
                //document.getElementById("demo").innerHTML= "Dí click";
                if (document.getElementById('usr').value != "" && document.getElementById('pass').value != "" && document.getElementById('coPass') != "" && document.getElementById('respuesta') != "") {
                    var usr = document.getElementById('usr').value;
                    var pass = document.getElementById('pass').value;
                    var confpass = document.getElementById('coPass').value;
                    console.log(pass, confpass);
                    var e = document.getElementById("pregunta");
                    var pregunta = e.options[e.selectedIndex].value;
                    var respuesta = document.getElementById('respuesta').value;
                    if (pass == confpass) {
//                        location.href = "altaUsuario.jsp?usr=" + usr + "&pass=" + pass + "&pregunta=" + pregunta + "&respuesta=" + respuesta + "&avatar=" + id_avatar;
                        return true;
                    } else {
                        document.getElementById("error").innerHTML = "Las contraseñas no coinciden";
                    }
                } else {
                    document.getElementById("error").innerHTML = "Hay camposo vacíos";
                }
                console.log(isOk);
                return false;
            }
            
            function clearBox(elementID) {
                document.getElementById(elementID).innerHTML = "";
            }
        </script>
    </head>
    <body onresize="myFunction()" onchange="MinImage()" class="fondoPrincipal">
        <audio  preload="auto"> 
            <source src="Sonidos/click.mp3" controls></source>
            <source src="Sonidos/click.ogg" controls></source>
            Your browser isn't invited for super fun audio time.
        </audio>

        <!--        <form action="altaUsuario.jsp" method="POST">
                    
                </form>-->
        <div  id="whtcube-2">
            <a href="Principal.jsp">
                <i class="fa fa-arrow-left ltarrow" aria-hidden="true"></i>
            </a>
            <form name="formalta" action="altaUsuario.jsp" onsubmit="return submit()" method="POST" >
                <div class="col-sm-12" id="reg">
                    <div class="col-sm-5">
                        <div class="col-sm-12" id="frmreg">      
                            <div class="row" style="text-align: center;"><span class="letras">Usuario</span></div>
                            <div class="row"><input type="text" class="bordes" name="usr" id="usr" maxlength="10" required></div>  
                            <div class="row" style="text-align: center;"><span class="letras">Contraseña</span></div>
                            <div class="row"><input type="password" class="bordes" name="pass" id="pass" required></div>   
                            <div class="row" style="text-align: center;"><span class="letras">Confirmar contraseña</span></div>
                            <div class="row"><input type="password" class="bordes" name="coPass" id="coPass" required></div>   
                            <div class="row" style="text-align: center;"><span class="letras">Pregunta de seguridad</span></div>
                            <div class="row">
                                <select class="bor" id="pregunta" name="pregunta"> <!--Supplement an id here instead of using 'name'-->
                                    <option value="1">¿Cuál es el nombre de tu primer mascota?</option> 
                                    <option value="2">¿En que ciudad naciste?</option>
                                    <option value="3">¿Cuál es el nombre de tu madre?</option>
                                    <option value="4" selected>¿Cuál es tu comida favorita?</option>
                                </select>
                            </div>   
                            <div class="row" style="text-align: center;"><span class="letras">Respuesta</span></div>
                            <div class="row"><input type="text" class="bordes" name="respuesta" id="respuesta" required></div>  
                        </div>
                    </div>                  
                    <div class="col-sm-6">
                        <div class="col-sm-12" id="regfotos">                             
                            <div class="imgpre">
                                <div class="col-sm-12"><label><img class="img-responsive" id="cambio" src="Imagenes/Avatares/Elejido/1c.png" width="200px;" height="200px" ></label></div>                                
                            </div>
                            <div class="row" style="text-align: center;"><span class="letras">Elige tu avatar</span></div>
                            <div class="imgoptions" id="imgBorder">
                                <img class="imgpre" onclick="avatar1();" id="marco1" src="Imagenes/Avatares/Elije/1.jpg" >
                                <img class="imgpre" onclick="avatar2();" id="marco2" src="Imagenes/Avatares/Elije/2.jpg">
                                <img class="imgpre" onclick="avatar3();" id="marco3" src="Imagenes/Avatares/Elije/3.jpg">
                                <img class="imgpre" onclick="avatar4();" id="marco4" src="Imagenes/Avatares/Elije/4.jpg">
                                <img class="imgpre" onclick="avatar5();" id="marco5" src="Imagenes/Avatares/Elije/5.jpg" >
                                <img class="imgpre" onclick="avatar6();" id="marco6" src="Imagenes/Avatares/Elije/6.jpg" >
                            </div>                                  
<!--                            <div class="row" id="imgBorder">
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar1();" id="marco1" src="Imagenes/Avatares/Elije/1.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar2();" id="marco2" src="Imagenes/Avatares/Elije/2.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar3();" id="marco3" src="Imagenes/Avatares/Elije/3.jpg" width="100px;" height="100px"></div>
                            </div>
                            <div class="row" id="imgBorder">
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar4();" id="marco4" src="Imagenes/Avatares/Elije/4.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar5();" id="marco5" src="Imagenes/Avatares/Elije/5.jpg" width="100px;" height="100px"></div>
                                <div class="col-sm-4"><img class="img-responsive" onclick="avatar6();" id="marco6" src="Imagenes/Avatares/Elije/6.jpg" width="100px;" height="100px"></div>
                            </div>                                  -->
                            <div class="row" style="text-align: center;">
                                <span name="demo" class="msgError" id="error"></span>
                                <%if (request.getParameter("error") != null) {

                                        out.println("<span class='text-center msgError' id='errorUser'>" + request.getParameter("error") + "</span>");
                                    }%>
                            </div>

                            <!--                            <div class="row"  id="efecto"><a onmouseover="playclip();" onclick="submit(); clearBox('demo -->
                            <div class="row"  id="efecto" onmouseover="playclip();">
                                <input type="text" hidden value="1" id="papafranku" name="avatar">
                                <input type="submit" value="Registrate" class="parrafo-normal btnoragne">       
                            </div>


                            <!--                                    <img class="img-responsive" width="100%" id="ImgData" src="Imagenes/Registro/btnRegistrarse.png" onclick="clearBox('error'); submit();"></a>-->
                            <!--                                <input type="image" src="Imagenes/Registro/btnRegistrarse.png" alt="Submit Form" />-->


                        </div>

                    </div>
                </div>
            </form>

        </div>


    </body>
</html>
