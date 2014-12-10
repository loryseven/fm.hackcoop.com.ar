<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html lang="es">
<head>
        <meta charset="utf-8" />
        <title>MerdaLab - Transmisiones</title>
        <meta name="description" content="Multimedia, video y audio" />
        <meta name="author" content="Ernesto Bazzano (c) HackLab de Barracas" />

        <link href="http://lab.hackcoop.com.ar/projects/juan-carlos-radio/activity.atom?show_wiki_edits=1" rel="alternate" title="ATOM" type="application/atom+xml" />

        <link rel="stylesheet" type="text/css" href="assets/css/site.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/prettify.css" />
        <link rel="stylesheet" href="assets/js/fancybox/source/jquery.fancybox.css?v=2.1.0" type="text/css" />
        <script src="assets/js/jquery-1.7.1.min.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<!--for navigation-->
<div id="overview"></div>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <h3><a class="brand" href="status.xsl"><i class="icon-cloud"></i> MerdaLab</a></h3>
      <ul class="nav pull-right">
        <li><a class="nav" href="admin/">Administración <i class="icon-cogs"></i></a></li>
      </ul>
    </div>
  </div>
</div>

<!--end index header menu -->
<!--mount point stats-->

<div class="container" id="contenido">
           <form method="get" action="archive.org.xsl" >
                        <span class="input-prepend pull-right" id=" tipo" >
                                <a class="add-on icon-facetime-video" onclick="buscar($('#q').val(), 'movies');"></a>
                                <a class="add-on icon-music" onclick="buscar($('#q').val(), 'audio');"></a>
                                <a class="add-on icon-picture" onclick="buscar($('#q').val(), 'images');"></a>
                                <a class="add-on icon-file" onclick="buscar($('#q').val(), 'texts');"></a>
                                <input class="span2" type="search" name="q" id="q" placeholder="Buscar" />
                        </span>
           </form>

<br />
<div class="well">

<h1><div id="titulo"></div></h1>
<div class="row">
        <div class="span6">
                <div id="video"></div>
                <!--                
                        -->
                <div class="icons btn-group pull-center" style="font-size: 16px">
                        <a href="http://{@mount}:8337/?channels=merdalab" class="btn" onclick="CrearChat('merdalab'); return false;"><i class="icon-comments-alt"></i> Chat
                        </a><a href="archive.org_comentario.xsl" class="btn donaciones fancybox.ajax" ><i class="icon-pencil"></i> Comentario
                        </a><a href="embebido.xsl" class="donaciones fancybox.ajax btn"><i class="icon-group"></i> Compartir
                        </a>
                        <a href="donaciones.xsl#merdalab" class="donaciones fancybox.ajax btn"><i class="icon-heart"></i> Donación</a>
                </div>

        </div>
        <div class="span5">
                <h3>Descripción</h3>
                <p>
                        <div id="descripcion"></div>
                </p>
                <div>
                        <h3>Archivos</h3>
                        <div id="archivos"></div>
                </div>
        </div>
</div>
</div>

<footer>
        <div class="row">
                <div class="span8">
                        <h3>Juan Carlos Radio</h3>
                        <p>
                        Es un sistema operativo <b>GNU/Linux</b> y/o un conjunto de programas 
                        y configuraciones dedicados a la trasmisión de audio y video en linea.
                        </p>
                           <ul class="icons">
                                <li><i class="icon-envelope"></i><a href="http://listas.hackcoop.com.ar/listinfo/jcr">Lista de correos</a></li>
                                <li><i class="icon-file"></i> <a href="http://lab.hackcoop.com.ar/projects/juan-carlos-radio/">Documentación</a></li>
                                <li><i class="icon-bullhorn"></i> <a href="http://lab.hackcoop.com.ar/projects/juan-carlos-radio/news.atom">Noticias</a></li>
                                <li><i class="icon-briefcase"></i> <a href="http://git.hackcoop.com.ar/juan_carlos_radio.git/">Desarrollo</a></li>

                           </ul>
                </div>
                <div class="span4">
                        <h3>Versión</h3>
                           <ul class="icons">
                                <li><i class="icon-info-sign"></i> <a href="http://www.icecast.org/docs/icecast-trunk/"><xsl:value-of select="server_id" /></a></li>
                                <li><i class="icon-globe" ></i> <xsl:value-of select="location" /></li>
                                <li><i class="icon-envelope"></i> <xsl:value-of select="admin" /></li>
                           </ul>
                </div>

        </div>


</footer>
</div>
        <script src="assets/js/icecast.js"></script>
        <script src="assets/js/archive.org.js"></script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
