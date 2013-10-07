<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<html lang="es">
<head>
        <meta charset="utf-8" />
        <title>MerdaLab - Comentarios</title>
        <meta name="description" content="Multimedia, video y audio" />
        <meta name="author" content="Ernesto Bazzano (c) HackLab de Barracas" />
        <link rel="stylesheet" type="text/css" href="assets/css/site.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/prettify.css" />
        <script src="assets/js/jquery-1.7.1.min.js"></script>

</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" >

<form action="http://archive.org/write-review.php" method="post" style="text-align: center;" >

        <div class="input-prepend" >
                <input type="text" name="field_reviewtitle" value="titulo" size="45" />
        </div>
        <div class="input-prepend" >
                <textarea name="field_reviewbody" rows="10" cols="50">Comentario</textarea>
        </div>

        <div class="rating">
                <input type="radio" name="field_stars" value="0" />
                <input type="radio" name="field_stars" value="1" />
                <input type="radio" name="field_stars" value="2" />
                <input type="radio" name="field_stars" value="3" />
                <input type="radio" name="field_stars" value="4" />
                <input type="radio" name="field_stars" value="5" />
        </div>
        <input type="hidden" name="identifier" value=""/>
        <input type="submit" name="submit" value="Submit"/>
</form>
<script>
        // completa el identifier (ID del archivo)
        $("#identifier").val(location.hash.replace("#",""));
</script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
