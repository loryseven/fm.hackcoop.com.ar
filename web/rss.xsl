<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
<xsl:output omit-xml-declaration="no" method="html" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" encoding="UTF-8" />
<xsl:template match = "/icestats" >
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>
    <title>Juan Carlos Radio</title>
    <description>Transmisiones en vivo</description>
    <link>http://fm.hackcoop.com.ar</link>
 <lastBuildDate>Mon, 06 Sep 2010 00:01:00 +0000 </lastBuildDate>
 <pubDate>Sun, 06 Sep 2009 16:20:00 +0000</pubDate>
 <ttl>1800</ttl>
<xsl:for-each select="source">
<xsl:choose>
<xsl:when test="listeners">
 <item>
  <title><xsl:if test="server_name"><xsl:value-of select="server_name" /></xsl:if></title>
  <description><xsl:if test="server_description"><xsl:value-of select="server_description" /></xsl:if></description>
  <link><xsl:if test="server_url"><xsl:value-of select="server_url" /></xsl:if></link>
  <guid>7bd204c6-1655-4c27-aeee-53f933c5395f</guid>
  <pubDate>Sun, 06 Sep 2009 16:20:00 +0000</pubDate>
 </item>
</xsl:when>
</xsl:choose>
</xsl:for-each>
<xsl:text disable-output-escaping="yes"></xsl:text>
</channel>
</rss>
</xsl:template>
</xsl:stylesheet>
