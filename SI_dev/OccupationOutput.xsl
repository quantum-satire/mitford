<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head><title>Digital Mitford Coding School - Site Index: Occupation Info </title></head>
            <body>
                <h1>SECTION ONE - DISTINCT VALUES</h1>
                <h2>Distinct Occupations: ENTIRE FILE</h2>
                <h3>Number of hits: <xsl:value-of select="count(distinct-values(//occupation))"></xsl:value-of></h3>
                <xsl:for-each select="distinct-values(//occupation)">
                    <li><xsl:value-of select="current()"/></li>     
                </xsl:for-each>
                <hr/>
                <h2>Distinct Occupations: Historical People/Organizations ONLY</h2>
                <h3>Number of hits: <xsl:value-of select="count(distinct-values(//div[@type='historical_people']//occupation))"></xsl:value-of></h3>
                <xsl:for-each select="distinct-values(//div[@type='historical_people']//occupation)">
                    <li><xsl:value-of select="current()"/></li>     
                </xsl:for-each>
                <hr/>
                <hr/>
                <h1>SECTION TWO - MIISING/NO OCCUPATION ELEMENT</h1>
                <h2>(Taken from div type="historical_people" ONLY)</h2>
                <h2>The org elements DO NOT CONTAIN an occupation element.</h2>
                <hr/>
                <h2>Person Elements With No Occupation Element<br/>(Listed by xml:id)</h2>
                <h3>Number of hits: <xsl:value-of select="count(//listPerson[@sortKey='histPersons']//person[not(occupation)])"></xsl:value-of></h3>
                <xsl:for-each select="//listPerson[@sortKey='histPersons']//person[not(occupation)]">
                    <li><xsl:value-of select="current()/@xml:id"/></li>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>