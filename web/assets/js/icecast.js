//direcciones
irc="http://irc.hackcoop.com.ar";
host=window.location.host;


function CrearChat (id){
        // pone le iframe que tiene el chat
        var chat
        $(".chat").each(function(index) {
                if ($(this).html().indexOf(id) > -1) chat = $(this);
        });                    
        canal = id.replace("/","").replace(".ogg","");
        if (chat.html().indexOf("iframe") == -1) {
                chat.html( chat.html() + '<br /><iframe src="' + irc + '/?channels=' + canal + '" style="border:0; background: none; scroll: none; width: 100%; height: 350px;" ></iframe>');
        } else {
                chat.html('<div style="display: none;">'+id+'</div>');
        }     
}

function Comentario (id) {
        var name=prompt("Deja tu comentario","comentario ...");
}


//----------------------------------------
$(document).ready(function() {
         $(".fancybox").fancybox({
                maxWidth        : 800,
                maxHeight       : 600,
                fitToView       : false,
                width           : '70%',
                height          : '80%',
                autoSize        : false,
                closeClick      : false,
                openEffect      : 'none',
                closeEffect     : 'none'
        });

        $(".popup").fancybox({
                maxWidth        : 500,
                maxHeight       : 400,
                fitToView       : false,
                width           : '50%',
                height          : '50%',
                autoSize        : false,
                closeClick      : false,
                openEffect      : 'none',
                closeEffect     : 'none'
        });

        $(".span5 ol").each(function(index) {
                        loadfile($(this).text(), "js");
        });

});

//------------------ Mediateca --------------------

//-------------------- leer JS --------------------

function loadfile(filename, filetype){
        
        // repara la URL
        filename = filename.replace(".ogg", "").replace("/","");
        filename = "http://archive.org/advancedsearch.php?q="+filename+"&output=json&callback=callback&rows=100";

        if (filetype=="js"){
                var fileref=document.createElement('script') ;
                fileref.setAttribute("type","text/javascript") ;
                fileref.setAttribute("src", filename) ;
        } else if (filetype=="css"){
                var fileref=document.createElement("link");
                fileref.setAttribute("rel", "stylesheet") ;
                fileref.setAttribute("type", "text/css") ;
                fileref.setAttribute("href", filename);
        } if (typeof fileref!="undefined") document.getElementsByTagName("head")[0].appendChild(fileref);

}
 
function callback (id) {


    // http://archive.org/help/example.js
    // http://archive.org/details/FrankenberryCountChoculaTevevisionCommercial1971&output=json&callback=IAE.favorite


    // Articulos recomendados

    str ="<ol>";
    for (var hit,i=0; hit=id.response.docs[i]; i++) {
        //------------
      var mt = typeof(hit.mediatype)=='undefined' ? '' : hit.mediatype;
      var collex = typeof(hit.collection)=='undefined' ? '' : hit.collection;
      var img = (mt.toLowerCase()=='movies'  ||  mt.toLowerCase()=='movingimage' ?
                 'movies' : (mt.toLowerCase()=='audio'  ||  mt.toLowerCase()=='sound'
                 ||  mt.toLowerCase()=='etree'  ? 'audio' : (mt.toLowerCase()=='texts' ? 'text' : '')));

        //------------
      //str += '<li><a href="http://archive.org/details/' + hit.identifier+'"  >';
      str += '<li><a href="archive.org.xsl#' + hit.identifier+'" >';
      if (img) str += '<img src="http://archive.org/images/mediatype_'+img+'.gif"/>';
      str +=  hit.title;
      str += '</a></li>';
    }
    str +="</ol>";

    // palabra clave buscada
    canal = id.responseHeader.params.qin.replace(/\ .*/, '').replace(' ','');
    if (id.response.docs.length == 0) loadfile(canal + "%20OR%20Tex%20Avery","js");
                                                // canal recomendado
       
    $(".span5 ol").each(function(index) {
               if ($(this).html().indexOf(canal) > -1) {
                        archivo = $(this).html(str);
                } 
    });


}

// buscar
function buscar (texto, tipo) {
        location.href = '/archive.org.xsl?q=' + texto + ' AND mediatype:' + tipo;
}

