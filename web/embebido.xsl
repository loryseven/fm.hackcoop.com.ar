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

<h3>Embebido HTML</h3>
<p> Codigos para embeber este canal</p>

<h4>Transmisión simple</h4>

<pre class="prettyprint linenums" style="font-size: 11px;">
[script src="http://html5.kaltura.org/js"][/script]
[video src="http://direccion/audio.ogg" controls autobuffer poster="..." ][/video] 
</pre>

<h4>Iframe</h4>

<pre class="prettyprint linenums" style="font-size: 11px;">
[iframe src="direccion.com"][/ifframe]
</pre>

<h4>Con sala de chat</h4>

<pre class="prettyprint linenums" style="font-size: 11px;">
[iframe src="direccion.com/?chat"][/ifframe]
</pre>
<script src="assets/js/jquery-1.7.1.min.js"></script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
