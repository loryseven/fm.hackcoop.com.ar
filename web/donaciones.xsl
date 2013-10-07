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

</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<h3>Donaciones</h3>
<p> Ayudanos a seguir transmitiendo y desarrollar esta y otras aplicaciones</p>

<div class="row">
<div class="span3">

<a href="#" class="btn"><i class="icon-money"></i> PayPal</a> <a href="#" class="btn"><i class="icon-money"></i> DineroMail</a> <a href="#" class="btn"><i class="icon-glass"></i> Una cerveza</a>

</div>
<div class="span2">
        <ul class="icons">                                          
                <li><i class="icon-money"></i><a href="#" ></a>Camisetas</li>
                <li><i class="icon-tags"></i><a href="#" ></a>Etiquetas</li>
                <li><i class="icon-book"></i><a href="#" ></a>Libros</li>
        </ul>
</div>
</div>

<a href="http://www.pledgie.com/campaigns/3283" class="pull-right" >
<img border="0" src="http://www.pledgie.com/campaigns/3283.png?skin_name=chrome" alt="DONACIONES" />
</a>
<script src="assets/js/jquery-1.7.1.min.js"></script>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
