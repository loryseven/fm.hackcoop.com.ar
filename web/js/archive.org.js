var fileref=document.createElement('script');

id = location.hash.replace("#","");

fileref.setAttribute("type","text/javascript");
fileref.setAttribute("src", 'http://archive.org/details/'+ id +'&output=json&callback=detalles', "js");


document.getElementsByTagName("head")[0].appendChild(fileref);


function detalles (data) {

    $("#tipo").remove();

    var pid = data.metadata.identifier;
    var id = data;
    var ogg = false;
    var poster = 'http://archive.org/download/'+pid+'/format=Animated+Gif';

    $("#titulo").html(""+id.metadata.title);   
    $("#descripcion").html(""+id.metadata.description);
    
    var formats = {};
    for (var filename in id.files) {
	var file = id.files[filename];
	var format = ""+file.format;
	if (!( format == "Video Index" || format == "Thumbnail" || format == "Metadata") && typeof(file.format)!='undefined') formats[file.format] = format;
    }

    str = '<ul class="icons">';
    for (var format in formats) {
		    str += '<li><i class="icon-folder-close"></i>'+format+'<ul class="icons">';
		    for (var filename in id.files) {
				var file = id.files[filename];
				if (file.format == format) {
					  nombre = filename.replace("/","").replace(/_/gi, " ");
					  url = 'http://archive.org/download/'+pid+'/'+filename;
					  str += '<li><i class="icon-play-circle"></i><a href="'+url+"\" onclick=\"ver('"+url+"', ''); return false;\" >"+nombre+'</a></li>';
					  if ( format.indexOf("Ogg") > -1 && !ogg) ogg = url;
				} 
		    }
		    str += "</ul></li>";
    }
    str += '</ul>';

    $("#archivos").html(""+str);
    //$("#video").html('<iframe src="http://archive.org/embed/'+pid+'" width="400" height="300" frameborder="0"></iframe>');
    ver(ogg, poster);
}

function ver (ogg, poster) {
    if (!ogg) return;
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
