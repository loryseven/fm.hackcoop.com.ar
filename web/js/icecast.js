//direcciones
irc=":8337";
icecast=window.location.port;
host=window.location.host.replace(":"+icecast, "");

function CrearChat (id){
        // pone le iframe que tiene el chat
        var chat
        $(".chat").each(function(index) {
                if ($(this).html().indexOf(id) > -1) chat = $(this);
        });                    
        canal = id.replace("/","").replace(".ogg","");
        if (chat.html().indexOf("iframe") == -1) {
                chat.html( chat.html() + '<br /><iframe src="http://' + host + irc + '/?channels=' + canal + '" style="border:0; background: none; scroll: none; width: 100%; height: 350px;" ></iframe>');
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

        $(".donaciones").fancybox({
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
});

//------------------ Mediateca --------------------

//-------------------- leer JS --------------------

function loadfile(filename, filetype){

        filename = "http://archive.org/advancedsearch.php?q="+filename+"&output=json&callback=callback";
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

    id = id.responseHeader.params.qin;    // palabra clave buscada
    $(".span5 ol").each(function(index) {
               if ($(this).html().indexOf(id) > -1) {
                        archivo = $(this).html(str);
                } 
    });


}