<%-- 
    Document   : Principal
    Created on : 6/11/2017, 09:48:48 PM
    Author     : erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesture Talk</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <script src="JavaScripCodes/PrincipalFunciones.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Ubuntu:400,700" rel="stylesheet">
        <link href="reset.css" rel="stylesheet" type="text/css">
        <link href="styles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="Imagenes\InicioSesion\icon.png">
        
       
        
    </head>
    <body>
        <audio  preload="auto"> 
            <source src="Sonidos/click.mp3" controls></source>
            <source src="Sonidos/click.ogg" controls></source>
            Your browser isn't invited for super fun audio time.
        </audio>  
        <div class="fondoPrincipal">
    		<h1 id="logo">
    			 <a href="Inicio.jsp" alt="Logo GestureTalkMx">
                 </a>
	    	</h1>

	    	<section id="menu_inicio" class="wrap">
	    		<ul>
                            <li>
                               <a href="Iniciar_Sesion.jsp" onmouseover="playclip();">
                                    <div class="btnoragne">
                                        <h2 class="parrafo-normal">
                                            Inicia sesión
                                        </h2>
                                    </div>
                                </a>
                            </li>
                            <li>
                               <a href="Registro.jsp" onmouseover="playclip();">
                                    <div class="btnoragne">
                                        <h2 class="parrafo-normal">
                                            Registrate
                                        </h2>
                                    </div>
                                </a>
                            </li>
                            <li>
                               <a href="#" onmouseover="playclip();">
                                    <div class="btnoragne">
                                        <h2 class="parrafo-normal">
                                            Salir
                                        </h2>
                                    </div>
                                </a>
                            </li>	 
<!--	    			<li>
                                    <a href="demo1.jsp" onmouseover="playclip();">
                                        <img alt="Demo" src="Imagenes/Principal/btnPruebaDemo.png">
                                    </a>
	    				
	    			</li>-->
	    		</ul>
	    	</section>	

    	</div>     
    </body>
</html>