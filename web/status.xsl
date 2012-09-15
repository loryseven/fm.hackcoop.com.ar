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
        <link rel="stylesheet" href="js/fancybox/source/jquery.fancybox.css?v=2.1.0" type="text/css" />

<script src="assets/js/jquery-1.7.1.min.js"></script>

<!--
<script src="assets/js/underscore.min.js"></script>
<script src="assets/js/backbone.min.js"></script>
<script src="assets/js/prettify.min.js"></script>
-->

<script type="text/javascript" src="js/icecast.js"></script>

<!-- Add fancyBox -->
<script type="text/javascript" src="js/fancybox/source/jquery.fancybox.pack.js?v=2.1.0"></script>


<!--[if IE ]>
<script type="text/javascript" src="js/kaltura.js"></script>
<![endif]-->


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
                <div class="input-prepend pull-right">
                        <span class="add-on"><i class="icon-search"></i></span>
                        <input class="span2" type="search" name="q" id="q" placeholder="Buscar" />
               </div>
           </form>
<br />

<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">

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
                <video src="{@mount}" controls="controls" width="400" height="300" type="application/ogg" poster="poster{@mount}.png" ></video>
           <div class="icons btn-group pull-center" style="font-size: 16px" >
                <!-- chat y sociales -->


                <a href="http://localhost:8337/?channels={@mount}" class="btn" onclick="CrearChat('{@mount}'); return false;" >
                        <i class="icon-comments-alt"></i> Chat
                </a>
                <a href="#" class="btn" onclick="Comentario('{@mount}'); return false;">
                        <i class="icon-pencil"></i> Comentario
                </a>
                <a href="embebido.xsl" class="donaciones fancybox.ajax btn" >
                        <i class="icon-signin"></i> Embebido
                </a>
                <a href="donaciones.xsl#{@mount}" class="donaciones fancybox.ajax btn" >
                        <i class="icon-heart"></i> Donación
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
                        <script type="text/javascript">
                                 loadfile("libertatia", "js");
                        </script>
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
                        Es un sistema operativo <b>GNU/Linux</b> y/o un conjunto de programas 
                        <br />y configuraciones dedicados a la trasmisión de audio y video en linea.
                        </p>
                           <ul class="icons">
                                <li><i class="icon-envelope"></i><a href="http://listas.hackcoop.com.ar/listinfo/jcr">Lista de correos</a></li>  
                                <li><i class="icon-file"></i> <a href="http://lab.hackcoop.com.ar/projects/juan-carlos-radio/">Documentación</a></li>
                                <li><i class="icon-bullhorn"></i> <a href="http://lab.hackcoop.com.ar/projects/juan-carlos-radio/news.atom">Noticias</a></li>
                                <li><i class="icon-briefcase"></i> <a href="http://git.hackcoop.com.ar/juan_carlos_radio.git/">Desarrollo</a></li>
                           
                           </ul>
                </div>
                <div class="span4">
                        <h3>Versión 0.1</h3>
                           <ul class="icons">
                                <li><i class="icon-info-sign"></i> <a href="http://www.icecast.org/docs/icecast-trunk/"><xsl:value-of select="server_id" /></a></li>
                                <li><i class="icon-globe" ></i> <xsl:value-of select="location" /></li>
                                <li><i class="icon-envelope"></i> <xsl:value-of select="admin" /></li>
                                <li><i class="icon-hdd"></i> <a href="http://archive.org">Web Archive</a></li>
                           </ul>
                </div>

        </div>
</footer>
</div>


</body>
</html>
</xsl:template>
</xsl:stylesheet>
