<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<rss version="2.0">
<channel>
 <title>Juan Carlos Radio</title>
 <description>Transmisiones en vivo</description>
 <link>http://fm.hackcoop.com.ar</link>
<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">
 <item>
  <title><xsl:if test="server_name"><xsl:value-of select="server_name" /></xsl:if></title>
  <description><xsl:if test="server_description"><xsl:value-of select="server_description" /></xsl:if></description>
  <link><xsl:if test="server_url"><xsl:value-of select="server_url" /></xsl:if></link>
 </item>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</channel>
</rss>
</xsl:template>
</xsl:stylesheet>
