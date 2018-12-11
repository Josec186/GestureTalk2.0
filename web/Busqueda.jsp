<%-- 
    Document   : Busqueda
    Created on : 20/11/2017, 10:09:54 PM
    Author     : erick
--%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Búsqueda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Estilos/styleBusqueda.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <!--        <script src="JavaScripCodes/PrincipalFunciones.js"  type="text/javascript"></script>-->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
        <script src="JavaScripCodes/scripts.js"  type="text/javascript"></script>
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
    </head>
    <body>
        <%
            /*Query donde sacamos todas las palabras y las ponemos en un array*/
            ArrayList<String> palabra = new ArrayList();

            String consulta = "SELECT palabra FROM expresion;";
            objConn.Consultar(consulta);
            do {
                palabra.add(objConn.rs.getString(1));
                //num.add(objConn.rs.getInt("id_nivel"));
            } while (objConn.rs.next());

            // out.println("<span id='letras' class='titulo-pequeno' style='color:black;'>" + palabra + "</span>");        

        %> 

        <script>
            var exp = [];
            <% for (int i = 0; i < palabra.size(); i++) {%>
            exp.push("<%= palabra.get(i)%>");
            <% } %>



            var ajax;
            var vid;
            function funcionCallback() {
                //Comprobamos si la peticion se ha completado (estado 4)
                if (ajax.readyState == 4) {
                    //Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
                    if (ajax.status == 200) {
                        //Escribimos el resultado en la pagina HTML mediante DHTML                        
                        var respuesta = ajax.responseText.trim();
                        console.log(respuesta);
                        if (respuesta == "no") {
                            document.getElementById("palabra").innerHTML = "NO SE ENCONTRÓ LA PALABRA";
                            document.getElementById("descripcion").innerHTML = "";
                            document.getElementById("imagen").src = "";
                            //document.getElementById('info-consulta').style.display = 'none';
                        } else {
                            var datos = respuesta.split(",");
                            console.log(respuesta);
                            // letra + "," + javax.xml.bind.DatatypeConverter.printBase64Binary(img64)
                            $(".videoshow").show();
                            document.getElementById("palabra").innerHTML = datos[0];
                            vid = datos[1];
                            document.getElementById("descripcion").innerHTML = datos[2];
                            
                            var videoID = 'videoclip';
                            var sourceID = 'mp4video';
                            var newmp4;
                            var str1 = 'Imagenes/videos/';
                            newmp4 = str1.concat(vid,'.mp4' );
                            console.log(newmp4)
                            
                            $('#'+videoID).get(0).pause();
                           $('#'+sourceID).attr('src', newmp4);
                           $('#'+videoID).get(0).load();
                            //$('#'+videoID).attr('poster', newposter); //Change video poster
                           $('#'+videoID).get(0).play();
                            

                        }
                    }
                }
            }


            function realizaBusqueda() {
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
                //document.getElementById('descripcion').innerHTML= document.getElementById('letra').value;
                ajax.open("GET", "AJAXDiccionario.jsp?letra=" + $('#letra').val(), true);
                ajax.send(null);
            }

            function enter() {
                $("#letra").on('keyup', function (e) {
                    if (e.keyCode == 13) {
                        realizaBusqueda();
                    }
                });
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

            <div class="fondoapp pgebusqueda">
                <div class="wrap">





                    <div id="btnsbusqueda" >
                        <div class="btnoragne" id="btnshowqucksrch">
                            <h2 class="parrafo-normal">
                                Búsqueda Rápida
                            </h2>
                        </div>
                        <div class="btnoragne" id="btnshowallwrds">
                            <h2 class="parrafo-normal">
                                Diccionario completo
                            </h2>
                        </div>
                    </div>  
                            

                    <div id="busquedadicc">
                        <div id="busquedaquck">
                            <span class="colorblue">Buscar Palabra</span>
<!--                            <div id="buscadordic">
                                <input class="bordes inptbuscador" type="text" size="50" name="letra" id="letra" onkeypress="enter()" placeholder="Búsqueda">
                                <a href="javascript:void(0)" id="lupa">
                                    <img src="Imagenes/busqueda/lupa.png" class="img-resp" onclick="realizaBusqueda()">
                                </a>
                                
                            </div>-->

                                <form autocomplete="off" id="buscadordic" >
                                    <div class="autocomplete">
                                        <input class="bordes inptbuscador" type="text" size="50" name="letra" id="letra" onkeypress="enter()" placeholder="Búsqueda" >
                                    </div>
                                    <a href="javascript:void(0)" id="lupa">
                                        <img src="Imagenes/busqueda/lupa.png" class="img-resp" onclick="realizaBusqueda()">
                                    </a>
                                </form>
                        </div>

                        <div id="busquedaall">
                            <span class="colorblue">Busqueda avanzada </span>
                            <div id="buscadordic">

                            </div>
                        </div>


                        <div id="videodiccionario">                    
                            <div class="videoshow">
                                <!--                                <img  class="img-responsive" src="" width="400px" height="400px" id="imagen">                                                                 -->
                                <video id="videoclip" autoplay loop muted>
                                    <source id="mp4video" src="Imagenes/Ejercicios/Test.mp4" type="video/mp4">
                                </video>
                            </div> 

                            <div class="diccionario textos">
                                <span class="titulo-grande diccionario" id="palabra"></span>
                                <span class="titulo-mediano diccionario" id="descripcion"></span>                            
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
 <script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}


autocomplete(document.getElementById("letra"), exp);
</script>
        </body>
    </html>
