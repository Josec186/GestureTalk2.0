/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
// ---------------------PAGINA CONFIGURACION-----------------------
    
    $("#chgavatar").click(function(){
        if($("#cambio-nombre").is(":visible") || $("#conf-pass").is(":visible")){
            $("#cambio-nombre").hide(500);
            $("#conf-pass").hide(500);
        }
        if($("#select-avatar").is(":hidden")){
             $(".wrap.pgconf").css({
                "justify-content": "space-between"
             });
             $("#select-avatar").toggle(500);
        }else{      
            setTimeout(function (){
                $(".wrap.pgconf").css({
                    "justify-content": "center"
                });
            }, 500);
             $("#select-avatar").toggle(500);
        }
    });
   
    $("#chgname").click(function(){
        if($("#select-avatar").is(":visible") || $("#conf-pass").is(":visible")){
            $("#select-avatar").hide(500);
            $("#conf-pass").hide(500);
        }
        if($("#cambio-nombre").is(":hidden")){
             $(".wrap.pgconf").css({
                "justify-content": "space-between"
             });
             $("#cambio-nombre").toggle(500);
        }else{      
            setTimeout(function (){
                $(".wrap.pgconf").css({
                    "justify-content": "center"
                });
            }, 500);
             $("#cambio-nombre").toggle(500);
        } 
    });
    
    $("#chgpassw").click(function(){
        if($("#select-avatar").is(":visible") || $("#cambio-nombre").is(":visible")){
            $("#select-avatar").hide(500);
            $("#cambio-nombre").hide(500);
        }
        if($("#conf-pass").is(":hidden")){
             $(".wrap.pgconf").css({
                "justify-content": "space-between"
             });
             $("#conf-pass").toggle(500);
        }else{      
            setTimeout(function (){
                $(".wrap.pgconf").css({
                    "justify-content": "center"
                });
            }, 500);
             $("#conf-pass").toggle(500);
        }
    });
    
    
    // ---------------------PAGINA DICCIONARIO-----------------------
//        $(".videoshow").css({"display": "none"});
          $(".videoshow").hide();
    
        $("#btnshowqucksrch").click(function(){
            if($("#busquedaall").is(":visible")){
                $("#busquedaall").hide(500);
                $("#btnshowallwrds").css({"background-color": "#FAB550"}, 500);
            }
            $("#busquedaquck").show(500);
            $("#btnshowqucksrch").css({"background-color": "#455879"}, 500);

        });
        
        $("#btnshowallwrds").click(function(){
            if($("#busquedaquck").is(":visible")){
                $("#busquedaquck").hide(500);
                $("#btnshowqucksrch").css({"background-color": "#FAB550"}, 500);
            }
            $("#busquedaall").show(500);  
            $("#btnshowallwrds").css({"background-color": "#455879"}, 500);

        });
       
       
});
