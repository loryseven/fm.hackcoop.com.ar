<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>Juan Carlos Radio - Transmisiones</title>
    <meta name="description" content="Multimedia, video y audio" />
    <meta name="author" content="Ernesto Bazzano (c) HackLab de Barracas" />

    <link rel="icon" href="icecast.png" />
    <link href="https://archive.org/advancedsearch.php?q=juan%2Bcarlos%2Bradio&fl[]=identifier&sort[]=&sort[]=&sort[]=&rows=50&page=1&callback=callback&output=rss" rel="alternate" title="ATOM" type="application/atom+xml" />
<!--css-->
    <link rel="stylesheet" type="text/css" href="assets/css/site.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/prettify.css" />
    <link rel="stylesheet" href="assets/js/fancybox/source/jquery.fancybox.css?v=2.1.0" type="text/css" />
<!--javascript-->
    <script type="text/javascript" src="assets/js/jquery-1.7.1.min.js"></script>
<!--style-->
	<style>
	video, .mv-player {
	        background: url(assets/img/poster/404.png);
	}
	</style>

</head>


<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<!--for navigation-->
<div id="overview"></div>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <h3><a class="brand" href="status.xsl"><i class="icon-cloud"></i> Juan Carlos Radio</a></h3>
      <ul class="nav pull-right">
        <li><a class="nav" href="admin/">Administración <i class="icon-cogs"></i></a></li>
      </ul>
    </div>
  </div>
</div>

<!--end index header menu -->
<!--mount point stats-->

<div class="container" id="contenido">

<!-- Invita -->
<div class="alert alert-info">
<div class="row">
        <div class="span10">
  <h3>¡Contale a tus amigos!</h3>
  Ayudanos a difundir nuestros eventos por correo electrónico
  <a href="http://hackcoop.com.ar/listas/invita.html" class="popup fancybox fancybox.iframe btn btn-mini" ><i class="icon-comment"></i> invitalos </a>
	</div>
        <div class="span1">
                <a href="http://wiki.hackcoop.com.ar/Donaciones" class="popup fancybox.ajax btn btn-success btn-large" >
                        <i class="icon-heart"></i> Donación
                </a>
	</div>
</div>
</div>

           <form method="get" action="archive.org.xsl" >
                <div class="input-prepend pull-right">
                        <span class="add-on"><i class="icon-search"></i></span>
                        <input class="span2" type="search" name="q" id="q" placeholder="Buscar" />
               </div>
           </form>
<br />
<br />

<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">



<!-- popup compartir -->

		<div id="compartir{@mount}" style="display: none; width:500px;">
			<h2>enlace: http://fm.hackcoop.com.ar/#{@mount}</h2>
		</div>

<!-- contenido -->

<div class="well">

<h1>
        <!-- nombre -->
        <xsl:if test="server_name">
                <xsl:value-of select="server_name" />
        </xsl:if>

        <xsl:choose>
                <xsl:when test="authenticator">
                        <a class="auth icon-wrench" href="/auth.xsl"></a>
                </xsl:when>
        </xsl:choose>

        <!-- oyentes -->
        <div class="pull-right">
                <i class="icon-headphones"> </i> <xsl:if test="listeners"><xsl:value-of select="listeners" /></xsl:if> / <xsl:if test="listener_peak"><xsl:value-of select="listener_peak" /></xsl:if>
        </div>

</h1>      
<h4>
        <xsl:if test="server_url">
                <a target="_blank" href="{server_url}"><xsl:value-of select="server_url" /></a>
        </xsl:if>
</h4>
<div class="row">
        <div class="span6">
                <!-- http://www.w3schools.com/html5/html5_ref_eventattributes.asp -->
                <!-- el evento onoffline levanta la recepcion si se cae -->
		<div class="videoUiWrapper thumbnail" >
				<video src="{@mount}" controls="controls" width="400" height="300" autobuffer="autobuffer" type="application/ogg" poster="assets/img/poster{@mount}.png"></video>
		</div>
           <div class="icons btn-group" style="font-size: 16px;" >
                <!-- chat y sociales -->


                <a href="#" class="btn btn-link" onclick="CrearChat('{@mount}'); return false;" >
                        <i class="icon-comments-alt"></i> Chat
                </a>
<!--
                <a href="#" class="btn" onclick="Comentario('{@mount}'); return false;">
                        <i class="icon-pencil"></i> Comentario
                </a>
-->
                <a href="#{@mount}" class="btn btn-link" onclick="alert(window.location.href+'#{@mount}');" >
                        <i class="icon-group"></i> Compartir
                </a>
           </div>     
        </div>
        <div class="span5">
        <h3>
                <xsl:if test="server_description">
                        <xsl:value-of select="server_description" />
                </xsl:if>
                - 
                <xsl:if test="genre">
                        <xsl:value-of select="genre" />
                </xsl:if>
        </h3>
           <ul class="icons">
              <xsl:if test="artist">
                  <li class="icon-asterisk">
                        <!-- tema -->
                        <xsl:value-of select="artist" /> - <xsl:value-of select="title" />
                  </li>
              </xsl:if>
                <li>
                <!-- calidad -->
                <ul class="icons"> 
                   <xsl:if test="video_quality">
                        <li><i class="icon-facetime-video"></i> <xsl:value-of select="video_quality" /> kbps</li>
                        <li><i class="icon-fullscreen"></i> <xsl:if test="frame_size"><xsl:value-of select="frame_size" /></xsl:if></li>
                        <li><i class="icon-film"></i> <xsl:if test="frame_rate"><xsl:value-of select="frame_rate" /></xsl:if> fotogramas</li>
                   </xsl:if>
                   <xsl:if test="quality"><li><i class="icon-film"></i> <xsl:value-of select="quality" /></li></xsl:if>
                   <xsl:if test="bitrate"><li><i class="icon-signal"></i> <xsl:value-of select="bitrate" /> kbps</li></xsl:if>
                </ul>
                </li>
           </ul>
                <div style="overflow-y:auto; height:190px; margin: 16px; border:0;" border="0" >
                        <h3>Archivo</h3>
                        <ol>
                                <xsl:value-of select="@mount" />
                        </ol>
                </div>
        </div>
</div>
        <div class="chat">
                <div style="display: none;">
                        <xsl:value-of select="@mount" />
                </div>
        </div>
        <div class="pull-right">
                <!-- tiempo -->
                <xsl:if test="stream_start">
                        <i class="icon-calendar"></i> <xsl:value-of select="stream_start" />
                </xsl:if>
        </div>
        <br />
</div>


<!-- /contenio -->

</xsl:when>
        <xsl:otherwise>
               <h3><i class="icon-beaker" ></i><xsl:value-of select="@mount" /> - No conectado</h3>
        </xsl:otherwise>
</xsl:choose>
</xsl:for-each>
<xsl:text disable-output-escaping="yes"></xsl:text>

           <form method="get" action="archive.org.xsl" >
                <div class="input-prepend pull-right">
                        <span class="add-on"><i class="icon-search"></i></span>
                        <input class="span2" type="search" name="q" id="q" placeholder="Buscar" />
               </div>
           </form>
<footer>
        <div class="row">
                <div class="span8">
                        <h3>Juan Carlos Radio</h3>
                        <p>
                        Es un conjunto de programas y configuraciones para <b>GNU</b> <br />
			dedicados a la trasmisión de audio y video en linea.
                        </p>
			<p>
			Para más seguridad e intimidad podes usar nuestro <a href="http://3vxmucb43bs4lert.onion">servicio oculto</a>
			</p>
			<p>
			Esta es su versión de <a href="https://github.com/b4zz4/fm.hackcoop.com.ar"><xsl:value-of select="server_id" /></a>
			</p>
                </div>
                <div class="span4">
                        <h3>Versión 0.1.2</h3>
                           <ul class="icons">
                                <li><i class="icon-envelope"></i><a href="http://listas.hackcoop.com.ar/listinfo/jcr">Lista de correos</a></li>  
                                <li><i class="icon-file"></i> <a href="http://juancarlosradio.hackcoop.com.ar/">Documentación</a></li>
                                <li><i class="icon-hdd"></i> <a href="https://archive.org">Web Archive</a></li>
                           </ul>
                </div>

        </div>
</footer>
<!--[if IE ]>
	<script type="text/javascript" src="assets/js/kaltura.js"></script>
<![endif]-->
</div>

<!--javascript luego de la carga-->

	<script type="text/javascript" src="assets/js/icecast.js"></script>
	<script type="text/javascript" >
		video = [];
	</script>

	<!-- Add fancyBox -->
	<script type="text/javascript" src="assets/js/fancybox/source/jquery.fancybox.pack.js?v=2.1.0"></script>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
