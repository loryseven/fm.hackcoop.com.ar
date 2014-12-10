var fileref=document.createElement('script');

id = location.hash.replace("#","");

fileref.setAttribute("type","text/javascript");
fileref.setAttribute("src", 'http://archive.org/details/'+ id +'&output=json&callback=detalles', "js");

document.getElementsByTagName("head")[0].appendChild(fileref);

function detalles (id) {

    $("#tipo").remove();

    var pid = id.metadata.identifier;
    var ogg = false;
    var poster = 'http://archive.org/download/'+pid+'/format=Animated+Gif';

    // genera e incluye el titulo
    titulo = id.metadata.title
    titulo += "<a href='http://archive.org/download/"+pid+"'><div class='pull-right'><i class='icon-download-alt'></i> "+id.item.downloads+"</a></div>";
    $("#titulo").html(titulo);

    // genera e incluye la descripcion
    descripcion = "" + id.metadata.description;
    if (id.creativecommons) descripcion += "<p style='text-align: right;'><a href='"+ id.creativecommons.license_url+"'><img src='"+id.creativecommons.image_url+"'></a></p>";
  
    $("#descripcion").html(descripcion);

    descripcion = "";

    if (id.metadata.subject) {
        descripcion += "<br /><span style='font-size: 12px;'>";
        etiquetas = id.metadata.subject[0].split(";");
        for (var n in etiquetas) {
         descripcion += "<i class='icon-tags'></i> ";
         descripcion += "<a href='/archive.org.xsl?q=subject:"+ etiquetas[n] +"' >"+etiquetas[n]+"</a> ";
        }
        descripcion += "</span>";
    }
    $(".span6").append(descripcion);



    
    // enlista los formatos
    var formats = {};
    var formats_libre = {};
    var formato_ogg
    for (var filename in id.files) {
	var file = id.files[filename];
	var format = "" + file.format;
       	if (!(format == "Video Index" || format == "Thumbnail" || format == "Metadata") && typeof(file.format) != 'undefined' ) {
               	if (format.indexOf('BitTorrent') > -1) {
                        // guarda formatos libres
                        formats_libre [format] = 1
                } else {
                        if (!formats[format]) formats[format] = 0;
                        formats[format] ++;
               	        if (format.indexOf('Ogg') > -1 || format.indexOf('Theora') > -1) {
                                // guarda formatos libres
                                formato_ogg = format;
                                formats_libre [format] = formats[format];
                        }
                }

        }
    }


    if (formato_ogg) {

        //------Comprueba si todos los archivos estan en OGG--------
        solo_ogg = true;

        // comprueba si existe mas archivos en otros formatos que en OGG
        for (var formato in formats) if (!(formats[formato_ogg] == formats[formato])) solo_ogg = false;
   
        // si existen tantos ogg como otros formatos muestra solo el ogg y el torrent (si existe)
        if (solo_ogg) formats = formats_libre;

    }


    // crea e incluye la lista de archivos
    str = '<ul class="icons">';
    for (var format in formats) {
		    if (formats.length > 1) str += '<li><i class="icon-folder-close"></i>'+format+'<ul class="icons">';
		    for (var filename in id.files) {
				var file = id.files[filename];
				if (file.format == format) {
					  nombre = filename.replace("/","").replace(/_/gi, " ");
					  url = 'http://archive.org/download/'+pid+'/'+filename;
					  str += '<li><i class="icon-play-circle"></i><a href="'+url+"\" onclick=\"ver('"+url+"', ''); return false;\" >"+nombre+'</a></li>';
					  if (format.indexOf("Ogg") > -1 && !ogg) ogg = url;
				} 
		    }
		    if (formats.length > 0) str += "</ul></li>";
    }
    str += '</ul>';
    $("#archivos").html(""+str);
    ver(ogg, poster);
}

function ver (ogg, poster) {
    if (!ogg) {
        if (poster) {
            $("#video").html('<img src="'+poster+'" />');
        }
        return;
    }
    // falta verificar formatos
    $("#video").html('<video src="'+ogg+'" poster="'+poster+'" controls="controls" width="400" height="300" ></video>');
}

if (location.search.indexOf("?q=") == 0) {
        $(".well").html('<i class="icon-refresh"></i> Cargando...');
        loadfile(location.search.replace("?q=",""), "js");
}


function callback (id) {


    // http://archive.org/help/example.js
    // http://archive.org/details/FrankenberryCountChoculaTevevisionCommercial1971&output=json&callback=IAE.favorite

    str ="<div>";
    for (var hit,i=0; hit=id.response.docs[i]; i++) {
	  //------------
	var mt = typeof(hit.mediatype)=='undefined' ? '' : hit.mediatype;
	var collex = typeof(hit.collection)=='undefined' ? '' : hit.collection;
	var img = (mt.toLowerCase()=='movies'  ||  mt.toLowerCase()=='movingimage' ?
		     'movies' : (mt.toLowerCase()=='audio'  ||  mt.toLowerCase()=='sound'
		     ||  mt.toLowerCase()=='etree'  ? 'audio' : (mt.toLowerCase()=='texts' ? 'text' : '')));
	str +="<div class='well'>";
	str += '<h2><a href="archive.org.xsl#' + hit.identifier+'" >';
	if (img) str += '<img src="http://archive.org/images/mediatype_'+img+'.gif"/> ';
	str += hit.title + "</a></h2>";
	str += '<div class="row">';
	str += "<div class='span4' style='text-align: center;' >";
	str += '<img src="http://archive.org/download/'+ hit.identifier  +'/format=Animated+Gif" />';
	str += "</div><div class='span6'>";
	str += '<p>' + hit.description + '</p>';
	str += '</div>';
	str += '</div>';
	str += '</div>';
    }
    str +="</div>";

    // para el buscador        
    $(".well").html(str).removeClass('well');
}


/*
	  falta:
		    - varios reproductores (mpeg,mp3, gif, etc)
		    - descripcion pequeña
		    - poster alternativo cuando no hay ninguno
		    - buscador

*/
