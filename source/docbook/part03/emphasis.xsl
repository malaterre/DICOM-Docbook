<?xml version="1.0" encoding="utf-8"?>
<!--
Most IOD Tables in part03 have a trailing \n as last char before the end element </emphasis>, remove it:
-->
<xsl:stylesheet xmlns:dk="http://docbook.org/ns/docbook" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="dk">
  <xsl:output method="xml" omit-xml-declaration="no" indent="no"/>
<!--
  <xsl:template match="dk:tr/dk:td/dk:para/dk:emphasis[substring(replace(.,'\s+$',''), string-length()) = '&#10;']">
-->
  <xsl:template match="dk:tr/dk:td/dk:para/dk:emphasis[substring(., string-length()) = '&#10;']">
    <xsl:element name="{name()}" namespace="http://docbook.org/ns/docbook">
      <xsl:copy-of select="@*"/>
      <xsl:for-each select="child::node()">
        <xsl:choose>
          <xsl:when test="position() != last()">
            <xsl:copy>
              <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(substring(., 1, string-length(.) - 1))"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
