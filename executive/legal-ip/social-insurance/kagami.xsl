<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" indent="yes" />

<xsl:template match="DOC">
			<xsl:apply-templates select="BODY"/>
</xsl:template>

<xsl:template match="BODY">
	<HTML>
	<HEAD>
		<TITLE><xsl:value-of select="TITLE"/></TITLE>
	</HEAD>
	<BODY>
		<P ALIGN="RIGHT"><xsl:value-of select="DOCNO"/></P>
		<xsl:if test="DATE!=''">
			<P ALIGN="RIGHT">
				<xsl:value-of select="substring(DATE&#x2C;1&#x2C;2)"/>
				<xsl:value-of select="format-number(substring(DATE&#x2C;3&#x2C;2)&#x2C;'##')"/>
				<xsl:value-of select="substring(DATE&#x2C;5&#x2C;1)"/>
				<xsl:value-of select="format-number(substring(DATE&#x2C;6&#x2C;2)&#x2C;'##')"/>
				<xsl:value-of select="substring(DATE&#x2C;8&#x2C;1)"/>
				<xsl:value-of select="format-number(substring(DATE&#x2C;9&#x2C;2)&#x2C;'##')"/>
				<xsl:value-of select="substring(DATE&#x2C;11&#x2C;1)"/>
			</P>
		</xsl:if>	
		<xsl:apply-templates select="TO"/>
		<xsl:apply-templates select="AUTHOR"/>

		<P ALIGN="CENTER">
			<xsl:value-of select="TITLE"/>
		</P>

		<xsl:apply-templates select="MAINTXT"/>
		<xsl:apply-templates select="MAINTXT2"/>
		<xsl:apply-templates select="REFERENC"/>

		<xsl:apply-templates select="APPENDIX"/>
		<xsl:apply-templates select="MAINTXT3"/>
	</BODY>
	</HTML>		
</xsl:template>

<xsl:template match="TO" >
	<xsl:if test="AFF!='' and NAME!=''">
		<P>
		<xsl:value-of select="AFF" disable-output-escaping="no"/> 
		</P>
	</xsl:if>
	<xsl:if test="NAME!=''">
		<P>
		<xsl:value-of select="NAME" disable-output-escaping="no"/> 
		<xsl:if test="HONORIFC!='' and NAME!=''">
			<xsl:value-of select="concat('　'&#x2C;HONORIFC)" />
		</xsl:if>
		</P>
	</xsl:if>
</xsl:template>

<xsl:template match="AUTHOR" >
	<P ALIGN="RIGHT">
	<xsl:value-of select="AFF" />
	</P>
	<xsl:if test="NAME!=''">
	<P ALIGN="RIGHT">
		<xsl:value-of select="NAME" />
	</P>
	</xsl:if>
</xsl:template>

<xsl:template match="MT2TITLE">
	<P ALIGN="CENTER">
		<xsl:value-of select="."/>
	</P>
</xsl:template>

<xsl:template match="MT2TEXT">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="P">
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="APPENDIX">
	<xsl:for-each select=".">
		<xsl:apply-templates select="DOCLINK"/>
		<BR/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="DOCLINK">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="@REF" />
		</xsl:attribute>
		<xsl:attribute name="target">_blank</xsl:attribute>
		<xsl:value-of select="../APPTITLE" />
		(
		<xsl:value-of select="@REF" />
		)
	</a>
</xsl:template>

	<xsl:template match="link">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@uri"/>
			</xsl:attribute>
			<xsl:value-of select="."/>
		</a>
	</xsl:template>

</xsl:stylesheet>
