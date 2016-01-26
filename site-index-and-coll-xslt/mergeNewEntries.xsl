<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>

<!--ebb: This stylesheet alphabetizes the various kinds of lists in the Digital Mitford site index in a case-insensitive way by @xml:id.-->
    
    <xsl:strip-space elements="*"/>
    <!--ebb: This is needed to remove white space that will sit in place of the element tags we're about to remove. -->


    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="si" select="doc(si.xml)"/>
    <xsl:variable name="siId" select="$si//@xml:id"/>
    <xsl:variable name="newEntriesFile" select="doc(si-Add-LMW.xml)"/>
    <xsl:variable name="newEntriesIds" select="doc(si-Add-LMW.xml)//*[@xml:id[not(. = $siId)]]"/>
    
    <xsl:template match="edition">
        
       <edition><xsl:text> Site Index for the Digital Mitford project. Date: </xsl:text>
        <xsl:value-of select="current-dateTime()"/>
        <xsl:text>. Extracted by Elisa Beshero-Bondar.
        Count of all @xml:ids in the current file: </xsl:text> <xsl:value-of select="count(//@xml:id)"/><xsl:text>. First digital edition in TEI P5, launched on 19 August 2013.</xsl:text>
         </edition>
    </xsl:template>
    
    <xsl:template match="listPerson | listOrg | listPlace | listEvent | list[@type='art'] | listBibl">
        <xsl:if test="$newEntriesIds[parent::*/name() = current()/name()]">
            <xsl:copy-of select="$newEntriesIds"/>
  
        </xsl:if>
        
        
    </xsl:template>
  <!--  <xsl:template match="listPerson">
        <listPerson type="{@type}">
            <xsl:apply-templates select="person">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
        </listPerson>
    </xsl:template>

    <xsl:template match="listOrg">
        <listOrg type="{@type}">
            <xsl:apply-templates select="org">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
        </listOrg>
    </xsl:template>

    <xsl:template match="listPlace">
        <listPlace type="{@type}">
            <xsl:apply-templates select="place">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
        </listPlace>
    </xsl:template>

    <xsl:template match="listEvent">
        <listEvent>
            <xsl:apply-templates select="event">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
        </listEvent>
    </xsl:template>

    <xsl:template match="list[@type='art']">

        <list type="art">
            <item/>
            <xsl:apply-templates select="figure">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
        </list>
    </xsl:template>

    <xsl:template match="listBibl">
       <listBibl type="{@type}">
            <xsl:apply-templates select="bibl">
                <xsl:sort select="lower-case(@xml:id)"/>
            </xsl:apply-templates>
       </listBibl>
    </xsl:template>
-->
</xsl:stylesheet>
