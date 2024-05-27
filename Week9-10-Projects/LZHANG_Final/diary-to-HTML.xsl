<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Diary of Emma Wormwood</title>
                <link rel="stylesheet" type="text/css" href="diaries.css"/>
            </head>
            <body>
                <h1>Diary of Emma Wormwood</h1>
                
                <xsl:for-each select="journal/entries/entry">
                    <div class="entry">
                        <h2>
                            <xsl:apply-templates select="p/date"/>
                        </h2>
                        <p><strong>Mood:</strong> <xsl:value-of select="@mood"/></p>
                        <p><strong>Weather:</strong> <xsl:value-of select="@weather"/></p>
                        <p><strong>People Involved:</strong> <xsl:value-of select="@people"/></p>
                        <p><strong>Time:</strong> <xsl:value-of select="@time"/></p>
                        <p><strong>Status:</strong> <xsl:if test="@complete='true'">Complete</xsl:if><xsl:if test="@complete='false'">Incomplete</xsl:if></p>
                        
                        <xsl:for-each select="p">
                            <p>
                                <xsl:choose>
                                    <xsl:when test="contains(., 'highlight')">
                                        <xsl:attribute name="class">highlight</xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'italic')">
                                        <xsl:attribute name="class">italic</xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:apply-templates/>
                            </p>
                        </xsl:for-each>
                        
                        <xsl:for-each select="pb">
                            <p class="pagebreak">Page Break: <xsl:value-of select="@n"/></p>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for applying templates within paragraphs -->
    <xsl:template match="p">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Template for date elements -->
    <xsl:template match="date">
        <span class="date"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <!-- Template for person elements -->
    <xsl:template match="person">
        <span class="person"><xsl:value-of select="@name"/> (<xsl:value-of select="@relation"/>)</span>
    </xsl:template>
    
    <!-- Template for quote elements -->
    <xsl:template match="quote">
        <span class="quote"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <!-- Template for theme elements -->
    <xsl:template match="theme">
        <span class="theme"><xsl:value-of select="."/></span>
    </xsl:template>
    
    <!-- Template for note elements -->
    <xsl:template match="note">
        <span class="note"><xsl:value-of select="."/></span>
    </xsl:template>
    
</xsl:stylesheet>
